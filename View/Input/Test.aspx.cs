using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;

public partial class View_Input_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnSelectedIndexChanged_data_cardsale(object sender, EventArgs e)
    {
        RadioButtonList downlist = (RadioButtonList)sender;
        ListViewDataItem o = downlist.Parent as ListViewDataItem;

        int status = int.Parse(downlist.SelectedValue);
        int id = int.Parse((o.FindControl("idLabel") as Label).Text);

        String sql = "UPDATE [data_cardsale] SET [status] = @status WHERE [id] = @id";
        SqlParam data = new SqlParam { { "@id", id }, { "@status", status } };

        Database db = new Database();
        db.Exec(sql, data);
        db.Close();
    }
}