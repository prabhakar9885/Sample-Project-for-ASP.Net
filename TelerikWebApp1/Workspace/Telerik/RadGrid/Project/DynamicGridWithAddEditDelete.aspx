<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DynamicGridWithAddEditDelete.aspx.cs"
    Inherits="DynamicGridWithAddEditDelete" %>

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
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="200px" Width="300px">
        <div>
            <telerik:RadTextBox ID="ShipCityNamePatternTB" runat="server">
            </telerik:RadTextBox>
            <telerik:RadButton ID="Search" runat="server" Text="Search" OnClick="Search_Click">
            </telerik:RadButton>
        </div>
        <div>
            <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top"
                ResolvedRenderMode="Classic" OnNeedDataSource="RadGrid1_NeedDataSource" OnDeleteCommand="RadGrid1_DeleteCommand"
                OnEditCommand="RadGrid1_EditCommand" OnInsertCommand="RadGrid1_InsertCommand"
                OnUpdateCommand="RadGrid1_UpdateCommand">
                <MasterTableView CommandItemDisplay="Top">
                    <CommandItemSettings ShowRefreshButton="False" />
                    <Columns>
                        <telerik:GridBoundColumn DataField="OrderID" DataType="System.Int32" FilterControlAltText="Filter OrderID column"
                            HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" UniqueName="OrderID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ProductName" HeaderText="ProductName" UniqueName="ProductName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ShipCity" HeaderText="ShipCity" ReadOnly="True"
                            UniqueName="ShipCity">
                        </telerik:GridBoundColumn>
                        <telerik:GridEditCommandColumn HeaderText="Edit" ButtonType="ImageButton">
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" FilterControlAltText="Filter column column"
                            HeaderText="Delete" Text="Delete" UniqueName="column">
                        </telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </telerik:RadAjaxPanel>
    </form>
</body>
</html>
