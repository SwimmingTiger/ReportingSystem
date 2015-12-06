<%@ Page Language="C#" AutoEventWireup="true" CodeFile="navigation_auditor.aspx.cs" Inherits="View_Audit_navigation_auditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server"> 
        <asp:Button ID="Button1" runat="server" Text="出账收入基本信息" OnClick="LinkButton1_Click"/>
        <asp:Button ID="Button2" runat="server" Text="卡销售收入基本信息" OnClick="LinkButton2_Click"/>
        <asp:Button ID="Button3" runat="server" Text="通知单收入基本信息" OnClick="LinkButton3_Click"/>
        <asp:Button ID="Button4" runat="server" Text="预存转收入基本信息" OnClick="LinkButton4_Click"/>
        <asp:Button ID="Button5" runat="server" Text="网间结算基本信息" OnClick="LinkButton5_Click"/>
        
    <div style="margin-top: 0px" >
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <h3>出账收入基本信息</h3>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_account]"></asp:SqlDataSource>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                            </td>
                            <td>
                                <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' visible="false"/>
                                <asp:SqlDataSource 
                                    ID="SqlDataSource2" 
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                                <asp:SqlDataSource 
                                    ID="SqlDataSource3" 
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                                <asp:SqlDataSource 
                                    ID="SqlDataSource5" 
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"
                                     SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_account">
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
                                <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                            </td>
                            <td>
                                <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' visible="false"/>
                                <asp:SqlDataSource 
                                    ID="SqlDataSource2" 
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                                <asp:SqlDataSource 
                                    ID="SqlDataSource4" 
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                                <asp:SqlDataSource 
                                    ID="SqlDataSource6" 
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource6">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True" 
                                    SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_account">
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
                                            <th runat="server">月份</th>
                                            <th runat="server">地市</th>
                                            <th runat="server">产品</th>
                                            <th runat="server">类型</th>
                                            <th runat="server">金额</th>
                                            <th runat="server">稽核状态</th>
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
            <asp:View ID="View2" runat="server">
                <h3>卡销售收入基本信息</h3>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" 
                    SelectCommand="SELECT * FROM [data_cardsale]">
                 </asp:SqlDataSource>

                 <asp:ListView ID="ListView6" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2">
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
                                <asp:SqlDataSource 
                                    ID="SqlDataSource2" 
                                    runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:database %>"
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' Visible="false"/>
                                <asp:SqlDataSource ID="SqlDataSource4" 
                                    runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:database %>" 
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>'></asp:Label>
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
                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                     SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_cardsale">
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
                                <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' Visible="false" />
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
                                <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' Visible="false"/>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:database %>" 
                                    SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                         <asp:Label ID="Label3" runat="server" Text='<%# Eval("name") %>'></asp:Label>                         
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
                        
                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True" 
                                    SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_cardsale">
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
                                            <th runat="server">日期</th>
                                            <th runat="server">地市</th>
                                            <th runat="server">产品</th>
                                            <th runat="server">售卡数量</th>
                                            <th runat="server">面值金额</th>
                                            <th runat="server">实售金额</th>
                                            <th runat="server">稽核状态</th>
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
            <asp:View ID="View3" runat="server">
                <h3>通知单收入基本信息</h3>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_notice]"></asp:SqlDataSource>
                <asp:ListView ID="ListView7" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource3">
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
                            <asp:SqlDataSource 
                                ID="SqlDataSource1" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource3" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource2" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                 SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_notice">
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
                            <asp:SqlDataSource 
                                ID="SqlDataSource2" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource4" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                             <asp:SqlDataSource 
                                ID="SqlDataSource5" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                 SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_notice">
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
                                        <th runat="server">日期</th>
                                        <th runat="server">地市</th>
                                        <th runat="server">产品</th>
                                        <th runat="server">类型</th>
                                        <th runat="server">金额</th>
                                        <th runat="server">稽核状态</th>
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
            <asp:View ID="View4" runat="server">
                <h3>预存转收入基本信息</h3>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_prestore]"></asp:SqlDataSource>
                <asp:ListView ID="ListView8" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource4">
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
                                 SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_prestroe">
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
                                 SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="OnSelectedIndexChanged_data_prestroe">
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
                                    <th runat="server">日期</th>
                                    <th runat="server">地市</th>
                                    <th runat="server">产品</th>
                                    <th runat="server">类型</th>
                                    <th runat="server">金额</th>
                                    <th runat="server">稽核状态</th>
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
                <h3>网间结算基本信息</h3>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_settlement]"></asp:SqlDataSource>
                <asp:ListView ID="ListView9" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource5">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource2" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource3" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="operatorLabel" runat="server" Text='<%# Eval("operator") %>' visible="false"/>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="operatorLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView10" runat="server" DataSourceID="SqlDataSource4">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource5" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                 SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="SelectedIndexChanged_datasettlement">
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
                            <asp:Label ID="monthLabel" runat="server" Text='<%# Eval("month") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource3" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cityLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource4" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="productLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="operatorLabel" runat="server" Text='<%# Eval("operator") %>' visible="false"/>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="operatorLabel" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView10" runat="server" DataSourceID="SqlDataSource4">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' visible="false"/>
                            <asp:SqlDataSource 
                                ID="SqlDataSource5" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:database %>"
                                SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="typeLabel" Name="id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td>
                            <asp:Label ID="moneyLabel" runat="server" Text='<%# Eval("money") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                 SelectedValue='<%# Bind("status") %>' OnSelectedIndexChanged="SelectedIndexChanged_datasettlement">
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
                                    <th runat="server">月份</th>
                                    <th runat="server">地市</th>
                                    <th runat="server">产品</th>
                                    <th runat="server">运营商</th>
                                    <th runat="server">类型</th>
                                    <th runat="server">金额</th>
                                    <th runat="server">稽核状态</th>
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

        </asp:MultiView>
    </div>
    </form>
   
    </body>
</html>
