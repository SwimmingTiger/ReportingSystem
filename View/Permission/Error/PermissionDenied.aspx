<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PermissionDenied.aspx.cs" Inherits="Error_PermissionDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form" runat="server">
    <div>
        <h3>您需要以下权限才能访问该功能：</h3>
        <p><asp:Label ID="permission" runat="server" Text="权限"></asp:Label></p>

    </div>
    </form>
</body>
</html>
