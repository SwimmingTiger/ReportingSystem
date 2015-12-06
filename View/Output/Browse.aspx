<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="View_Output_Browse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>报表查询 - <%= Param.Website.SITE_NAME %></title>
</head>
<body>
    <form id="mainForm" runat="server">
    <div>
        <asp:Label ID="reportTypeLabel" runat="server" Text="[reportTypeLabel]" Visible="False"></asp:Label>
        <asp:Label ID="ProductTypeLabel" runat="server" Text="[ProductTypeLabel]" Visible="False"></asp:Label>
        <asp:Label ID="CityTypeLabel" runat="server" Text="[CityTypeLabel]" Visible="False"></asp:Label>
        <asp:Label ID="ProductFlagLabel" runat="server" Text="[ProductFlagLabel]" Visible="False"></asp:Label>
        <asp:Label ID="auditNormalLabel" runat="server" Text="[auditNormalLabel]" Visible="False"></asp:Label>
        <asp:Label ID="operatorTypeLabel" runat="server" Text="[operatorTypeLabel]" Visible="False"></asp:Label>
        <asp:LinqDataSource ID="reportTableDataSource" runat="server" ContextTypeName="Output.DataProvider" EntityTypeName="" TableName="ReportTables">
        </asp:LinqDataSource>
        <asp:SqlDataSource ID="reportTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reportTypeLabel" Name="type" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            SelectCommand="SELECT [id], [name] FROM [report_param] WHERE (([type] = @type) AND ([flag] & @flag != 0))">
            <SelectParameters>
                <asp:ControlParameter ControlID="ProductTypeLabel" Name="type" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="ProductFlagLabel" Name="flag" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CityTypeLabel" Name="type" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="operatorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
            <SelectParameters>
                <asp:ControlParameter ControlID="operatorTypeLabel" Name="type" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ReportTableList" runat="server" DataSourceID="reportTableDataSource" DataTextField="Value" DataValueField="Key" AutoPostBack="True" OnSelectedIndexChanged="ReportTable_SelectedIndexChanged"></asp:DropDownList>
        
        <asp:DropDownList ID="yearSelector" runat="server" OnSelectedIndexChanged="yearSelector_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:DropDownList ID="monthSelector" runat="server" OnSelectedIndexChanged="monthSelector_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:DropDownList ID="daySelector" runat="server" AutoPostBack="True"></asp:DropDownList>
        
        <asp:DropDownList ID="operatorList" runat="server" AutoPostBack="True" DataSourceID="operatorDataSource" DataTextField="name" DataValueField="id" Visible="False" OnDataBound="DropDownList_DataBound">
        </asp:DropDownList>
        
        <asp:DropDownList ID="CityList" runat="server" AutoPostBack="True" DataSourceID="CityDataSource" DataTextField="name" DataValueField="id" OnDataBound="DropDownList_DataBound">
        </asp:DropDownList>
        
        <asp:DropDownList ID="ProductList" runat="server" DataSourceID="ProductDataSource" DataTextField="name" DataValueField="id" AutoPostBack="True" OnDataBound="DropDownList_DataBound" OnDataBinding="DropDownList_DataBinding">
        </asp:DropDownList>
        
        <asp:DropDownList ID="ReportTypeList" runat="server" DataSourceID="reportTypeDataSource" DataTextField="name" DataValueField="id" AutoPostBack="True" OnDataBound="DropDownList_DataBound">
        </asp:DropDownList>
        <asp:Button ID="ResetFilter" runat="server" OnClick="ResetFilter_Click" Text="清除条件" />
        <asp:SqlDataSource ID="accountDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            SelectCommand="SELECT * FROM [data_account] WHERE (@city = 0 OR [city] = @city) AND (@year = 0 OR year([month]) = @year) AND (@month = 0 OR month([month]) = @month) AND (@product = 0 OR [product] = @product) AND (@type = 0 OR [type] = @type) AND ([status] = @status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CityList" Name="city" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="yearSelector" Type="Int32" Name="year" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthSelector" Type="Int32" Name="month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ProductList" Name="product" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ReportTypeList" Name="type" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="auditNormalLabel" Name="status" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="cardsaleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            SelectCommand="SELECT *,[unit_price] * [number] as [total_price] FROM [data_cardsale] WHERE (@city = 0 OR [city] = @city) AND (@year = 0 OR year([date]) = @year) AND (@month = 0 OR month([date]) = @month) AND (@day = 0 OR day([date]) = @day) AND (@product = 0 OR [product] = @product) AND ([status] = @status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CityList" Name="city" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="yearSelector" Type="Int32" Name="year" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthSelector" Type="Int32" Name="month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="daySelector" Type="Int32" Name="day" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ProductList" Name="product" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="auditNormalLabel" Name="status" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="noticeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            SelectCommand="SELECT * FROM [data_notice] WHERE (@city = 0 OR [city] = @city) AND (@year = 0 OR year([date]) = @year) AND (@month = 0 OR month([date]) = @month) AND (@day = 0 OR day([date]) = @day) AND (@product = 0 OR [product] = @product) AND (@type = 0 OR [type] = @type) AND ([status] = @status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CityList" Name="city" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="yearSelector" Type="Int32" Name="year" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthSelector" Type="Int32" Name="month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="daySelector" Type="Int32" Name="day" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ProductList" Name="product" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="auditNormalLabel" Name="status" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="ReportTypeList" Name="type" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="prestoreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            SelectCommand="SELECT * FROM [data_prestore] WHERE (@city = 0 OR [city] = @city) AND (@year = 0 OR year([date]) = @year) AND (@month = 0 OR month([date]) = @month) AND (@day = 0 OR day([date]) = @day) AND (@product = 0 OR [product] = @product) AND (@type = 0 OR [type] = @type) AND ([status] = @status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CityList" Name="city" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="yearSelector" Type="Int32" Name="year" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthSelector" Type="Int32" Name="month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="daySelector" Type="Int32" Name="day" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ProductList" Name="product" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="auditNormalLabel" Name="status" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="ReportTypeList" Name="type" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
		
        <asp:SqlDataSource ID="settlementDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
            SelectCommand="SELECT * FROM [data_settlement] WHERE (@city = 0 OR [city] = @city) AND (@year = 0 OR year([month]) = @year) AND (@month = 0 OR month([month]) = @month) AND (@product = 0 OR [product] = @product) AND (@operator = 0 OR [operator] = @operator) AND (@type = 0 OR [type] = @type) AND ([status] = @status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CityList" Name="city" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="yearSelector" Type="Int32" Name="year" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthSelector" Type="Int32" Name="month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ProductList" Name="product" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="operatorList" Name="operator" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ReportTypeList" Name="type" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="auditNormalLabel" Name="status" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

		<asp:MultiView ID="contentMultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="accountView" runat="server">
                <asp:ListView ID="accountListView" runat="server" DataKeyNames="id" DataSourceID="accountDataSource">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">录入月份</th>
                                            <th runat="server">地市</th>
                                            <th runat="server">产品</th>
                                            <th runat="server">出账类型</th>
                                            <th runat="server">录入金额</th>
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
			
            <asp:View ID="cardsaleView" runat="server">
			<asp:ListView ID="cardsaleListView" runat="server" DataKeyNames="id" DataSourceID="cardsaleDataSource">
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                    </td>
                    <td>
                        
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                        <asp:Label ID="total_priceLabel" runat="server" Text='<%# Eval("total_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="final_priceLabel" runat="server" Text='<%# Eval("final_price") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                    </td>
                    
                    <td>
                        
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                        <asp:Label ID="total_priceLabel" runat="server" Text='<%# Eval("total_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="final_priceLabel" runat="server" Text='<%# Eval("final_price") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server">录入日期</th>
                                    <th runat="server">地市</th>
                                    <th runat="server">产品</th>
                                    <th runat="server">卡销售数量</th>
                                    <th runat="server">面值金额</th>
                                    <th runat="server">总金额</th>
                                    <th runat="server">实售金额</th>
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
            <asp:View ID="noticeView" runat="server">
			<asp:ListView ID="noticeListView" runat="server" DataKeyNames="id" DataSourceID="noticeDataSource">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">营业收款日期</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">通知单收入</th>
                                        <th runat="server">营业收入金额</th>
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
            <asp:View ID="prestoreView" runat="server">
			<asp:ListView ID="prestoreListView" runat="server" DataKeyNames="id" DataSourceID="prestoreDataSource">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:yyyy年M月d日}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">销账日期</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">销账类型</th>
                                        <th runat="server">销账金额</th>
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
            <asp:View ID="settlementView" runat="server">
			<asp:ListView ID="settlementListView" runat="server" DataKeyNames="id" DataSourceID="settlementDataSource">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month", "{0:yyyy年M月}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
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
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">录入月份</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">结算运营商</th>
                                        <th runat="server">结算类型</th>
                                        <th runat="server">结算金额</th>
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
		
    </div>
    </form>
</body>
</html>
