<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDownInGrid.aspx.cs" Inherits="DropDownInGrid" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" 
            AutoGenerateEditColumn="True" DataSourceID="SqlDataSourceForOrders" 
            GroupPanelPosition="Top" ResolvedRenderMode="Classic">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="OrderID" EditMode="InPlace"
                DataSourceID="SqlDataSourceForOrders">
                <Columns>
                    <telerik:GridBoundColumn DataField="OrderID" DataType="System.Int32" 
                        FilterControlAltText="Filter OrderID column" HeaderText="OrderID" 
                        ReadOnly="True" SortExpression="OrderID" UniqueName="OrderID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerName" 
                        FilterControlAltText="Filter CustomerName column" HeaderText="CustomerName" 
                        ReadOnly="True" SortExpression="CustomerName" UniqueName="CustomerName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EmployeeName" 
                        FilterControlAltText="Filter EmployeeName column" HeaderText="EmployeeName" 
                        ReadOnly="True" SortExpression="EmployeeName" UniqueName="EmployeeName">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="OrderDate" DataType="System.DateTime" 
                        FilterControlAltText="Filter OrderDate column" HeaderText="OrderDate" 
                        SortExpression="OrderDate" UniqueName="OrderDate">
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Culture="en-US" 
                                ResolvedRenderMode="Classic" SelectedDate='<%# Bind("OrderDate") %>'>
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Shipper" 
                        FilterControlAltText="Filter Shipper column" HeaderText="Shipper" 
                        SortExpression="Shipper" UniqueName="Shipper">
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="RadComboBox1" runat="server" 
                                DataSourceID="SqlDataSourceForShippers" DataTextField="CompanyName" 
                                DataValueField="CompanyName" ResolvedRenderMode="Classic" 
                                SelectedValue='<%# Bind("Shipper") %>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ShipperLabel" runat="server" Text='<%# Eval("Shipper") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

        <asp:SqlDataSource ID="SqlDataSourceForOrders" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>" 
            SelectCommand="GetOrderWithShippers" SelectCommandType="StoredProcedure" 
            UpdateCommand="UpdateOrders" UpdateCommandType="StoredProcedure">
            <UpdateParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="Shipper" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceForShippers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>" 
            SelectCommand="GetShipperInfo" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
