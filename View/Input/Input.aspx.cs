using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Input : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        
    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {

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





    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

    }

    protected void ListView3_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void SqlDataSource10_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ListView4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource9_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void statusLabel_Load(object sender, EventArgs e)
    {
        
        Label statusLabel = sender as Label;
        ListViewDataItem item = statusLabel.Parent as ListViewDataItem;

        if (int.Parse(statusLabel.Text) == (int)Param.ReportStatus.NORMAL)
        {
            statusLabel.Text = "已稽核";
            Button EditButton = item.FindControl("EditButton") as Button;
            EditButton.Visible = false;
        }
        else if (int.Parse(statusLabel.Text) == (int)Param.ReportStatus.UNCHECKED)
        {
            statusLabel.Text = "未稽核";
        }
        else {
            statusLabel.Text = "错误";
        }
        
    }
}