<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="View_Input_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_account]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:TemplateField HeaderText="product" SortExpression="product">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("product") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                           <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                            
                            
                        </asp:ListView>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="money" HeaderText="money" SortExpression="money" />
                <asp:TemplateField HeaderText="status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"
                                     SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_cardsale">

                            <asp:ListItem Value="0">正常</asp:ListItem>
                            <asp:ListItem Value="2">错误</asp:ListItem>
                            <asp:ListItem Value="1">未稽核</asp:ListItem>

                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
            
            </Columns>
        </asp:GridView>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' />
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"
                                     SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_cardsale">

                            <asp:ListItem Value="0">正常</asp:ListItem>
                            <asp:ListItem Value="2">错误</asp:ListItem>
                            <asp:ListItem Value="1">未稽核</asp:ListItem>

                        </asp:RadioButtonList>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="monthTextBox" runat="server" Text='<%# Bind("month") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="productTextBox" runat="server" Text='<%# Bind("product") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="monthTextBox" runat="server" Text='<%# Bind("month") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="productTextBox" runat="server" Text='<%# Bind("product") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                    
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' />
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"
                                     SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_cardsale">

                            <asp:ListItem Value="0">正常</asp:ListItem>
                            <asp:ListItem Value="2">错误</asp:ListItem>
                            <asp:ListItem Value="1">未稽核</asp:ListItem>

                        </asp:RadioButtonList>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">id</th>
                                    <th runat="server">month</th>
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
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
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
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' />
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

    </form>
</body>
</html>
