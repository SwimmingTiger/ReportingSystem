<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Input.aspx.cs" Inherits="Input" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" BorderWidth="0" Text="   出账收入基本信息   " OnClick="LinkButton1_Click" />
        <asp:Button ID="Button2" runat="server" BorderWidth="0" Text="  卡销售收入基本信息  " OnClick="LinkButton2_Click" />
        <asp:Button ID="Button3" runat="server" BorderWidth="0" Text="   网间结算基本信息   " OnClick="LinkButton3_Click" />
        <asp:Button ID="Button4" runat="server" BorderWidth="0" Text="预存转收入收入基本信息" OnClick="LinkButton4_Click" />
        <asp:Button ID="Button5" runat="server" BorderWidth="0" Text="  通知单收入基本信息  " OnClick="LinkButton5_Click" /> 
        
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

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date_input" HeaderText="date_input" SortExpression="date_input" />
                <asp:TemplateField HeaderText="city_encode" SortExpression="city_encode">
                    <EditItemTemplate>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city_encode") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city_encode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="product_encode" HeaderText="product_encode" SortExpression="product_encode" />
                <asp:BoundField DataField="cardsell_amount" HeaderText="cardsell_amount" SortExpression="cardsell_amount" />
                <asp:BoundField DataField="face_value" HeaderText="face_value" SortExpression="face_value" />
                <asp:BoundField DataField="card_totalamount" HeaderText="card_totalamount" SortExpression="card_totalamount" />
            </Columns>
            <PagerTemplate>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </PagerTemplate>
        </asp:GridView>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex = 1>
            <asp:View ID="View1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [income_account] WHERE [id] = @id" InsertCommand="INSERT INTO [income_account] ([month_input], [city_encode], [product_encode], [chargeoff_type], [amount_input]) VALUES (@month_input, @city_encode, @product_encode, @chargeoff_type, @amount_input)" SelectCommand="SELECT [id], [month_input], [city_encode], [product_encode], [chargeoff_type], [amount_input] FROM [income_account]" UpdateCommand="UPDATE [income_account] SET [month_input] = @month_input, [city_encode] = @city_encode, [product_encode] = @product_encode, [chargeoff_type] = @chargeoff_type, [amount_input] = @amount_input WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="month_input" Type="Int32" />
                        <asp:Parameter Name="city_encode" Type="Int32" />
                        <asp:Parameter Name="product_encode" Type="Int32" />
                        <asp:Parameter Name="chargeoff_type" Type="Int32" />
                        <asp:Parameter Name="amount_input" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="month_input" Type="Int32" />
                        <asp:Parameter Name="city_encode" Type="Int32" />
                        <asp:Parameter Name="product_encode" Type="Int32" />
                        <asp:Parameter Name="chargeoff_type" Type="Int32" />
                        <asp:Parameter Name="amount_input" Type="Decimal" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                出账收入信息
                <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource6" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView3_SelectedIndexChanged">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="month_inputLabel" runat="server" Text='<%# Eval("month_input") %>' />
                            </td>
                            <td>
                                <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="chargeoff_typeLabel" runat="server" Text='<%# Eval("chargeoff_type") %>' />
                            </td>
                            <td>
                                <asp:Label ID="amount_inputLabel" runat="server" Text='<%# Eval("amount_input") %>' />
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
                                <asp:TextBox ID="month_inputTextBox" runat="server" Text='<%# Bind("month_input") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />

                            </td>
                            <td>
                                <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="chargeoff_typeTextBox" runat="server" Text='<%# Bind("chargeoff_type") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="amount_inputTextBox" runat="server" Text='<%# Bind("amount_input") %>' />
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
                                <asp:TextBox ID="month_inputTextBox" runat="server" Text='<%# Bind("month_input") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="chargeoff_typeTextBox" runat="server" Text='<%# Bind("chargeoff_type") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="amount_inputTextBox" runat="server" Text='<%# Bind("amount_input") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="month_inputLabel" runat="server" Text='<%# Eval("month_input") %>' />
                            </td>
                            <td>
                                <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="chargeoff_typeLabel" runat="server" Text='<%# Eval("chargeoff_type") %>' />
                            </td>
                            <td>
                                <asp:Label ID="amount_inputLabel" runat="server" Text='<%# Eval("amount_input") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server"></th>
                                            <th runat="server">id</th>
                                            <th runat="server">month_input</th>
                                            <th runat="server">city_encode</th>
                                            <th runat="server">product_encode</th>
                                            <th runat="server">chargeoff_type</th>
                                            <th runat="server">amount_input</th>
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
                                <asp:Label ID="month_inputLabel" runat="server" Text='<%# Eval("month_input") %>' />
                            </td>
                            <td>
                                <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="chargeoff_typeLabel" runat="server" Text='<%# Eval("chargeoff_type") %>' />
                            </td>
                            <td>
                                <asp:Label ID="amount_inputLabel" runat="server" Text='<%# Eval("amount_input") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>

           
                
        </asp:View>
        <asp:View ID="View2" runat="server">
        
                 卡销售信息
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
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
            </ItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #008A8C; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
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
                <tr style="background-color: #FFF8DC;">
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
                        <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>'/>
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
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
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
                        <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">
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
        </asp:View>   
        <asp:View ID="View3" runat="server">
            this is the third page<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [net_settlement] WHERE [id] = @id" InsertCommand="INSERT INTO [net_settlement] ([month_settlement], [city_encode], [product_encode], [operator _encode], [settlement_type], [settlement_amount]) VALUES (@month_settlement, @city_encode, @product_encode, @operator_encode, @settlement_type, @settlement_amount)" SelectCommand="SELECT [id], [month_settlement], [city_encode], [product_encode], [operator _encode] AS operator_encode, [settlement_type], [settlement_amount] FROM [net_settlement]" UpdateCommand="UPDATE [net_settlement] SET [month_settlement] = @month_settlement, [city_encode] = @city_encode, [product_encode] = @product_encode, [operator _encode] = @operator_encode, [settlement_type] = @settlement_type, [settlement_amount] = @settlement_amount WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="month_settlement" Type="Int32" />
                    <asp:Parameter Name="city_encode" Type="Int32" />
                    <asp:Parameter Name="product_encode" Type="Int32" />
                    <asp:Parameter Name="operator_encode" Type="Int32" />
                    <asp:Parameter Name="settlement_type" Type="Int32" />
                    <asp:Parameter Name="settlement_amount" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="month_settlement" Type="Int32" />
                    <asp:Parameter Name="city_encode" Type="Int32" />
                    <asp:Parameter Name="product_encode" Type="Int32" />
                    <asp:Parameter Name="operator_encode" Type="Int32" />
                    <asp:Parameter Name="settlement_type" Type="Int32" />
                    <asp:Parameter Name="settlement_amount" Type="Decimal" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView4" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource7" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="month_settlementLabel" runat="server" Text='<%# Eval("month_settlement") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="operator_encodeLabel" runat="server" Text='<%# Eval("operator_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="settlement_typeLabel" runat="server" Text='<%# Eval("settlement_type") %>' />
                        </td>
                        <td>
                            <asp:Label ID="settlement_amountLabel" runat="server" Text='<%# Eval("settlement_amount") %>' />
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
                            <asp:TextBox ID="month_settlementTextBox" runat="server" Text='<%# Bind("month_settlement") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="operator_encodeTextBox" runat="server" Text='<%# Bind("operator_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="settlement_typeTextBox" runat="server" Text='<%# Bind("settlement_type") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="settlement_amountTextBox" runat="server" Text='<%# Bind("settlement_amount") %>' />
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
                            <asp:TextBox ID="month_settlementTextBox" runat="server" Text='<%# Bind("month_settlement") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="operator_encodeTextBox" runat="server" Text='<%# Bind("operator_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="settlement_typeTextBox" runat="server" Text='<%# Bind("settlement_type") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="settlement_amountTextBox" runat="server" Text='<%# Bind("settlement_amount") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="month_settlementLabel" runat="server" Text='<%# Eval("month_settlement") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="operator_encodeLabel" runat="server" Text='<%# Eval("operator_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="settlement_typeLabel" runat="server" Text='<%# Eval("settlement_type") %>' />
                        </td>
                        <td>
                            <asp:Label ID="settlement_amountLabel" runat="server" Text='<%# Eval("settlement_amount") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">id</th>
                                        <th runat="server">month_settlement</th>
                                        <th runat="server">city_encode</th>
                                        <th runat="server">product_encode</th>
                                        <th runat="server">operator_encode</th>
                                        <th runat="server">settlement_type</th>
                                        <th runat="server">settlement_amount</th>
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
                            <asp:Label ID="month_settlementLabel" runat="server" Text='<%# Eval("month_settlement") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="operator_encodeLabel" runat="server" Text='<%# Eval("operator_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="settlement_typeLabel" runat="server" Text='<%# Eval("settlement_type") %>' />
                        </td>
                        <td>
                            <asp:Label ID="settlement_amountLabel" runat="server" Text='<%# Eval("settlement_amount") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </asp:View>
        <asp:View ID="View4" runat="server">
            this is the forth page<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [transfer_income] WHERE [id] = @id" InsertCommand="INSERT INTO [transfer_income] ([writeoff_date], [city_encode], [product_encode], [writeoff_type], [writeoff_amount]) VALUES (@writeoff_date, @city_encode, @product_encode, @writeoff_type, @writeoff_amount)" SelectCommand="SELECT [id], [writeoff_date], [city_encode], [product_encode], [writeoff_type], [writeoff_amount] FROM [transfer_income]" UpdateCommand="UPDATE [transfer_income] SET [writeoff_date] = @writeoff_date, [city_encode] = @city_encode, [product_encode] = @product_encode, [writeoff_type] = @writeoff_type, [writeoff_amount] = @writeoff_amount WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="writeoff_date" />
                    <asp:Parameter Name="city_encode" Type="Int32" />
                    <asp:Parameter Name="product_encode" Type="Int32" />
                    <asp:Parameter Name="writeoff_type" Type="Int32" />
                    <asp:Parameter Name="writeoff_amount" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="writeoff_date" />
                    <asp:Parameter Name="city_encode" Type="Int32" />
                    <asp:Parameter Name="product_encode" Type="Int32" />
                    <asp:Parameter Name="writeoff_type" Type="Int32" />
                    <asp:Parameter Name="writeoff_amount" Type="Decimal" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView5" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource8" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_dateLabel" runat="server" Text='<%# Eval("writeoff_date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_typeLabel" runat="server" Text='<%# Eval("writeoff_type") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_amountLabel" runat="server" Text='<%# Eval("writeoff_amount") %>' />
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
                            <asp:TextBox ID="writeoff_dateTextBox" runat="server" Text='<%# Bind("writeoff_date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="writeoff_typeTextBox" runat="server" Text='<%# Bind("writeoff_type") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="writeoff_amountTextBox" runat="server" Text='<%# Bind("writeoff_amount") %>' />
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
                            <asp:TextBox ID="writeoff_dateTextBox" runat="server" Text='<%# Bind("writeoff_date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="writeoff_typeTextBox" runat="server" Text='<%# Bind("writeoff_type") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="writeoff_amountTextBox" runat="server" Text='<%# Bind("writeoff_amount") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_dateLabel" runat="server" Text='<%# Eval("writeoff_date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_typeLabel" runat="server" Text='<%# Eval("writeoff_type") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_amountLabel" runat="server" Text='<%# Eval("writeoff_amount") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server"></th>
                                        <th runat="server">id</th>
                                        <th runat="server">writeoff_date</th>
                                        <th runat="server">city_encode</th>
                                        <th runat="server">product_encode</th>
                                        <th runat="server">writeoff_type</th>
                                        <th runat="server">writeoff_amount</th>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_dateLabel" runat="server" Text='<%# Eval("writeoff_date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_typeLabel" runat="server" Text='<%# Eval("writeoff_type") %>' />
                        </td>
                        <td>
                            <asp:Label ID="writeoff_amountLabel" runat="server" Text='<%# Eval("writeoff_amount") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
         </asp:View>
        <asp:View ID="View5" runat="server">
            this is the fifth page<asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [notice_income] WHERE [id] = @id" InsertCommand="INSERT INTO [notice_income] ([collection_date], [city_encode], [product_encode], [notice_income], [income_amount]) VALUES (@collection_date, @city_encode, @product_encode, @notice_income, @income_amount)" SelectCommand="SELECT [id], [collection_date], [city_encode], [product_encode], [notice_income], [income_amount] FROM [notice_income]" UpdateCommand="UPDATE [notice_income] SET [collection_date] = @collection_date, [city_encode] = @city_encode, [product_encode] = @product_encode, [notice_income] = @notice_income, [income_amount] = @income_amount WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="collection_date" />
                    <asp:Parameter Name="city_encode" Type="Int32" />
                    <asp:Parameter Name="product_encode" Type="Int32" />
                    <asp:Parameter Name="notice_income" Type="Int32" />
                    <asp:Parameter Name="income_amount" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="collection_date" />
                    <asp:Parameter Name="city_encode" Type="Int32" />
                    <asp:Parameter Name="product_encode" Type="Int32" />
                    <asp:Parameter Name="notice_income" Type="Int32" />
                    <asp:Parameter Name="income_amount" Type="Decimal" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView6" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource9" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="collection_dateLabel" runat="server" Text='<%# Eval("collection_date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="notice_incomeLabel" runat="server" Text='<%# Eval("notice_income") %>' />
                        </td>
                        <td>
                            <asp:Label ID="income_amountLabel" runat="server" Text='<%# Eval("income_amount") %>' />
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
                            <asp:TextBox ID="collection_dateTextBox" runat="server" Text='<%# Bind("collection_date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="notice_incomeTextBox" runat="server" Text='<%# Bind("notice_income") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="income_amountTextBox" runat="server" Text='<%# Bind("income_amount") %>' />
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
                            <asp:TextBox ID="collection_dateTextBox" runat="server" Text='<%# Bind("collection_date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="city_encodeTextBox" runat="server" Text='<%# Bind("city_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="product_encodeTextBox" runat="server" Text='<%# Bind("product_encode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="notice_incomeTextBox" runat="server" Text='<%# Bind("notice_income") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="income_amountTextBox" runat="server" Text='<%# Bind("income_amount") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="collection_dateLabel" runat="server" Text='<%# Eval("collection_date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="notice_incomeLabel" runat="server" Text='<%# Eval("notice_income") %>' />
                        </td>
                        <td>
                            <asp:Label ID="income_amountLabel" runat="server" Text='<%# Eval("income_amount") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">id</th>
                                        <th runat="server">collection_date</th>
                                        <th runat="server">city_encode</th>
                                        <th runat="server">product_encode</th>
                                        <th runat="server">notice_income</th>
                                        <th runat="server">income_amount</th>
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
                            <asp:Label ID="collection_dateLabel" runat="server" Text='<%# Eval("collection_date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="city_encodeLabel" runat="server" Text='<%# Eval("city_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="product_encodeLabel" runat="server" Text='<%# Eval("product_encode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="notice_incomeLabel" runat="server" Text='<%# Eval("notice_income") %>' />
                        </td>
                        <td>
                            <asp:Label ID="income_amountLabel" runat="server" Text='<%# Eval("income_amount") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </asp:View>           
        </asp:MultiView>
        
    </form>
</body>
</html>
