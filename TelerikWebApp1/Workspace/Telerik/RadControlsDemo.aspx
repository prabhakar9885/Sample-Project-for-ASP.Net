<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadControlsDemo.aspx.cs"
    Inherits="TelerikWebForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        .currencyinput
        {
            border: 1px inset #ccc;
            padding: 2px;
        }
        .currencyinput input
        {
            border: 0;
            padding-left: 5px;
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
        $(function () {
            $("#<%=RadTextBox1.ClientID%>").focus();
        });
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <div>
            <div style="margin-bottom:15px">
                RadTextBox
                <telerik:RadTextBox ID="RadTextBox1" runat="server" AutoPostBack="True" LabelWidth="64px"
                    OnTextChanged="RadTextBox1_TextChanged" Resize="None" ResolvedRenderMode="Classic"
                    Width="160px">
                </telerik:RadTextBox>
            </div>
            <div style="margin-bottom:15px">
                Amount <span class="currencyinput">$<input type="text" name="currency"></span><br />
            </div>
            RadDatePicker
            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" DatePopupButton-ToolTip="Choose from Calender">
            </telerik:RadDatePicker>
        </div>
        <hr />
        <div>
        </div>
    </form>
</body>
</html>
