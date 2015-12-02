using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;

public partial class View_Audit_data_prestroe : System.Web.UI.Page
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
    
        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };
        string sql = "UPDATE [data_prestore] SET [status] = @status WHERE [id] = @id";

        Database db = new Database();
        int line = db.Exec(sql, data);
        db.Close();
    }
}