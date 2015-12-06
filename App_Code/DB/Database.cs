using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace DB
{

    /// <summary>
    /// 预处理参数字典
    /// 
    /// string：参数名，如 "@id"
    /// object：参数值，如 5
    /// </summary>
    public class SqlParam : Dictionary<string, object>
    {
        // 该类没有扩展 Dictionary<string, object> 的功能。
        // 该类是 Dictionary<string, object> 的一个别名。
    }

    /// <summary>
    /// 数据库操作类
    /// </summary>
    public class Database
    {
        protected SqlConnection conn = null;

        public Database()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
            conn.Open();
        }

        public void Close()
        {
            try
            {
                conn.Close();
            }
            finally {
                // ignore
            }
        }

        ~Database()
        {
            Close();
        }

        /// <summary>
        /// 执行查询并返回结果
        /// </summary>
        /// <param name="sql">查询语句</param>
        /// <returns>结果集</returns>
        public SqlDataReader Query(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            return reader;
        }

        protected SqlCommand Prepare(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Prepare();

            return cmd;
        }

        protected void BindParams(SqlCommand cmd, SqlParam parameters)
        {

            foreach (KeyValuePair<string, object> param in parameters)
            {
                //绑定参数
                cmd.Parameters.AddWithValue(param.Key, param.Value);
            }
        }

        /// <summary>
        /// 执行预处理查询并返回结果
        /// </summary>
        /// <param name="sql">预处理语句</param>
        /// <param name="parameters">绑定的参数</param>
        /// <returns>结果集</returns>
        public SqlDataReader Query(string sql, SqlParam parameters)
        {
            SqlCommand cmd = Prepare(sql);
            BindParams(cmd, parameters);
            SqlDataReader reader = cmd.ExecuteReader();

            return reader;
        }

        /// <summary>
        /// 执行更新操作，返回受影响行数
        /// </summary>
        /// <param name="sql">更新语句</param>
        /// <returns>受影响行数</returns>
        public int Exec(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            int effectLines = cmd.ExecuteNonQuery();

            return effectLines;
        }

        /// <summary>
        /// 执行预处理更新操作，返回受影响行数
        /// </summary>
        /// <param name="sql">更新语句</param>
        /// <returns>受影响行数</returns>
        public int Exec(string sql, SqlParam parameters)
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            BindParams(cmd, parameters);
            int effectLines = cmd.ExecuteNonQuery();

            return effectLines;
        }
    }
}