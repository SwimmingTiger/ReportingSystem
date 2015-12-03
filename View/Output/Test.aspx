<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="View_Output_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="isNOTICE" runat="server" Text="isNOTICE" Visible="False"></asp:Label>
        <asp:Label ID="isProduct" runat="server" Text="isProduct" Visible="False"></asp:Label>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT [name], [id] FROM [report_param] WHERE (([flag] & @flag != 0) AND ([type] = @type))">
            <SelectParameters>
                <asp:ControlParameter ControlID="isNOTICE" Name="flag" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="isProduct" Name="type" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
        </asp:DropDownList>
    
    </div>
    </form>
</body>
</html>
