<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParamManage.aspx.cs" Inherits="View_Param_ParamManage" MasterPageFile="~/View/Template/MasterPage.master" %>

<asp:Content ID="title" ContentPlaceHolderID="title" runat="server">
    报表参数管理 - <%= Param.Website.SITE_NAME %>
</asp:Content>

<asp:Content ID="content" ContentPlaceHolderID="content" runat="server">
    <div>
        <asp:LinqDataSource ID="paramTypeDataSource" runat="server" ContextTypeName="Param.ReportParam" EntityTypeName="" TableName="TypeNames"></asp:LinqDataSource>
        
        <asp:DropDownList ID="paramType" runat="server" DataSourceID="paramTypeDataSource" DataTextField="Value" DataValueField="Key" AutoPostBack="True" OnSelectedIndexChanged="paramType_SelectedIndexChanged"></asp:DropDownList>
        
        <asp:MultiView ID="contentView" runat="server" ActiveViewIndex="0">
            <asp:View ID="normalEditView" runat="server">
                <asp:SqlDataSource ID="paramDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [report_param] WHERE [id] = @id" InsertCommand="INSERT INTO [report_param] ([type], [code], [name], [flag]) VALUES (@type, @code, @name, 0)" SelectCommand="SELECT [id], [code], [name] FROM [report_param] WHERE ([type] = @type)" UpdateCommand="UPDATE [report_param] SET [code] = @code, [name] = @name WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="paramType" Name="type" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="code" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="paramType" DefaultValue="0" Name="type" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="code" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="paramListView" runat="server" DataKeyNames="id" DataSourceID="paramDataSource" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="codeLabel" runat="server" Text='<%# Eval("code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="codeLabel" runat="server" Text='<%# Eval("code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                            <td>
                                <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
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
                                <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
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
                                            <th runat="server">编码</th>
                                            <th runat="server">名称</th>
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
            </asp:View>
            <asp:View ID="productEditView" runat="server">
                <asp:SqlDataSource ID="productDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
                    DeleteCommand="DELETE FROM [report_param] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [report_param] ([type], [code], [name], [flag]) VALUES (@type, @code, @name, (@use | @account | @sale | @settlement | @prestore | @notice))" 
                    SelectCommand="SELECT [id], [code], [name], CAST(flag & 1 AS BIT) as [use], CAST(flag & 2 AS BIT) as [account], CAST(flag & 4 AS BIT) as [sale], CAST(flag & 8 AS BIT) as [settlement], CAST(flag & 16 AS BIT) as [prestore], CAST(flag & 32 AS BIT) as [notice] FROM [report_param] WHERE ([type] = @type)" 
                    UpdateCommand="UPDATE [report_param] SET [code] = @code, [name] = @name, [flag] = (@use | @account * 2 | @sale * 4 | @settlement * 8 | @prestore * 16 | @notice * 32) WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="paramType" Name="type" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="code" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="paramType" DefaultValue="0" Name="type" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="code" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="productListView" runat="server" DataKeyNames="id" DataSourceID="productDataSource" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="codeLabel" runat="server" Text='<%# Eval("code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="use" runat="server"  Checked='<%# Eval("use") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="account" runat="server"  Checked='<%# Eval("account") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="sale" runat="server"  Checked='<%# Eval("sale") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="settlement" runat="server"  Checked='<%# Eval("settlement") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="prestore" runat="server"  Checked='<%# Eval("prestore") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="notice" runat="server"  Checked='<%# Eval("notice") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="codeLabel" runat="server" Text='<%# Eval("code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="use" runat="server"  Checked='<%# Eval("use") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="account" runat="server"  Checked='<%# Eval("account") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="sale" runat="server"  Checked='<%# Eval("sale") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="settlement" runat="server"  Checked='<%# Eval("settlement") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="prestore" runat="server"  Checked='<%# Eval("prestore") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:CheckBox ID="notice" runat="server"  Checked='<%# Eval("notice") %>' onclick="return false" />
                            </td>
                            <td>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                            <td>
                                <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="use" runat="server"  Checked='<%# Bind("use") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="account" runat="server"  Checked='<%# Bind("account") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="sale" runat="server"  Checked='<%# Bind("sale") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="settlement" runat="server"  Checked='<%# Bind("settlement") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="prestore" runat="server"  Checked='<%# Bind("prestore") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="notice" runat="server"  Checked='<%# Bind("notice") %>' />
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
                                <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="use" runat="server"  Checked='<%# Bind("use") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="account" runat="server"  Checked='<%# Bind("account") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="sale" runat="server"  Checked='<%# Bind("sale") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="settlement" runat="server"  Checked='<%# Bind("settlement") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="prestore" runat="server"  Checked='<%# Bind("prestore") %>' />
                            </td>
                            <td>
                                <asp:CheckBox ID="notice" runat="server"  Checked='<%# Bind("notice") %>' />
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
                                            <th runat="server">编码</th>
                                            <th runat="server">名称</th>
                                            <th runat="server">是否使用</th>
                                            <th runat="server">是否出账收入</th>
                                            <th runat="server">是否卡销售</th>
                                            <th runat="server">是否网间结算</th>
                                            <th runat="server">是否预存转收入</th>
                                            <th runat="server">是否通知单</th>
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
            </asp:View>
        </asp:MultiView>
        
    </div>
</asp:Content>
