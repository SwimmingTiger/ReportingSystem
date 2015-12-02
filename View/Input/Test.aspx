<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="View_Input_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_account]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
                <asp:TemplateField HeaderText="type" SortExpression="type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                        
                            <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
             
                        </asp:ListView>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="money" HeaderText="money" SortExpression="money" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_settlement]"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
                <asp:TemplateField HeaderText="operator" SortExpression="operator">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("operator") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("operator") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                         
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="6" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("type") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="money" HeaderText="money" SortExpression="money" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_prestore]"></asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource7">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
                <asp:TemplateField HeaderText="type" SortExpression="type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource8">

                            <ItemTemplate>

                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>

                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [id], [name] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="3" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource12" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="money" HeaderText="money" SortExpression="money" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [data_notice]"></asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource9">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
                <asp:TemplateField HeaderText="type" SortExpression="type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name] FROM [report_param] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource10">

                            <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE ([type] = @type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="4" Name="type" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource11" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="money" HeaderText="money" SortExpression="money" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
