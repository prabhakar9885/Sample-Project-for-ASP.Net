<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDemo 2.aspx.cs" Inherits="EditDemo_2" 
 EnableEventValidation="false"%>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="True" 
            OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound">
            <MasterTableView DataKeyNames="Id" AutoGenerateColumns="false" EditMode="InPlace"
                CommandItemDisplay="TopAndBottom">
                <Columns>
                    <telerik:GridBoundColumn ReadOnly="true" DataField="Id" UniqueName="Id"
                        HeaderText="Id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" UniqueName="Name" HeaderText="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ManagerName" UniqueName="ManagerName" HeaderText="ManagerName">
                    </telerik:GridBoundColumn>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" />
                </Columns>
                <CommandItemTemplate>
                    <asp:Button runat="server" ID="UpdateAll" Text="Update All" CommandName="UpdateAll" /></CommandItemTemplate>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
