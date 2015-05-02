<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="Grid" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" 
            AllowPaging="True" AllowSorting="True" GroupPanelPosition="Top" PageSize="3" 
            ResolvedRenderMode="Classic" 
            onneeddatasource="RadGrid1_NeedDataSource" 
            onitemdatabound="RadGrid1_ItemDataBound">
            <MasterTableView AutoGenerateColumns="False">
                <Columns>
                    <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" 
                        FilterControlAltText="Filter column column" HeaderText="Identification" 
                        UniqueName="UniqueId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="True" DataField="Name"
                        FilterControlAltText="Filter column1 column" HeaderText="Name is" 
                        UniqueName="UniqueName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="True" DataField="ManagerName" 
                        FilterControlAltText="Filter column2 column" FilterDelay="1000" 
                        HeaderText="Manager" ShowFilterIcon="false" UniqueName="UniqueManager">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <PagerStyle PageButtonCount="2" />
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
