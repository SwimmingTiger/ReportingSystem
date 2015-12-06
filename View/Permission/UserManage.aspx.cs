using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Permission_UserManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Permission.User.CheckPermission(Permission.UserPermission.EDIT_USER);
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Exception ex = Server.GetLastError().GetBaseException(); // 获取错误
        string message = "";

        if (ex.Message.IndexOf("Cannot insert the value NULL into column 'password'") >= 0)
        {
            message = "密码不能为空。";
        }
        else if (ex.Message.IndexOf("Cannot insert the value NULL into column 'username'") >= 0) {
            message = "用户名不能为空。";
        }

        Html.ErrorPage.Show(message);
    }
}