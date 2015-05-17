﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2AddControlsToColumnTemplates.aspx.cs"
    Inherits="_2AddControlsToColumnTemplates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>

        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" GroupPanelPosition="Top"
            ResolvedRenderMode="Classic" AllowAutomaticDeletes="True" 
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" 
            AutoGenerateDeleteColumn="True">
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False"
                DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
                <CommandItemSettings ShowRefreshButton="False" />
                <Columns>
                    <telerik:GridBoundColumn DataField="OrderID" DataType="System.Int32" FilterControlAltText="Filter OrderID column"
                        HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" UniqueName="OrderID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerID" FilterControlAltText="Filter CustomerID column"
                        HeaderText="CustomerID" SortExpression="CustomerID" UniqueName="CustomerID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EmployeeID" DataType="System.Int32" FilterControlAltText="Filter EmployeeID column"
                        HeaderText="EmployeeID" SortExpression="EmployeeID" UniqueName="EmployeeID">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="TemplateColumn"
                        UniqueName="TemplateColumn">
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" ResolvedRenderMode="Classic"
                                SelectedDate='<%# Bind("OrderDate") %>'>
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridEditCommandColumn HeaderText="Edit">
                    </telerik:GridEditCommandColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>"
            SelectCommand="SELECT [OrderID], [CustomerID], [EmployeeID], [OrderDate] FROM [Orders]"
            UpdateCommand="UPDATE       Orders
SET                EmployeeID = @EmployeeID, CustomerID = @CustomerID, OrderDate = @OrderDate 
WHERE          OrderID = @OrderID" DeleteCommand="DELETE FROM Orders
WHERE OrderID = @OrderID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmployeeID" />
                <asp:Parameter Name="CustomerID" />
                <asp:Parameter Name="OrderDate" />
                <asp:Parameter Name="OrderID" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>