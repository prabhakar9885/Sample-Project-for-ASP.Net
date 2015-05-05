﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadGridDemo2.aspx.cs" Inherits="RadGridDemo2"
    EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://localhost:1392/Scripts/jquery-2.1.3.js" type="text/javascript"></script>
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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" GridLines="Horizontal"
            OnSortCommand="RadGrid1_SortCommand" AutoGenerateColumns="False" GroupPanelPosition="Top"
            onneeddatasource="RadGrid1_NeedDataSource" 
            onitemdatabound="RadGrid1_ItemDataBound" ResolvedRenderMode="Classic">
            <ClientSettings KeyboardNavigationSettings-AllowActiveRowCycle="true">
                <KeyboardNavigationSettings AllowActiveRowCycle="True"></KeyboardNavigationSettings>
                <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
            </ClientSettings>
            <HeaderStyle HorizontalAlign="Left" />
            <MasterTableView AllowMultiColumnSorting="false" Width="100%" TableLayout="Fixed">
                <Columns>
                    <telerik:GridTemplateColumn DataField="empno" 
                        FilterControlAltText="Filter column column" HeaderButtonType="TextButton" 
                        HeaderText="Emp #" SortExpression="empno" UniqueName="empnoUnique">
                        <ItemTemplate>
                            <asp:HyperLink ID="Link" CssClass="ClickEvent" runat="server" NavigateUrl="" 
                                Text='<%# DataBinder.Eval(Container, "DataItem.empno") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ename" HeaderText="Name" SortExpression="ename"
                        HeaderButtonType="TextButton" UniqueName="enameUnique" FilterControlAltText="Filter ename column">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Job" HeaderText="Job" SortExpression="Job" HeaderButtonType="TextButton"
                        UniqueName="Job" FilterControlAltText="Filter Job column">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Salary" HeaderText="Salary" SortExpression="Salary"
                        HeaderButtonType="TextButton" UniqueName="SalaryUnique" FilterControlAltText="Filter Salary column">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ManagerName" HeaderText="Manager" SortExpression="ManagerName"
                        HeaderButtonType="TextButton" UniqueName="ManagerName" FilterControlAltText="Filter ManagerName column">
                    </telerik:GridBoundColumn>

                    
                    <telerik:GridHyperLinkColumn AllowSorting="False" 
                        FilterControlAltText="Filter column column" HeaderText="Action" 
                        Text="Upload SOW" UniqueName="column">
                    </telerik:GridHyperLinkColumn>

                    
                </Columns>
            </MasterTableView>
            <SortingSettings EnableSkinSortStyles="false"></SortingSettings>
            <SelectedItemStyle BorderColor="Aqua" />
        </telerik:RadGrid>
    </div>

    <script type="text/javascript">
        $(".ClickEvent").click(function (e) {
            var wndo = $find("<%=RadWindow1.ClientID %>");
            debugger;
            wndo.setUrl(e.target.href);
            wndo.show();
            return false;
        });
    </script>


    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" 
        ResolvedRenderMode="Classic">
        <Windows>
            <telerik:RadWindow ID="RadWindow1" runat="server" style="display:none;">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>

    </form>
</body>
</html>
