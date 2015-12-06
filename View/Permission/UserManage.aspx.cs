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
        Permission.UserPermission.Check(Permission.UserPermission.EDIT_USER);
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Html.ErrorPage.Show();
    }
}