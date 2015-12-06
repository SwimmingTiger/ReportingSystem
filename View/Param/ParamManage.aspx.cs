using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Param_ParamManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Permission.User.CheckPermission(Permission.UserPermission.EDIT_REPORT_PARAMS);
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Exception ex = Server.GetLastError().GetBaseException(); // 获取错误
        string message = "";

        if (ex.Message.IndexOf("The DELETE statement conflicted with the REFERENCE constraint") >= 0) {
            message = "删除失败，该参数已被报表引用。";
        }

        Html.ErrorPage.Show(message);
    }

    protected void paramType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.Parse(paramType.SelectedValue) == (int)Param.ReportParam.Type.PRODUCT) {
            contentView.ActiveViewIndex = 1;
        } else
        {
            contentView.ActiveViewIndex = 0;
        }
    }
}