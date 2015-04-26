<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PagingDemo.aspx.cs" Inherits="PagingDemo" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" GroupPanelPosition="Top" OnItemDataBound="RadGrid1_ItemDataBound"
            PageSize="4" ResolvedRenderMode="Classic" VirtualItemCount="14" AllowCustomPaging="True"
            OnItemCreated="RadGrid1_ItemCreated" AllowSorting="True" CellSpacing="-1" GridLines="Both">
            <PagerStyle EnableSEOPaging="True" PageButtonCount="2" />
            <MasterTableView AllowMultiColumnSorting="true" AutoGenerateColumns="False">
                <Columns>
                    <telerik:GridTemplateColumn DataField="Id" UniqueName="UniqueId" FilterControlAltText="Filter TemplateColumn column"
                        HeaderText="Id is" SortExpression="Id">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/Workspace/Telerik/Webinar/Res.aspc?q="+Eval("Name")%>'>
                                <%#Eval("Id") %>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Name" UniqueName="UniqueName" FilterControlAltText="Filter TemplateColumn column"
                        HeaderText="Name is" SortExpression="Name">
                        <ItemTemplate>
                            <%#Eval("Name") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
                <PagerTemplate>
                    <asp:LinkButton ID="Prev" runat="server" />
                    <asp:LinkButton ID="Next" runat="server" />
                </PagerTemplate>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
