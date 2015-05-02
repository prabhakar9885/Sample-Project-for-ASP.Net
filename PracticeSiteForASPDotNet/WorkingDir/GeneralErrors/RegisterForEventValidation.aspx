<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForEventValidation.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.GeneralErrors.RegisterForEventValidation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%= dd.ClientID %>").append($("<option />")
      .val(3)
      .text("Three!"));
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="dd" runat="server">
            <asp:ListItem>One</asp:ListItem>
            <asp:ListItem>Two</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Test" /><br />
        <asp:Label ID="Msg" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
