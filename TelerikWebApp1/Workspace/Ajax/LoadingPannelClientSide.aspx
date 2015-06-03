<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadingPannelClientSide.aspx.cs"
    Inherits="LoadingPannelClientSide" %>

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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            function pageLoad(sender, eventArgs) {
                if (!eventArgs.get_isPartialLoad()) {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("InitialPageLoad");
                }
            }      


            var currentLoadingPanel = null;
            var currentUpdatedControl = null;
            function RequestStart(sender, args) {
                
                // Before reloading the Grid, slide it up.
                $("#<%= RadGrid1.ClientID %>").slideUp("slow", null);

                currentLoadingPanel = $find("<%= RadAjaxLoadingPanel1.ClientID %>");

                if (args.get_eventTarget() == "<%= RadComboBox1.UniqueID %>") {
                    currentUpdatedControl = "<%= RadComboBox1.ClientID %>";
                }
                else {
                    currentUpdatedControl = "<%= RadGrid1.ClientID %>";
                }
                //show the loading panel over the updated control
                currentLoadingPanel.show(currentUpdatedControl);
            }

            function ResponseEnd() {
                
                // When the response arrives at the Client, the Grid will become visible(no longer slided up). So, slide it up, without displaying the Grid.
                $("#<%= RadGrid1.ClientID %>").slideUp(1, null);

                //hide the loading panel and clean up the global variables
                if (currentLoadingPanel != null)
                    currentLoadingPanel.hide(currentUpdatedControl);
                currentUpdatedControl = null;
                currentLoadingPanel = null;

                //After hiding the loading pannel, slide-down the Grid.
                $("#<%= RadGrid1.ClientID %>").slideDown("slow", null);
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server">
    </telerik:RadSkinManager>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadComboBox1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadComboBox1" />
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
        <ClientEvents OnRequestStart="RequestStart" OnResponseEnd="ResponseEnd" />
    </telerik:RadAjaxManager>

    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default" >
        <%--<div>
            <asp:Image ID="Image1" runat="server" ImageUrl="/images/ajax-loader.gif" AlternateText="loading"></asp:Image>
        </div>--%>
    </telerik:RadAjaxLoadingPanel>

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
        <div class="table">
            <div class="title">
                Demo of Ajax controls
            </div>
            <div class="heading">
                <div class="cell">
                    Selection</div>
                <div class="cell">
                    Output</div>
            </div>
            <div class="row">
                <div class="cell">
                    <telerik:RadComboBox ID="RadComboBox1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1"
                        DataTextField="ProductName" DataValueField="ProductID" ResolvedRenderMode="Classic"
                        OnSelectedIndexChanged="RadComboBox1_SelectedIndexChanged">
                    </telerik:RadComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>"
                        SelectCommand="SELECT ProductID, ProductName FROM Products ORDER BY ProductName">
                    </asp:SqlDataSource>
                </div>
                <div class="cell">
                    <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="SqlDataSource2"
                        GridLines="Both" GroupPanelPosition="Top" ResolvedRenderMode="Classic" Height="400px">
                        <ClientSettings>
                            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource2">
                            <Columns>
                                <telerik:GridBoundColumn DataField="OrderID" DataType="System.Int32" FilterControlAltText="Filter OrderID column"
                                    HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" UniqueName="OrderID">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ProductName" FilterControlAltText="Filter ProductName column"
                                    HeaderText="ProductName" ReadOnly="True" SortExpression="ProductName" UniqueName="ProductName">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CompanyName" FilterControlAltText="Filter CompanyName column"
                                    HeaderText="CompanyName" ReadOnly="True" SortExpression="CompanyName" UniqueName="CompanyName">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CompanyName1" FilterControlAltText="Filter CompanyName1 column"
                                    HeaderText="CompanyName1" ReadOnly="True" SortExpression="CompanyName1" UniqueName="CompanyName1">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ShipCountry" FilterControlAltText="Filter ShipCountry column"
                                    HeaderText="ShipCountry" SortExpression="ShipCountry" UniqueName="ShipCountry">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString2 %>"
                        SelectCommand="SELECT o.OrderID, (SELECT ProductName FROM Products AS p WHERE (ProductID = od.ProductID)) AS ProductName, (SELECT CompanyName FROM Customers AS c WHERE (CustomerID = o.CustomerID)) AS CompanyName, (SELECT FirstName + ' ' + LastName AS Expr1 FROM Employees AS e WHERE (EmployeeID = o.EmployeeID)) AS CompanyName, o.ShipCountry FROM [Order Details] AS od INNER JOIN Orders AS o ON o.OrderID = od.OrderID WHERE (od.ProductID = @ProductID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="" Name="ProductID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </telerik:RadAjaxPanel>
    </form>
</body>
</html>
