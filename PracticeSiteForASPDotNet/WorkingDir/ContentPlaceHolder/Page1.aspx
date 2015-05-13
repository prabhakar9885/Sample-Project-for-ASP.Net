<%@ Page Title="" Language="C#" MasterPageFile="~/WorkingDir/ContentPlaceHolder/Demo.Master" AutoEventWireup="true" CodeBehind="Page1.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.ContentPlaceHolder.Page1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>From Page1</title><%--Title Can't be set from ContentPage. Title must be set only from the Master Page.--%>
    Hi
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LinksID" runat="server">
    Hello
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TextID" runat="server">
How are You
</asp:Content>
