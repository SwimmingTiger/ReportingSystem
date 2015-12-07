using DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace Output
{
    /// <summary>
    /// 导出CSV
    /// </summary>
    public class ExportCSV
    {
        protected static Dictionary<string, Dictionary<string, string[]>> reportFields;

        protected DataTable dv;
        protected string tableName;

        protected HttpResponse Response = HttpContext.Current.Response;

        static ExportCSV() {
            reportFields = new Dictionary<string, Dictionary<string, string[]>>();
            reportFields.Add("data_account", new Dictionary<string, string[]> {
                { "month", new string[] { "出账月份", "date", "{0:yyyy-MM}" } },
                { "city", new string[] { "地市", "param" } },
                { "product", new string[] { "产品", "param" } },
                { "type", new string[] { "出账类型", "param" } },
                { "money", new string[] { "出账金额", "money" } }
            });
            reportFields.Add("data_cardsale", new Dictionary<string, string[]> {
                { "date", new string[] { "销售日期", "date", "{0:yyyy-MM-dd}" } },
                { "city", new string[] { "地市", "param" } },
                { "product", new string[] { "产品", "param" } },
                { "number", new string[] { "卡销售数量", "int" } },
                { "unit_price", new string[] { "面值金额", "money" } },
                { "total_price", new string[] { "总金额", "money" } },
                { "final_price", new string[] { "实售金额", "money" } }
            });
            reportFields.Add("data_notice", new Dictionary<string, string[]> {
                { "date", new string[] { "营业收款日期", "date", "{0:yyyy-MM-dd}" } },
                { "city", new string[] { "地市", "param" } },
                { "product", new string[] { "产品", "param" } },
                { "type", new string[] { "通知单类型", "param" } },
                { "money", new string[] { "营业收入金额", "money" } }
            });
            reportFields.Add("data_prestore", new Dictionary<string, string[]> {
                { "date", new string[] { "销账日期", "date", "{0:yyyy-MM-dd}" } },
                { "city", new string[] { "地市", "param" } },
                { "product", new string[] { "产品", "param" } },
                { "type", new string[] { "销账类型", "param" } },
                { "money", new string[] { "销账金额", "money" } }
            });
            reportFields.Add("data_settlement", new Dictionary<string, string[]> {
                { "month", new string[] { "结算月份", "date", "{0:yyyy-MM}" } },
                { "city", new string[] { "地市", "param" } },
                { "product", new string[] { "产品", "param" } },
                { "operator", new string[] { "结算运营商", "param" } },
                { "type", new string[] { "结算类型", "param" } },
                { "money", new string[] { "结算金额", "money" } }
            });
        }

        public ExportCSV(DataTable dv, string tableName)
        {
            this.dv = dv;
            this.tableName = tableName;
        }

        public void run() {
            clearCache();
            sendHttpHeader();
            printTitle();
            printData();
            finishOutput();
        }

        protected void clearCache() {
            Response.Clear();
        }

        protected void sendHttpHeader() {
            string csvName = DataProvider.ReportTables[tableName] + ".csv";
            //Response.ContentType = "text/plain";
            Response.ContentType = "text/comma-separated-values";
            Response.AddHeader("Content-Disposition", "attachment;filename="+csvName);
            Response.ContentEncoding = Encoding.GetEncoding("UTF-8");
        }

        protected void printLine(string[] line) {
            /* CVS规则：
             * 1 开头是不留空，以行为单位。
             * 2 可含或不含列名，含列名则居文件第一行。
             * 3 一行数据不跨行，无空行。
             * 4 以半角逗号（即,）作分隔符，列为空也要表达其存在。
             * 5 列内容如存在半角逗号（即,）则用半角双引号（即""）将该字段值包含起来。
             * 6 列内容如存在半角引号（即"）则应替换成半角双引号（""）转义，并用半角引号（即""）将该字段值包含起来。
             * 7 文件读写时引号，逗号操作规则互逆。
             * 8 内码格式不限，可为 ASCII、Unicode 或者其他。
             * 9 不支持特殊字符
             */

            for (int i = 0; i < line.Count(); i++)
            {
                string text = line[i];
                bool addQuote = false;

                if (text.IndexOf(",") >= 0) {
                    addQuote = true;
                }

                if (text.IndexOf("\"") >= 0) {
                    text = text.Replace("\"", "\"\"");
                    addQuote = true;
                }

                if (addQuote) {
                    line[i] = "\"" + text + "\"";
                }
            }

            string lineText = string.Join(",", line.ToArray());
            lineText += "\r\n";

            Response.Write(lineText);
        }

        protected void printTitle() {
            List<string> line = new List<string>();
            Dictionary<string, string[]> fields = reportFields[tableName];

            foreach (string key in fields.Keys)
            {
                line.Add(fields[key][0]);
            }

            printLine(line.ToArray());
        }

        protected void printData() {
            Dictionary<string, string[]> fields = reportFields[tableName];

            foreach (DataRow row in dv.Rows) {
                List<string> line = new List<string>();

                foreach (string key in fields.Keys) {
                    line.Add(fieldToString(row[key], fields[key]));
                }

                printLine(line.ToArray());
            }
        }

        protected void finishOutput() {
            Response.Flush();
            Response.End();
        }

        protected string getParamName(int id) {
            string sql = "select name from report_param where id=@id";
            string name = "";

            Database db = new Database();
            SqlDataReader reader = db.Query(sql, new SqlParam { { "@id", id } });

            if (reader.Read())
            {
                name = reader["name"] as string;
            }
            else {
                name = "id: " + id.ToString();
            }

            reader.Close();
            db.Close();

            return name;
        }

        protected string fieldToString(object field, string[] param) {
            string name = "";
            string type = param[1];

            switch (type)
            {
                case "date":
                    name = string.Format(param[2], field);
                    break;
                case "param":
                    name = getParamName((int)field);
                    break;
                case "money":
                    name = field.ToString();
                    break;
                case "int":
                    name = field.ToString();
                    break;
                default:
                    name = field.ToString();
                    break;
            }

            return name;
        }
    }
}