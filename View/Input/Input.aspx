<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Input.aspx.cs" Inherits="Input" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>"
             SelectCommand="SELECT [id], [date_input], [city_encode], [product_encode], [cardsell_amount], [face_value], [card_totalamount] FROM [cardsell]"
             DeleteCommand="DELETE FROM [cardsell] WHERE [id] = @original_id"
             InsertCommand="INSERT INTO [cardsell] ([date_input], [city_encode], [product_encode], [cardsell_amount], [face_value], [card_totalamount], [status]) VALUES (@date_input, @city_encode, @product_encode, @cardsell_amount, @face_value, @card_totalamount, 1)" 
             OldValuesParameterFormatString="original_{0}"
             UpdateCommand="UPDATE [cardsell] SET [date_input] = @date_input, [city_encode] = @city_encode, [product_encode] = @product_encode, [cardsell_amount] = @cardsell_amount, [face_value] = @face_value, [card_totalamount] = @card_totalamount WHERE [id] = @original_id">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="date_input" />
                <asp:Parameter Name="city_encode" Type="Int32" />
                <asp:Parameter Name="product_encode" Type="Int32" />
                <asp:Parameter Name="cardsell_amount" Type="Int32" />
                <asp:Parameter Name="face_value" Type="Decimal" />
                <asp:Parameter Name="card_totalamount" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="date_input" />
                <asp:Parameter Name="city_encode" Type="Int32" />
                <asp:Parameter Name="product_encode" Type="Int32" />
                <asp:Parameter Name="cardsell_amount" Type="Int32" />
                <asp:Parameter Name="face_value" Type="Decimal" />
                <asp:Parameter Name="card_totalamount" Type="Decimal" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
        </asp:Repeater>


        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem">
            <ItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        wu~<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="date_inputLabel" runat="server" Text='<%# Eval("date_input") %>' />
                    </td>
                    <td>
                        <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' Visible="False" />
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [type], [code], [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="city_encodeLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cardsell_amountLabel" runat="server" Text='<%# Eval("cardsell_amount") %>' />
                    </td>
                    <td>
                        <asp:Label ID="face_valueLabel" runat="server" Text='<%# Eval("face_value") %>' />
                    </td>
                    <td>
                        <asp:Label ID="card_totalamountLabel" runat="server" Text='<%# Eval("card_totalamount") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <asp:DataList ID="DataList1" runat="server"></asp:DataList>
                    </td>
                    <td>
                        <asp:TextBox ID="date_inputTextBox" runat="server" Text='<%# Bind("date_input") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cardsell_amountTextBox" runat="server" Text='<%# Bind("cardsell_amount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="face_valueTextBox" runat="server" Text='<%# Bind("face_value") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="card_totalamountTextBox" runat="server" Text='<%# Bind("card_totalamount") %>' />
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
                        <asp:TextBox ID="date_inputTextBox" runat="server" Text='<%# Bind("date_input") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cardsell_amountTextBox" runat="server" Text='<%# Bind("cardsell_amount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="face_valueTextBox" runat="server" Text='<%# Bind("face_value") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="card_totalamountTextBox" runat="server" Text='<%# Bind("card_totalamount") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <AlternatingItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        wo~<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        
                    </td>
                    <td>
                        <asp:Label ID="date_inputLabel" runat="server" Text='<%# Eval("date_input") %>' />
                    </td>
                    
                    <td>
                        <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' Visible="False"/>
                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [type], [code], [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="city_encodeLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                        </asp:ListView>
                    </td>

         
                    
                    <td>
                        <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cardsell_amountLabel" runat="server" Text='<%# Eval("cardsell_amount") %>' />
                    </td>
                    <td>
                        <asp:Label ID="face_valueLabel" runat="server" Text='<%# Eval("face_value") %>' />
                    </td>
                    <td>
                        <asp:Label ID="card_totalamountLabel" runat="server" Text='<%# Eval("card_totalamount") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">id</th>
                                    <th runat="server">date_input</th>
                                    <th runat="server">city_encode</th>
                                    <th runat="server">product_encode</th>
                                    <th runat="server">cardsell_amount</th>
                                    <th runat="server">face_value</th>
                                    <th runat="server">card_totalamount</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="date_inputLabel" runat="server" Text='<%# Eval("date_input") %>' />
                    </td>
                    <td>
                        <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cardsell_amountLabel" runat="server" Text='<%# Eval("cardsell_amount") %>' />
                    </td>
                    <td>
                        <asp:Label ID="face_valueLabel" runat="server" Text='<%# Eval("face_value") %>' />
                    </td>
                    <td>
                        <asp:Label ID="card_totalamountLabel" runat="server" Text='<%# Eval("card_totalamount") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
