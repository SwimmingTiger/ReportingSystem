<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录 - 电信报表系统</title>
</head>
<body>
    <form id="loginForm" runat="server">
    <div>
        <p>用户名：<asp:TextBox ID="username" runat="server"></asp:TextBox></p>
        <p>密　码：<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></p>
        <p>
            <asp:Button ID="LoginButton" runat="server" Text="登录" OnClick="LoginButton_Click" />
            <asp:Label ID="Notice" runat="server" Text=""></asp:Label>
        </p>
    </div>
    </form>
</body>
</html>
