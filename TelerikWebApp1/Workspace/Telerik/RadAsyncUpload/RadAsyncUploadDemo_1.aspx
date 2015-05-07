<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadAsyncUploadDemo_1.aspx.cs" Inherits="RadAsyncUploadDemo_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <script type="text/javascript">
        function OnClientFileSelected(sender, args) {
            var str = args.get_fileInputField() + " : " +
                        args.get_fileName();
            debugger;
        }
        function OnClientFileUploading(sender, args) {
            // var str = args.get_fileInputField() + " : " +
            //           args.get_fileName();
            debugger;
        }
        function OnClientFileUploaded(sender, args) {
            var fileInfo = args.get_fileInfo();
            var fileName = args.get_fileName();
            debugger;
        }
        function OnClientFileUploadFailed(sender, args) {
            debugger;
            alert("Error")
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" DisablePlugins="true"
                PostbackTriggers="UploadButton" 
                TargetFolder="~/Workspace/Uploads/"
                OnFileUploaded="RadAsyncUpload1_FileUploaded"
                OnClientFileSelected="OnClientFileSelected" 
                OnClientFileUploading="OnClientFileUploading"
                OnClientFileUploaded="OnClientFileUploaded"
                OnClientFileUploadFailed="OnClientFileUploadFailed"
                MultipleFileSelection="Disabled">
                <FileFilters>
                <telerik:FileFilter Description="Only PDFs" Extensions="pdf" />
                </FileFilters>
        </telerik:RadAsyncUpload>
    </div>
    <telerik:RadButton ID="UploadButton" runat="server" Text="Upload PDF" 
        onclick="UploadButton_Click">
    </telerik:RadButton>
    <label id="StatusLabel" runat="server"></label>
    </form>
</body>
</html>
