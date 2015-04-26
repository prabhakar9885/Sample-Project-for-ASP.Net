<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadGridDemo2.aspx.cs" Inherits="RadGridDemo2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="true" GridLines="Horizontal"
            OnSortCommand="RadGrid1_SortCommand" AutoGenerateColumns="false">
            <ClientSettings KeyboardNavigationSettings-AllowActiveRowCycle="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
            </ClientSettings>
            <HeaderStyle HorizontalAlign="Left" />
            <MasterTableView AllowMultiColumnSorting="true" Width="100%">
                <Columns>
                    <telerik:GridBoundColumn SortExpression="Id" HeaderButtonType="TextButton" DataField="Id"
                        HeaderText="Identity">
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn SortExpression="Name" HeaderButtonType="TextButton" DataField="Name"
                        HeaderText="Name">
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn SortExpression="Job" HeaderButtonType="TextButton" DataField="Job"
                        HeaderText="Job">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <SortingSettings SortedBackColor="#FFF6D6" EnableSkinSortStyles="false"></SortingSettings>
            <SelectedItemStyle BorderColor="Aqua" />
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
