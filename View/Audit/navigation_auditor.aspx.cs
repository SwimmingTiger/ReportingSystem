using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;

public partial class View_Audit_navigation_auditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Permission.UserPermission.Check(Permission.UserPermission.AUDIT_REPORTS);
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Html.ErrorPage.Show();
    }

    protected void OnSelectedIndexChanged_data_account(object sender, EventArgs e)
    {
        DropDownList downlist = (DropDownList)sender;
        ListViewDataItem o = downlist.Parent as ListViewDataItem;

        int status = int.Parse(downlist.SelectedValue);
        int id = int.Parse((o.FindControl("idLabel") as Label).Text);

        String sql = "UPDATE [data_account] SET [status] = @status WHERE [id] = @id";
        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };

        Database db = new Database();
        db.Exec(sql, data);
        db.Close();
    }

    protected void OnSelectedIndexChanged_data_cardsale(object sender, EventArgs e)
    {
        DropDownList n = (DropDownList)sender;
        ListViewDataItem o = n.Parent as ListViewDataItem;

        int status = int.Parse(n.SelectedValue);
        int id = int.Parse((o.FindControl("idLabel") as Label).Text);

        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };
        string sql = "UPDATE [data_cardsale] SET [status] = @status WHERE [id] = @id";

        Database db = new Database();
        db.Exec(sql, data);
        db.Close();
    }

    protected void OnSelectedIndexChanged_data_notice(object sender, EventArgs e)
    {
        DropDownList n = (DropDownList)sender;
        ListViewDataItem o = n.Parent as ListViewDataItem;

        int status = int.Parse(n.SelectedValue);
        int id = int.Parse((o.FindControl("idLabel") as Label).Text);

        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };
        string sql = "UPDATE [data_notice] SET [status] = @status WHERE [id] = @id";

        Database db = new Database();
        db.Exec(sql, data);
        db.Close();
    }
 
    protected void OnSelectedIndexChanged_data_prestroe(object sender, EventArgs e)
    {
        DropDownList n = (DropDownList)sender;
        ListViewDataItem o = n.Parent as ListViewDataItem;

        int status = int.Parse(n.SelectedValue);
        int id = int.Parse((o.FindControl("idLabel") as Label).Text);

        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };
        string sql = "UPDATE [data_prestore] SET [status] = @status WHERE [id] = @id";

        Database db = new Database();
        int line = db.Exec(sql, data);
        db.Close();
    }

    protected void SelectedIndexChanged_datasettlement(object sender, EventArgs e)
    {
        DropDownList n = (DropDownList)sender;
        ListViewDataItem o = n.Parent as ListViewDataItem;

        int status = int.Parse(n.SelectedValue);
        int id = int.Parse((o.FindControl("idLabel") as Label).Text);
        /***
                Dictionary<int, int> a = new Dictionary<int, int>();
                a.Add(1, 100);
                a.Add(5, 800);

                Dictionary<int, int> b = new Dictionary<int, int> { { 1, 100 }, { 5, 800 } };

        */
        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };
        string sql = "UPDATE [data_settlement] SET [status] = @status WHERE [id] = @id";

        Database db = new Database();
        db.Exec(sql, data);
        db.Close();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 0;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 1;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 2;
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 3;
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 4;
    }
}