<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%= @Param.Website.SITE_NAME %></title>
</head>
<body>
    <form id="mainForm" runat="server">
        <header>
            欢迎光临，<%= Permission.User.GetName() %>。
        </header>
        <nav>
        </nav>
        <article>
        </article>
    </form>
</body>
</html>
