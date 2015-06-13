<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadWindowAndEnterKey.aspx.cs"
    Inherits="RadWindowAndEnterKey" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        a.rwPinButton, a.rwReloadButton, a.rwMinimizeButton, a.rwMaximizeButton
        {
            visibility:hidden;
        }
    </style>
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
        function OpenRadWindow() {
            var oWnd = radopen("RadControlsDemo.aspx", null, 800, 600, 20, 20);
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <button onclick="OpenRadWindow();return false;" class="Button" style="width: 190px">
            Show new window</button>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
        <Windows>
            <telerik:RadWindow ID="RadWindow1" runat="server" NavigateUrl="http://www.google.com">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow2" runat="server" NavigateUrl="http://www.telerik.com">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    </form>
</body>
</html>
