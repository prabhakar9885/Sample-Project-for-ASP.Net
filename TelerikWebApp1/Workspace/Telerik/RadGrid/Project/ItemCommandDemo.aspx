<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemCommandDemo.aspx.cs"
    Inherits="ItemCommandDemo" %>

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

        function OnClientEntryAddingHandler(sender, eventArgs) {

            if (sender.get_entries().get_count() > 0) {
                eventArgs.set_cancel(true);
                alert("You can select only one entry");
            }
        }

    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True"
            DataSourceID="SqlDataSource1" GroupPanelPosition="Top" OnItemCommand="RadGrid1_ItemCommand"
            ResolvedRenderMode="Classic" OnItemDataBound="RadGrid1_ItemDataBound">
            <ClientSettings>
                <Animation AllowColumnRevertAnimation="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" EditMode="InPlace"
                DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
                <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                <Columns>
                    <telerik:GridBoundColumn DataField="OrderID" DataType="System.Int32" FilterControlAltText="Filter OrderID column"
                        HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" UniqueName="OrderID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerID" FilterControlAltText="Filter CustomerID column"
                        HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" UniqueName="CustomerID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EmployeeID" DataType="System.Int32" FilterControlAltText="Filter EmployeeID column"
                        HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" UniqueName="EmployeeID">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="OrderDate" DataType="System.DateTime" FilterControlAltText="Filter OrderDate column"
                        HeaderText="OrderDate" SortExpression="OrderDate" UniqueName="OrderDate">
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("OrderDate") %>'
                                ResolvedRenderMode="Classic">
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="RequiredDate" DataType="System.DateTime" FilterControlAltText="Filter RequiredDate column"
                        HeaderText="RequiredDate" SortExpression="RequiredDate" UniqueName="RequiredDate">
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="RadDatePicker2" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("RequiredDate") %>'
                                ResolvedRenderMode="Classic">
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="RequiredDateLabel" runat="server" Text='<%# Eval("RequiredDate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="ShippedDate" DataType="System.DateTime" FilterControlAltText="Filter ShippedDate column"
                        HeaderText="ShippedDate" SortExpression="ShippedDate" UniqueName="ShippedDate">
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="RadDatePicker3" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("ShippedDate") %>'
                                ResolvedRenderMode="Classic">
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ShippedDateLabel" runat="server" Text='<%# Eval("ShippedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="ShipVia" DataType="System.Int32" FilterControlAltText="Filter ShipVia column"
                        HeaderText="ShipVia" SortExpression="ShipVia" UniqueName="ShipVia">
                        <EditItemTemplate>
                            <telerik:RadAutoCompleteBox ID="RadAutoCompleteBox1" runat="server" DataSourceID="SqlDataSource2"
                                DataTextField="CompanyName" InputType="Text" DropDownWidth="310px" ResolvedRenderMode="Classic"
                                OnClientDropDownOpening ="OnClientEntryAddingHandler" 
                                DataValueField="ShipperID">
                                <DropDownItemTemplate>
                                    <table>
                                        <thead>
                                            <td>
                                                Shipper ID
                                            </td>
                                            <td>
                                                Company Name
                                            </td>
                                            <td>
                                                Phone #
                                            </td>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "ShipperID")%>
                                                </td>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "CompanyName")%>
                                                </td>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "Phone")%>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </DropDownItemTemplate>
                            </telerik:RadAutoCompleteBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ShipViaLabel" runat="server" Text='<%# Eval("ShipVia") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ShipAddress" FilterControlAltText="Filter ShipAddress column"
                        HeaderText="ShipAddress" ReadOnly="True" SortExpression="ShipAddress" UniqueName="ShipAddress">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipCity" FilterControlAltText="Filter ShipCity column"
                        HeaderText="ShipCity" ReadOnly="True" SortExpression="ShipCity" UniqueName="ShipCity">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipRegion" FilterControlAltText="Filter ShipRegion column"
                        HeaderText="ShipRegion" ReadOnly="True" SortExpression="ShipRegion" UniqueName="ShipRegion">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipCountry" FilterControlAltText="Filter ShipCountry column"
                        HeaderText="ShipCountry" ReadOnly="True" SortExpression="ShipCountry" UniqueName="ShipCountry">
                    </telerik:GridBoundColumn>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridClientDeleteColumn ButtonType="ImageButton" FilterControlAltText="Filter column column"
                        UniqueName="column">
                    </telerik:GridClientDeleteColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                    </EditColumn>
                </EditFormSettings>
                <GroupHeaderItemStyle BackColor="Blue" ForeColor="Yellow" />
                <AlternatingItemStyle BackColor="#FFFFC0" />
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>"
        SelectCommand="GetOrdersAndProcuctsTwoDT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>"
        SelectCommand="SELECT [CompanyName], [ShipperID], [Phone] FROM [Shippers]" 
        UpdateCommand="UPDATE Orders SET ShipVia = @ShipperId">
        <UpdateParameters>
            <asp:Parameter Name="ShipperId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
