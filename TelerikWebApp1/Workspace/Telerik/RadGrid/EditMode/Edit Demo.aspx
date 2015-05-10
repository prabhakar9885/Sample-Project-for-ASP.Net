<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit Demo.aspx.cs" Inherits="Edit_Demo" %>

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
        <telerik:RadGrid ID="RadGrid1" GridLines="None" runat="server" AllowAutomaticDeletes="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False"
            OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated">
            <ClientSettings KeyboardNavigationSettings-AllowActiveRowCycle="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
            </ClientSettings>
            <MasterTableView CommandItemDisplay="Top" DataKeyNames="Id" HorizontalAlign="NotSet"
                GridLines="None" EditMode="Batch" AutoGenerateColumns="False">
                <BatchEditingSettings EditType="Cell" OpenEditingEvent="DblClick" />
                <SortExpressions>
                    <telerik:GridSortExpression FieldName="Id" SortOrder="Descending" />
                </SortExpressions>
                <Columns>
                    <telerik:GridBoundColumn DataField="Id" HeaderStyle-Width="210px" HeaderText="Emp#"
                        SortExpression="Id" UniqueName="IdUnique">
                        <ColumnValidationSettings EnableRequiredFieldValidation="true">
                            <RequiredFieldValidator ForeColor="Red" Text="*This field is required" Display="Dynamic">
                            </RequiredFieldValidator>
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Name_" DefaultInsertValue="--" HeaderStyle-Width="150px"
                        UniqueName="NameUnique_" DataField="Name">
                        <ItemTemplate>
                            <%# Eval("Name") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="80px" HeaderText="Name"
                        SortExpression="Name" UniqueName="NameUnique">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="Id" HeaderStyle-Width="80px" HeaderText="Iddd"
                        SortExpression="Id" UniqueName="IdUnique">
                    </telerik:GridNumericColumn>
                    <telerik:GridBoundColumn DataField="ManagerName" HeaderStyle-Width="80px" HeaderText="Manager"
                        SortExpression="ManagerName" UniqueName="ManagerNameUnique">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ConfirmText="Delete this Emp?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete" HeaderText="Delete" HeaderStyle-Width="50px" ButtonType="ImageButton"
                        CommandName="Delete" Text="Delete" UniqueName="DeleteUnique">
                    </telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings AllowKeyboardNavigation="true">
            </ClientSettings>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
