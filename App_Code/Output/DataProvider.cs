using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DB;
using Param;
using System.Data.SqlClient;

namespace Output
{
    /// <summary>
    /// 报表数据提供类
    /// </summary>
    public class DataProvider
    {
        /// <summary>
        /// 返回指定数据表指定日期字段中年份的范围，若表中无数据，则返回(0, -1)
        /// </summary>
        /// <param name="table">表名</param>
        /// <param name="field">字段名</param>
        /// <returns>Tuple<int, int>(最小年份, 最大年份)，若表中无数据，返回(0, -1)</returns>
        public static Tuple<int, int> dateRange(string table, string field) {
            int min = 0;
            int max = -1;

            string sql = "select min(year(" + field + ")) as [min], max(year(" + field + ")) as [max] from " + table;

            Database db = new Database();
            SqlDataReader reader = db.Query(sql);

            if (reader.Read()) {
                if (!(reader["min"] is DBNull) && !(reader["max"] is DBNull))
                {
                    min = (int)reader["min"];
                    max = (int)reader["max"];
                }
            }

            reader.Close();
            db.Close();

            return new Tuple<int, int>(min, max);
        }

        public static readonly Dictionary<string, string> ReportTables = new Dictionary<string, string>
        {
            { "data_account", "出账收入报表" },
            { "data_cardsale", "卡销售收入报表" },
            { "data_notice", "通知单收入报表" },
            { "data_prestore", "预存转收入报表" },
            { "data_settlement", "网间结算报表" },
        };

        public static readonly Dictionary<string, string> ReportDateFields = new Dictionary<string, string>
        {
            { "data_account", "month" },
            { "data_cardsale", "date" },
            { "data_notice", "date" },
            { "data_prestore", "date" },
            { "data_settlement", "month" },
        };

        public static readonly Dictionary<string, int> ReportTypeFields = new Dictionary<string, int>
        {
            { "data_account", (int)ReportParam.Type.ACCOUNT },
            { "data_notice", (int)ReportParam.Type.NOTICE_LETTER },
            { "data_prestore", (int)ReportParam.Type.RECONCILIATION },
            { "data_settlement", (int)ReportParam.Type.SEETLEMENT_TYPE },
        };

        public static readonly Dictionary<string, int> ReportProductFlags = new Dictionary<string, int>
        {
            { "data_account", (int)ReportParam.Flag.Product.ACCOUNT },
            { "data_cardsale", (int)ReportParam.Flag.Product.SALE },
            { "data_notice", (int)ReportParam.Flag.Product.NOTICE },
            { "data_prestore", (int)ReportParam.Flag.Product.PRESTORE },
            { "data_settlement", (int)ReportParam.Flag.Product.SETTLEMENT },
        };
    }
}