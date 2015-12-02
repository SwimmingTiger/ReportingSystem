using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;

public partial class View_Audit_data_settlement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SelectedIndexChanged(object sender, EventArgs e)
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
        string sql = "UPDATE [data_settleme] SET [status] = @status WHERE [id] = @id";

        Database db = new Database();
        db.Exec(sql, data);
        db.Close();
    }
}