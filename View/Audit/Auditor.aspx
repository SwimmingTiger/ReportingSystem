<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webView.aspx.cs" Inherits="webView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 461px;
            width: 728px;
        }
    </style>
</head>

<body style="height: 547px; width: 1016px">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_cardsale]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:TemplateField HeaderText="city" SortExpression="city">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
                <asp:BoundField DataField="number" HeaderText="number" SortExpression="number" />
                <asp:BoundField DataField="unit_price" HeaderText="unit_price" SortExpression="unit_price" />
                <asp:BoundField DataField="final_price" HeaderText="final_price" SortExpression="final_price" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
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
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' />
                    </td>
                    <td>
                        <asp:Label ID="numberLabel" runat="server" Text='<%# Eval("number") %>' />
                    </td>
                    <td>
                        <asp:Label ID="unit_priceLabel" runat="server" Text='<%# Eval("unit_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="final_priceLabel" runat="server" Text='<%# Eval("final_price") %>' />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="1">== 未稽核 ==</asp:ListItem>
                            <asp:ListItem Value="0">== 正常 ==</asp:ListItem>
                            <asp:ListItem Value="2">== 有错误 ==</asp:ListItem>
                        </asp:DropDownList>                       
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="productTextBox" runat="server" Text='<%# Bind("product") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="numberTextBox" runat="server" Text='<%# Bind("number") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="unit_priceTextBox" runat="server" Text='<%# Bind("unit_price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="final_priceTextBox" runat="server" Text='<%# Bind("final_price") %>' />
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
                        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="productTextBox" runat="server" Text='<%# Bind("product") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="numberTextBox" runat="server" Text='<%# Bind("number") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="unit_priceTextBox" runat="server" Text='<%# Bind("unit_price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="final_priceTextBox" runat="server" Text='<%# Bind("final_price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' Visible="False" />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' />
                    </td>
                    <td>
                        <asp:Label ID="numberLabel" runat="server" Text='<%# Eval("number") %>' />
                    </td>
                    <td>
                        <asp:Label ID="unit_priceLabel" runat="server" Text='<%# Eval("unit_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="final_priceLabel" runat="server" Text='<%# Eval("final_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true">
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
                                    <th runat="server">number</th>
                                    <th runat="server">unit_price</th>
                                    <th runat="server">final_price</th>
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
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' />
                    </td>
                    <td>
                        <asp:Label ID="numberLabel" runat="server" Text='<%# Eval("number") %>' />
                    </td>
                    <td>
                        <asp:Label ID="unit_priceLabel" runat="server" Text='<%# Eval("unit_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="final_priceLabel" runat="server" Text='<%# Eval("final_price") %>' />
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
