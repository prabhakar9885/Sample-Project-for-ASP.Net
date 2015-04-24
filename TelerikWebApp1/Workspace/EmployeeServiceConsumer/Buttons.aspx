<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Buttons.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer.Buttons" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function LinkJS() {
            return confirm("Are you sure you want to submit?");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" /><br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButtonClicked" OnClientClick="return LinkJS()">LinkButton</asp:LinkButton><br />
        <label runat="server" id="StatusLabel">
        </label>
    </div>
    </form>
</body>
</html>
