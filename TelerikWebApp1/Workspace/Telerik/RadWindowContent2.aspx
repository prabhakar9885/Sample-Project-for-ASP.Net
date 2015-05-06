<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadWindowContent2.aspx.cs" Inherits="RadWindowContent2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        //Put your JavaScript code here.
    </script>
    <div>
        <telerik:RadUpload ID="RadUpload1" runat="server" controlobjectsvisibility="None" 
                MaxFileInputsCount="1" AllowedFileExtensions=".pdf">
        </telerik:RadUpload>
        <telerik:RadButton ID="UploadFile" runat="server" Text="Upload" 
            onclick="UploadFile_Click">
        </telerik:RadButton>
    </div>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
    The name recieved is: 
        <telerik:RadTextBox ID="EnameTextBox" runat="server">
        </telerik:RadTextBox>
        <telerik:RadTextBox ID="JobTextBox" runat="server">
        </telerik:RadTextBox>
        <telerik:RadTextBox ID="SalaryTextBox" runat="server">
        </telerik:RadTextBox>
        <telerik:RadTextBox ID="ManagerNameTextBox" runat="server">
        </telerik:RadTextBox>
    </div>
    </form>
</body>
</html>
