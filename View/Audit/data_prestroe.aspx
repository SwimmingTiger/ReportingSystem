<%@ Page Language="C#" AutoEventWireup="true" CodeFile="data_prestroe.aspx.cs" Inherits="View_Audit_data_prestroe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_prestore]"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' visible="false"/>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                             SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="SelectedIndexChanged">
                            <asp:ListItem Value="1">== 未稽核 ==</asp:ListItem>
                            <asp:ListItem Value="0">== 正常 ==</asp:ListItem>
                            <asp:ListItem Value="2">== 有错误 ==</asp:ListItem>
                        </asp:DropDownList>    
                    </td>
                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' visible="false"/>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                        <asp:SqlDataSource ID="SqlDataSource6" 
                            runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                             SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="SelectedIndexChanged">
                            <asp:ListItem Value="1">== 未稽核 ==</asp:ListItem>
                            <asp:ListItem Value="0">== 正常 ==</asp:ListItem>
                            <asp:ListItem Value="2">== 有错误 ==</asp:ListItem>
                        </asp:DropDownList>    
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">id</th>
                                    <th runat="server">date</th>
                                    <th runat="server">city</th>
                                    <th runat="server">product</th>
                                    <th runat="server">type</th>
                                    <th runat="server">money</th>
                                    <th runat="server">status</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            
        </asp:ListView>
    </form>
</body>
</html>
