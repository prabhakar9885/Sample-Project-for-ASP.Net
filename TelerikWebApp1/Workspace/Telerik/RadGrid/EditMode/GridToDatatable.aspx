<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridToDatatable.aspx.cs"
    Inherits="GridToDatatable" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnNeedDataSource="NeedDataSource_Handler"
            OnPreRender="" GroupPanelPosition="Top" 
            ResolvedRenderMode="Classic" OnItemDataBound="RadGrid1_ItemDataBound" 
            OnUpdateCommand="RadGrid1_UpdateCommand" OnEditCommand="RadGrid1_EditCommand"
            OnInsertCommand="RadGrid1_InsertCommand">
            <MasterTableView EditMode="InPlace" CommandItemDisplay="Top">
                <CommandItemSettings ShowRefreshButton="False" />
                <Columns>
                    <telerik:GridTemplateColumn DataField="Id" FilterControlAltText="Filter column column"
                        HeaderText="Id" SortExpression="Id" UniqueName="IdUnique">
                        <EditItemTemplate>
                            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Name" FilterControlAltText="Filter column1 column"
                        HeaderText="Name" SortExpression="Name" UniqueName="NameUnique">
                        <EditItemTemplate>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Job" FilterControlAltText="Filter column2 column"
                        HeaderText="Job" SortExpression="Job" UniqueName="JobUnique">
                        <EditItemTemplate>
                            <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Salary" HeaderText="Salary" SortExpression="Salary"
                        UniqueName="SalaryUnique" DataType="System.Double">
                        <EditItemTemplate>
                            <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="ManagerName" HeaderText="Manager" SortExpression="ManagerName"
                        UniqueName="ManagerNameUnique">
                        <EditItemTemplate>
                            <asp:TextBox ID="ManagerTextBox" runat="server" Text='<%# Bind("ManagerName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ManagerLabel" runat="server" Text='<%# Eval("ManagerName") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="Manager Edit">
                        <ItemTemplate>
                            <asp:Label ID="ManagerLabel2" runat="server" Text='<%# Eval("ManagerName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox runat="server" ID="ManagerRadComboBox" >
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridEditCommandColumn />
                </Columns>
                <EditFormSettings>
                    <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <telerik:RadButton ID="ExtractToDatatable" runat="server" Text="Extract to DataTable"
        OnClick="ExtractToDatatable_Click">
    </telerik:RadButton>
    <label id="MsgLabel" runat="server" ></label>
    <div>
        <telerik:RadGrid ID="RadGrid2" runat="server">
            <MasterTableView AutoGenerateColumns="true">
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
