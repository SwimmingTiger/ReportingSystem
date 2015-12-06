using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error_PermissionDenied : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int needPermission = int.Parse(Request.Params["permissionId"]);

            if (Permission.User.HasPermission(needPermission))
            {
                Response.Redirect(Request.Params["backUrl"]);
            }

            permission.Text = Request.Params["permission"];
        }
        catch (Exception)
        {
            // 未给出缺少的权限信息，可能是异常掉线
            Response.Redirect("/");
        }
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Html.ErrorPage.Show();
    }
}