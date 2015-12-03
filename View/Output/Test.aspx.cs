using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Output_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        isNOTICE.Text = ((int)Param.ReportParam.Flag.Product.NOTICE).ToString();
        isProduct.Text = ((int)Param.ReportParam.Type.PRODUCT).ToString();
    }
}