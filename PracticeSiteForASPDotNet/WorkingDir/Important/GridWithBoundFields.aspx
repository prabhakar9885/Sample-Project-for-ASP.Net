<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" 
CodeBehind="GridWithBoundFields.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.Important.HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" AutoGenerateColumns="false"
            PageSize="3" AllowSorting="true" onsorting="GridView1_Sorting">
            <Columns>
                <asp:BoundField HeaderText="Emp Id" DataField="empno" SortExpression="empno" />
                <asp:BoundField HeaderText="Name" DataField="ename" SortExpression="ename" />
                <asp:BoundField HeaderText="Manager" DataField="ManagerName" SortExpression="ManagerName" />
                <asp:BoundField HeaderText="Salary" DataField="Salary" SortExpression="Salary" />
                <asp:BoundField HeaderText="Job" DataField="Job" SortExpression="Job" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="UploadLink" runat="server">Upload</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
