<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxFileupload.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods.AjaxFileupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showBrowseDialog() {
            var fileuploadctrl = document.getElementById('<%=FileUpload1.ClientID%>');
            fileuploadctrl.click();
            return false;
        }
        $(document).on('change', 'input[type="file"]', function () {
            $(this).parents('form').submit(); //then submit its parent form
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" onchange="this.form1.submit();" Style="display: none;" />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return showBrowseDialog();">Upload</asp:LinkButton>
    </div>
    </form>
</body>
</html>
