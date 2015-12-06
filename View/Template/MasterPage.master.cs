using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Permission;
using Param;

public partial class MasterPage : System.Web.UI.MasterPage
{
    static readonly Dictionary<string, int> MenuPermissions = new Dictionary<string, int>
    {
        { "手工录入", UserPermission.EDIT_REPORTS },
        { "收款稽核", UserPermission.AUDIT_REPORTS },
        { "数据归集", UserPermission.READ_REPORTS },
        { "参数管理", UserPermission.EDIT_REPORT_PARAMS },
        { "权限管理", UserPermission.EDIT_USER }
    };

    static readonly Dictionary<string, string> MenuItems = new Dictionary<string, string>
    {
        { "首页", "/" },
        { "手工录入", Website.VIEW_PATH + "/Input/Input.aspx" },
        { "收款稽核", Website.VIEW_PATH + "/Audit/Auditor.aspx" },
        { "数据归集", Website.VIEW_PATH + "/Output/Browse.aspx" },
        { "参数管理", Website.VIEW_PATH + "/Param/ParamManage.aspx" },
        { "权限管理", Website.VIEW_PATH + "/Permission/UserManage.aspx" }
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        Permission.User.LoginCheck();

        foreach (KeyValuePair<string, string> item in MenuItems) {
            if (MenuPermissions.ContainsKey(item.Key) == false || User.HasPermission(MenuPermissions[item.Key]) == true) {
                NavMenu.Items.Add(new MenuItem(item.Key, item.Value));
            }
        }
    }

    protected void NavMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        HttpContext.Current.Response.Redirect(NavMenu.SelectedValue);
    }

    protected void Exit_Click(object sender, EventArgs e)
    {
        Permission.User.Exit();
    }
}
