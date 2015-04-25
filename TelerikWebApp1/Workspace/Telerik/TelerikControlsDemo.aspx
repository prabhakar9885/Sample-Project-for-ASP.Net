<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelerikControlsDemo.aspx.cs" Inherits="TelerikWebForm1" %>

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
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
    
        <telerik:RadTextBox ID="RadTextBox1" runat="server" EmptyMessage="Enter First Name"
            Label="Name goes here" LabelWidth="64px" Resize="None" ResolvedRenderMode="Classic"
            Text="First Name" Width="160px">
        </telerik:RadTextBox>
        <telerik:RadTextBox ID="RadTextBox2" runat="server" DisplayText="msg" EmptyMessage="Last Name"
            Label="Last Name goes here" LabelWidth="64px" Resize="None" ResolvedRenderMode="Classic"
            Text="NONE" Width="160px">
        </telerik:RadTextBox>
        <br />
        <br />
        DOB
        <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" ResolvedRenderMode="Classic"
            SelectedDate="2015-04-25">
            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"
                FastNavigationNextText="&amp;lt;&amp;lt;">
            </Calendar>
            <DateInput DisplayDateFormat="d/M/yyyy" DateFormat="d/M/yyyy" LabelWidth="40%" DisplayText="25/4/2015"
                SelectedDate="2015-04-25" value="25/4/2015">
                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                <FocusedStyle Resize="None"></FocusedStyle>
                <DisabledStyle Resize="None"></DisabledStyle>
                <InvalidStyle Resize="None"></InvalidStyle>
                <HoveredStyle Resize="None"></HoveredStyle>
                <EnabledStyle Resize="None"></EnabledStyle>
            </DateInput>
            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
        </telerik:RadDatePicker>
        <br />
        Gender
        <telerik:RadComboBox ID="RadComboBox1" runat="server" ResolvedRenderMode="Classic">
            <Items>
                <telerik:RadComboBoxItem runat="server" Text="Male" Value="M" />
                <telerik:RadComboBoxItem runat="server" Text="Female" Value="F" />
            </Items>
        </telerik:RadComboBox>
        <br />
        Profile Pic
        <asp:Image ID="ProfilePicImage" runat="server" />
        <br />
        <telerik:RadAsyncUpload ID="ImageRadAsyncUpload" runat="server" TargetFolder="~/Workspace/Data/">
        </telerik:RadAsyncUpload>
        <telerik:RadButton ID="SaveRadButton" runat="server" Text="Save" OnClick="UploadImage">
        </telerik:RadButton>
    </div>
    </form>
</body>
</html>
