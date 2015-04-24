<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxFileupload.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods.AjaxFileupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(document).on('change', '#FilePathName', function () {
                if (document.getElementById('<%= FileUpload1.ClientID %>').files.length === 0) {
                    return;
                }
                $('<%= FileUpload1.ClientID %>').trigger('click');
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="text" id="FilePathName" />
    <input type="button" id="Upload" />
    </div>
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    </form>
</body>
</html>
