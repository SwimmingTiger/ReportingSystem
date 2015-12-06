using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Html
{
    /// <summary>
    /// 错误提示页
    /// </summary>
    public class ErrorPage
    {
        public static void Show(string message = "")
        {
            Exception ex = HttpContext.Current.Server.GetLastError().GetBaseException(); // 获取错误

            if (message == "")
            {
                message = "<p>未知错误：" + ex.Message + "</p>";
            }

            HttpContext.Current.Response.Write("<!doctype html>");
            HttpContext.Current.Response.Write("<head>");
            HttpContext.Current.Response.Write("<meta charset=\"utf-8\" />");
            HttpContext.Current.Response.Write("<title>出错啦！</title>");
            HttpContext.Current.Response.Write("</head>");
            HttpContext.Current.Response.Write("<body>");
            HttpContext.Current.Response.Write(message);
            HttpContext.Current.Response.Write("<a href=\"#\" onclick=\"history.back()\">返回</a>");
            HttpContext.Current.Response.Write("</body>");

            HttpContext.Current.Server.ClearError();
        }
    }
}