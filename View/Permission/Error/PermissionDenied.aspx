<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PermissionDenied.aspx.cs" Inherits="Error_PermissionDenied" MasterPageFile="~/View/Template/MasterPage.master" %>

<asp:Content ID="title" ContentPlaceHolderID="title" runat="server">
    权限不足！
</asp:Content>

<asp:Content ID="content" ContentPlaceHolderID="content" runat="server">
    <div>
        <h3>您需要以下权限才能访问该功能：</h3>
        <p><asp:Label ID="permission" runat="server" Text="权限"></asp:Label></p>
        <p><a href="#" onclick="window.top.location='<%= Param.Website.VIEW_PATH %>/Permission/Login.aspx'">返回登录界面</a></p>
    </div>
</asp:Content>
