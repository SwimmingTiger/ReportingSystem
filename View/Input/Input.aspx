<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Input.aspx.cs" Inherits="Input" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>数据录入 - <%= Param.Website.SITE_NAME %></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" BorderWidth="0" Text="   出账收入基本信息   " OnClick="LinkButton1_Click" />
        <asp:Button ID="Button2" runat="server" BorderWidth="0" Text="  卡销售收入基本信息  " OnClick="LinkButton2_Click" />
        <asp:Button ID="Button3" runat="server" BorderWidth="0" Text="   网间结算基本信息   " OnClick="LinkButton3_Click" />
        <asp:Button ID="Button4" runat="server" BorderWidth="0" Text="预存转收入基本信息" OnClick="LinkButton4_Click" />
        <asp:Button ID="Button5" runat="server" BorderWidth="0" Text="  通知单收入基本信息  " OnClick="LinkButton5_Click" /> 
        
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex = 0>
            <asp:View ID="View1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [data_account] WHERE [id] = @id" InsertCommand="INSERT INTO [data_account] ([month], [city], [product], [type], [money],[status]) VALUES (@month, @city, @product, @type, @money,@status)" SelectCommand="SELECT * FROM [data_account]" UpdateCommand="UPDATE [data_account] SET [month] = @month, [city] = @city, [product] = @product, [type] = @type, [money] = @money, [status] = @status WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="month" DbType="Date" />
                        <asp:Parameter Name="city" Type="Int32" />
                        <asp:Parameter Name="product" Type="Int32" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="money" Type="Decimal" />
                        <asp:Parameter Name="status" Type="Int32" DefaultValue="1"/>
                     
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="month" DbType="Date" />
                        <asp:Parameter Name="city" Type="Int32" />
                        <asp:Parameter Name="product" Type="Int32" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="money" Type="Decimal" />
                        <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <h3>出账收入信息</h3>
                <asp:ListView ID="ListView0" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource6" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView3_SelectedIndexChanged">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                            </td>
                            <td>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        
                            </td>
                            <td>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label3" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                        
                            <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
             
                        </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                            </td>
                            <td>
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load" />
                            </td>
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #999999;">
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox placeholder="年-月" ID="monthTextBox" runat="server" Text='<%# Bind("month", "{0:yyyy-M}") %>' />
                            </td>
                            <td>
                                 <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>

                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 2 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                
                                   <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource14" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                            </td>
                            <td>

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
                                <td>未返回数据。</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox placeholder="年-月" ID="monthTextBox" runat="server" Text='<%# Bind("month", "{0:yyyy-M}") %>' />
                            </td>
                            <td>
                                 <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 2 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource14" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                            </td>
                            <td>

                            </td>
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="保存" OnClick="InsertButton_Click" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:database %>" 
                            SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" 
                            OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                            </td>
                            <td>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                            </td>
                            <td>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label3" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                        
                            <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
             
                        </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                            </td>
                            <td>
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load" />
                            </td>
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">ID</th>
                                            <th runat="server">录入月份</th>
                                            <th runat="server">地市</th>
                                            <th runat="server">产品</th>
                                            <th runat="server">出账类型</th>
                                            <th runat="server">录入金额</th>
                                            <th runat="server">稽核状态</th>
                                            <th runat="server">操作</th>
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
                </asp:ListView>

           
                
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h3>卡销售信息</h3>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [data_cardsale] WHERE [id] = @original_id" InsertCommand="INSERT INTO [data_cardsale] ([date], [city], [product], [number], [unit_price], [final_price], [status]) VALUES (@date, @city, @product, @number, @unit_price, @final_price, @status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [data_cardsale]" UpdateCommand="UPDATE [data_cardsale] SET [date] = @date, [city] = @city, [product] = @product, [number] = @number, [unit_price] = @unit_price, [final_price] = @final_price, [status] = @status WHERE [id] = @original_id">
                     <DeleteParameters>
                         <asp:Parameter Name="original_id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter DbType="Date" Name="date" />
                         <asp:Parameter Name="city" Type="Int32" />
                         <asp:Parameter Name="product" Type="Int32" />
                         <asp:Parameter Name="number" Type="Int32" />
                         <asp:Parameter Name="unit_price" Type="Decimal" />
                         <asp:Parameter Name="final_price" Type="Decimal" />
                         <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter DbType="Date" Name="date" />
                         <asp:Parameter Name="city" Type="Int32" />
                         <asp:Parameter Name="product" Type="Int32" />
                         <asp:Parameter Name="number" Type="Int32" />
                         <asp:Parameter Name="unit_price" Type="Decimal" />
                         <asp:Parameter Name="final_price" Type="Decimal" />
                         <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                         <asp:Parameter Name="original_id" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                    </td>
                    <td>
                        
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>

                    <td>
                          <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
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
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"/>
                    </td>
                    
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #008A8C; color: #FFFFFF;">
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox placeholder="年-月-日" ID="dateTextBox" runat="server" Text='<%# Bind("date", "{0:yyyy-M-d}") %>' />
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 4 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
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
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox placeholder="年-月-日" ID="dateTextBox" runat="server" Text='<%# Bind("date", "{0:yyyy-M-d}") %>' />
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 4 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
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
                        
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="保存" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                    </td>
                    
                    <td>
                        
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>

         
                    
                    <td>
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
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
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"/>
                    </td>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server">ID</th>
                                    <th runat="server">录入日期</th>
                                    <th runat="server">地市</th>
                                    <th runat="server">产品</th>
                                    <th runat="server">卡销售数量</th>
                                    <th runat="server">面值金额</th>
                                    <th runat="server">实售金额</th>
                                    <th runat="server">稽核状态</th>
                                    <th runat="server">操作</th>
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
        </asp:ListView>
        </asp:View>   
        <asp:View ID="View3" runat="server">
            <h3>网间结算基本信息</h3>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [data_settlement] WHERE [id] = @id" InsertCommand="INSERT INTO [data_settlement] ([month], [city], [product], [operator], [type], [money], [status]) VALUES (@month, @city, @product, @operator, @type, @money, @status)" SelectCommand="SELECT * FROM [data_settlement]" UpdateCommand="UPDATE [data_settlement] SET [month] = @month, [city] = @city, [product] = @product, [operator] = @operator, [type] = @type, [money] = @money, [status] = @status WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="month" DbType="Date" />
                    <asp:Parameter Name="city" Type="Int32" />
                    <asp:Parameter Name="product" Type="Int32" />
                    <asp:Parameter Name="operator" Type="Int32" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="money" Type="Decimal" />
                    <asp:Parameter Name="status" Type="Int32" DefaultValue="1" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="month" DbType="Date" />
                    <asp:Parameter Name="city" Type="Int32" />
                    <asp:Parameter Name="product" Type="Int32" />
                    <asp:Parameter Name="operator" Type="Int32" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="money" Type="Decimal" />
                    <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource7" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                        <td>
                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("operator") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("type") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label5" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"/>
                        </td>
                        
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:TextBox placeholder="年-月" ID="monthTextBox" runat="server" Text='<%# Bind("month", "{0:yyyy-M}") %>' />
                        </td>
                        <td>
                               <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 8 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="6" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("operator") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="7" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource6" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                        </td>
                        <td>
                            
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
                            <td>未返回数据。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox placeholder="年-月" ID="monthTextBox" runat="server" Text='<%# Bind("month", "{0:yyyy-M}") %>' />
                        </td>
                        <td>
                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 8 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="6" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("operator") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="7" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource6" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="保存" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("operator") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        </td>
                        <td>
                            
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("type") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label5" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"/>
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">ID</th>
                                        <th runat="server">录入月份</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">结算运营商</th>
                                        <th runat="server">结算类型</th>
                                        <th runat="server">结算金额</th>
                                        <th runat="server">稽核状态</th>
                                        <th runat="server">操作</th>
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
            </asp:ListView>
            </asp:View>
        <asp:View ID="View4" runat="server">
            <h3>预存转收入基本信息</h3>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [data_prestore] WHERE [id] = @id" InsertCommand="INSERT INTO [data_prestore] ([date], [city], [product], [type], [money], [status]) VALUES (@date, @city, @product, @type, @money, @status)" SelectCommand="SELECT * FROM [data_prestore]" UpdateCommand="UPDATE [data_prestore] SET [date] = @date, [city] = @city, [product] = @product, [type] = @type, [money] = @money, [status] = @status WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="date" />
                    <asp:Parameter Name="city" Type="Int32" />
                    <asp:Parameter Name="product" Type="Int32" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="money" Type="Decimal" />
                    <asp:Parameter Name="status" Type="Int32" DefaultValue="1"/>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="date" />
                    <asp:Parameter Name="city" Type="Int32" />
                    <asp:Parameter Name="product" Type="Int32" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="money" Type="Decimal" />
                    <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource8" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                        <td>
                              <asp:Label ID="Label6" runat="server" Text='<%# Bind("type") %>'  Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label6" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource8">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>

                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"/>
                        </td>
                        
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:TextBox placeholder="年-月-日" ID="dateTextBox" runat="server" Text='<%# Bind("date", "{0:yyyy-M-d}") %>' />
                        </td>
                        <td>
                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 16 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="3" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                             </td>
                        <td>
                            <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                        </td>
                        <td>
                            
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
                            <td>未返回数据。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox placeholder="年-月-日" ID="dateTextBox" runat="server" Text='<%# Bind("date", "{0:yyyy-M-d}") %>' />
                        </td>
                        <td>
                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 16 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="3" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="保存" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("type") %>'  Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label6" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource8">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>

                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"/>
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">ID</th>
                                        <th runat="server">销账日期</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">销账类型</th>
                                        <th runat="server">销账金额</th>
                                        <th runat="server">稽核状态</th>
                                        <th runat="server">操作</th>
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
         </asp:View>
        <asp:View ID="View5" runat="server">
            <h3>通知单收入基本信息</h3>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [data_notice] WHERE [id] = @id" InsertCommand="INSERT INTO [data_notice] ([date], [city], [product], [type], [money], [status]) VALUES (@date, @city, @product, @type, @money, @status)" SelectCommand="SELECT * FROM [data_notice]" UpdateCommand="UPDATE [data_notice] SET [date] = @date, [city] = @city, [product] = @product, [type] = @type, [money] = @money, [status] = @status WHERE [id] = @id" OnSelecting="SqlDataSource9_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="date" />
                    <asp:Parameter Name="city" Type="Int32" />
                    <asp:Parameter Name="product" Type="Int32" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="money" Type="Decimal" />
                    <asp:Parameter Name="status" Type="Int32" DefaultValue="1"/>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="date" />
                    <asp:Parameter Name="city" Type="Int32" />
                    <asp:Parameter Name="product" Type="Int32" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="money" Type="Decimal" />
                    <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView4" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource9" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView4_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("type") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label7" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource12">

                            <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load"  />
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:TextBox placeholder="年-月-日" ID="dateTextBox" runat="server" Text='<%# Bind("date", "{0:yyyy-M-d}") %>' />
                        </td>
                        <td>
                               <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 32 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="4" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource11" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                        </td>
                        <td>
                            
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
                            <td>未返回数据。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox placeholder="年-月-日" ID="dateTextBox" runat="server" Text='<%# Bind("date", "{0:yyyy-M-d}") %>' />
                        </td>
                        <td>
                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                            </td>
                            <td>
                                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type) and ([flag] & 32 !=0)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource13" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("product") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="4" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource11" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="moneyTextBox" runat="server" Text='<%# Bind("money") %>' />
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="保存" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)" OnSelecting="SqlDataSource10_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource10">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                             </asp:ListView>
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource11">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                        <td>
                              <asp:Label ID="Label7" runat="server" Text='<%# Bind("type") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label7" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource12">

                            <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' OnDataBinding="statusLabel_Load" />
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">ID</th>
                                        <th runat="server">营业收款日期</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">通知单收入</th>
                                        <th runat="server">营业收入金额</th>
                                        <th runat="server">稽核状态</th>
                                        <th runat="server">操作</th>
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
            </asp:ListView>
        </asp:View>           
        </asp:MultiView>
    </form>
</body>
</html>
