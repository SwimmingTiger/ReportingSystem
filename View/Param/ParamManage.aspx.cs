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