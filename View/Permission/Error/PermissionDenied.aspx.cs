﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error_PermissionDenied : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        permission.Text = Request.Params["permission"];
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Html.ErrorPage.Show();
    }
}