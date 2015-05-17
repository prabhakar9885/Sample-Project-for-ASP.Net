<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddnewEditDelete.aspx.cs"
    Inherits="AddnewEditDelete" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" GroupPanelPosition="Top" ResolvedRenderMode="Classic"
            OnNeedDataSource="RadGrid1_NeedDataSource1" OnUpdateCommand="RadGrid1_UpdateCommand"
            OnInsertCommand="RadGrid1_InsertCommand" OnDeleteCommand="RadGrid1_DeleteCommand">
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" EditMode="InPlace"
                DataKeyNames="Id">
                <CommandItemSettings ShowRefreshButton="False" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" ReadOnly="true" FilterControlAltText="Filter Id column"
                        HeaderText="Id" UniqueName="Id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter ename column"
                        HeaderText="Name" UniqueName="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ManagerName" FilterControlAltText="Filter ManagerName column"
                        HeaderText="ManagerName" UniqueName="ManagerName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Job" FilterControlAltText="Filter job column"
                        HeaderText="Job" UniqueName="Job">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="Salary" DataType="System.Double" DecimalDigits="2"
                        FilterControlAltText="Filter Salary column" HeaderText="Salary" UniqueName="Salary">
                    </telerik:GridNumericColumn>
                    <telerik:GridEditCommandColumn HeaderText="Action" ButtonType="ImageButton">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn HeaderText="Delete" ButtonType="ImageButton" CommandName="Delete">
                    </telerik:GridButtonColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
