using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using DB;

/// <summary>
/// 权限管理模块
/// </summary>
namespace Permission
{
    /// <summary>
    /// 用户异常类
    /// </summary>
    public class UserException: Exception {
        public UserException(string msg):base(msg) {
            // 该类没有扩展 Exception 的功能。
            // 该类是为了区分不同类型的异常
        }
    }

    /// <summary>
    /// 用户权限类
    /// </summary>
    public class User
    {
        /// <summary>
        /// 跳转到登录页面
        /// </summary>
        public static void JumpToLoginPage(bool backUrl = true) {
            string url = Param.Website.VIEW_PATH + "/Permission/Login.aspx";

            if (backUrl)
            {
                url += "?backUrl=" + HttpUtility.UrlEncode(HttpContext.Current.Request.Url.AbsolutePath);
            }

            HttpContext.Current.Response.Redirect(url);
        }

        /// <summary>
        /// 跳转回登录前的页面
        /// </summary>
        public static void JumpPageBack()
        {
            String backUrl = HttpContext.Current.Request.Params["backUrl"];

            if (backUrl == null) {
                backUrl = "/";
            }

            HttpContext.Current.Response.Redirect(backUrl);
        }

        /// <summary>
        /// 检查用户是否登录，若未登录，则跳转到登录页面
        /// </summary>
        public static void LoginCheck()
        {
            if (HttpContext.Current.Session["UserId"] == null)
            {
                JumpToLoginPage();
            }
        }

        /// <summary>
        /// 获取用户id
        /// </summary>
        /// <returns></returns>
        public static int GetId() {
            int id = 0;

            if (HttpContext.Current.Session["UserId"] != null) {
                id = (int)HttpContext.Current.Session["UserId"];
            }

            return id;
        }

        /// <summary>
        /// 获取用户名
        /// </summary>
        /// <returns></returns>
        public static string GetName() {
            string sql = "SELECT username FROM userinfo WHERE id=@id";
            SqlParam data = new SqlParam { { "@id", GetId() } };
            Database db = new Database();
            SqlDataReader reader = db.Query(sql, data);
            string name = null;

            if (reader.Read()) {
                name = (string)reader["username"];
            }

            reader.Close();
            db.Close();

            return name;
        }

        /// <summary>
        /// 获取权限
        /// </summary>
        /// <returns>用户权限</returns>
        public static int GetPermission()
        {
            string sql = "SELECT permission FROM userinfo WHERE id=@id";
            SqlParam data = new SqlParam { { "@id", GetId() } };
            Database db = new Database();
            SqlDataReader reader = db.Query(sql, data);
            int permission = 0;

            if (reader.Read())
            {
                permission = (int)reader["permission"];
            }

            reader.Close();
            db.Close();

            return permission;
        }

        public static void CheckPermission(params int[] permissions)
        {
            bool pass = true;
            List<string> names = new List<string>();
            int userPermission = GetPermission();
            int needPermission = 0;

            foreach (int permission in permissions)
            {
                if (0 == (userPermission & permission))
                {
                    pass = false;
                    names.Add(UserPermission.GetName(permission));
                    needPermission |= permission;
                }
            }

            if (pass == false)
            {
                string nameStr = string.Join(", ", names.ToArray());
                //跳转到权限错误提示页
                HttpContext.Current.Response.Redirect(Param.Website.VIEW_PATH + "/Permission/Error/PermissionDenied.aspx?permissionId=" + needPermission + "&permission=" + HttpUtility.UrlEncode(nameStr) + "&backUrl=" + HttpUtility.UrlEncode(HttpContext.Current.Request.Url.AbsolutePath));
            }
        }

        public static bool HasPermission(int permission)
        {
            return 0 != (GetPermission() & permission);
        }

        /// <summary>
        /// 32位MD5加密
        /// </summary>
        /// <param name="input">原始内容</param>
        /// <returns>md5值</returns>
        /// <links>http://blog.163.com/m13864039250_1/blog/static/21386524820150231533602/</links>
        private static string HashPassword(string input)
        {
            /*MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();*/

            // 放弃原始算法，改为调用数据库的运算结果

            string md5sum = "";
            string sql = "select right(sys.fn_VarBinToHexStr(hashbytes('MD5', @input)),32) as md5sum";
            SqlParam data = new SqlParam { { "@input", input } };
            Database db = new Database();
            SqlDataReader reader = db.Query(sql, data);

            if (reader.Read()) {
                md5sum = (string)reader["md5sum"];
            }

            reader.Close();
            db.Close();

            return md5sum;
        }

        public static void Login(string username, string password) {
            string sql = "SELECT id,password FROM userinfo WHERE username=@name";
            SqlParam data = new SqlParam { { "@name", username } };
            Database db = new Database();
            SqlDataReader reader = db.Query(sql, data);

            if (!reader.Read()) {
                reader.Close();
                db.Close();
                throw new UserException("用户名不存在");
            }

            string hashedPassword = (string)reader["password"];
            int id = (int)reader["id"];
            reader.Close();
            db.Close();

            if (HashPassword(password) != hashedPassword) {
                throw new UserException("密码错误"+ HashPassword(password) + ", " + hashedPassword);
            }

            HttpContext.Current.Session["UserId"] = id;
            JumpPageBack();
        }

        public static void Exit() {
            HttpContext.Current.Session["UserId"] = null;
            JumpToLoginPage(false);
        }
    }

}