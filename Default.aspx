<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/View/Template/MasterPage.master" %>

<asp:Content ID="title" ContentPlaceHolderID="title" runat="server">
    欢迎 - <%= Param.Website.SITE_NAME %>
</asp:Content>

<asp:Content ID="content" ContentPlaceHolderID="content" runat="server">
    <div>
        <h1>电信报表系统</h1>
        <h3>作者：黄英淏、荆超、彭逸豪</h3>
    </div>
</asp:Content>