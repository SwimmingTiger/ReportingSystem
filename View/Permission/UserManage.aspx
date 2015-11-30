<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="View_Permission_UserManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="mainForm" runat="server">
    <div>
        <asp:SqlDataSource ID="userSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            DeleteCommand="DELETE FROM [userinfo] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [userinfo] ([username], [password], [permission]) VALUES (@username, right(sys.fn_VarBinToHexStr(hashbytes('MD5', @password)),32), (@edit_reports | @audit_reports * 2 | @read_reports * 4 | @edit_user * 8 | @edit_report_params * 16 | @read_log * 32))" 
            SelectCommand="SELECT [id], [username], '' AS [password], CAST(permission & 1 AS BIT) as [edit_reports], CAST(permission & 2 AS BIT) as [audit_reports], CAST(permission & 4 AS BIT) as [read_reports], CAST(permission & 8 AS BIT) as [edit_user], CAST(permission & 16 AS BIT) as [edit_report_params], CAST(permission & 32 AS BIT) as [read_log] FROM [userinfo]" 
            UpdateCommand="if (@password != '')
                               UPDATE [userinfo] SET [username] = @username, [password] = right(sys.fn_VarBinToHexStr(hashbytes('MD5', @password)),32), [permission] = (@edit_reports | @audit_reports * 2 | @read_reports * 4 | @edit_user * 8 | @edit_report_params * 16 | @read_log * 32) WHERE [id] = @id
                           else
                               UPDATE [userinfo] SET [username] = @username, [permission] = (@edit_reports | @audit_reports * 2 | @read_reports * 4 | @edit_user * 8 | @edit_report_params * 16 | @read_log * 32) WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:ListView ID="userListView" runat="server" DataKeyNames="id" DataSourceID="userSqlDataSource" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='******' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_reportsCheckBox" runat="server" Checked='<%# Eval("edit_reports") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="audit_reportsCheckBox" runat="server" Checked='<%# Eval("audit_reports") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_reportsCheckBox" runat="server" Checked='<%# Eval("read_reports") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_userCheckBox" runat="server" Checked='<%# Eval("edit_user") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_report_paramsCheckBox" runat="server" Checked='<%# Eval("edit_report_params") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_logCheckBox" runat="server" Checked='<%# Eval("read_log") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='******' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_reportsCheckBox" runat="server" Checked='<%# Eval("edit_reports") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="audit_reportsCheckBox" runat="server" Checked='<%# Eval("audit_reports") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_reportsCheckBox" runat="server" Checked='<%# Eval("read_reports") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_userCheckBox" runat="server" Checked='<%# Eval("edit_user") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_report_paramsCheckBox" runat="server" Checked='<%# Eval("edit_report_params") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_logCheckBox" runat="server" Checked='<%# Eval("read_log") %>' onclick="return false" />
                    </td>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' placeholder="留空不更改" />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_reportsCheckBox" runat="server" Checked='<%# Bind("edit_reports") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="audit_reportsCheckBox" runat="server" Checked='<%# Bind("audit_reports") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_reportsCheckBox" runat="server" Checked='<%# Bind("read_reports") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_userCheckBox" runat="server" Checked='<%# Bind("edit_user") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_report_paramsCheckBox" runat="server" Checked='<%# Bind("edit_report_params") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_logCheckBox" runat="server" Checked='<%# Bind("read_log") %>' />
                    </td>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="保存" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>暂无数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_reportsCheckBox" runat="server" Checked='<%# Bind("edit_reports") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="audit_reportsCheckBox" runat="server" Checked='<%# Bind("audit_reports") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_reportsCheckBox" runat="server" Checked='<%# Bind("read_reports") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_userCheckBox" runat="server" Checked='<%# Bind("edit_user") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="edit_report_paramsCheckBox" runat="server" Checked='<%# Bind("edit_report_params") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="read_logCheckBox" runat="server" Checked='<%# Bind("read_log") %>' />
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="保存" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">用户名</th>
                                    <th runat="server">密码</th>
                                    <th runat="server">录入报表</th>
                                    <th runat="server">稽核报表</th>
                                    <th runat="server">查看报表</th>
                                    <th runat="server">编辑用户</th>
                                    <th runat="server">编辑报表参数</th>
                                    <th runat="server">查看日志</th>
                                    <th runat="server">操作</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="50">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
