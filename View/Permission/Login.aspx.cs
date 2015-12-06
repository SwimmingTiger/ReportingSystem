using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try {
            Permission.User.Login(username.Text, password.Text);
        }
        catch (Exception ex) {
            Notice.Text = ex.Message;
        }
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Html.ErrorPage.Show();
    }
}