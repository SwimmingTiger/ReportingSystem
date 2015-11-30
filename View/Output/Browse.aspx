<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="View_Output_Browse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="mainForm" runat="server">
    <div>
        <asp:DropDownList ID="ReportTable" runat="server">
            <asp:ListItem Value="0">出账收入</asp:ListItem>
            <asp:ListItem Value="1">卡销售收入</asp:ListItem>
            <asp:ListItem Value="2">网间结算</asp:ListItem>
            <asp:ListItem Value="3">预存转收入</asp:ListItem>
            <asp:ListItem Value="4">通知单收入</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="yearSelector" runat="server" OnSelectedIndexChanged="yearSelector_SelectedIndexChanged"></asp:DropDownList>
        <asp:DropDownList ID="monthSelector" runat="server" OnSelectedIndexChanged="monthSelector_SelectedIndexChanged"></asp:DropDownList>
        <asp:DropDownList ID="daySelector" runat="server"></asp:DropDownList>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
