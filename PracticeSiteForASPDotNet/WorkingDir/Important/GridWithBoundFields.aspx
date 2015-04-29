<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="GridWithBoundFields.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.Important.GridWithBoundFields" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" rules="all" border="1" id="Table1" style="border-collapse: collapse;">
            <tr>
                <td style="width: 150px;">
                    Emp Id
                </td>
                <td style="width: 150px;">
                    Name
                </td>
                <td style="width: 150px;">
                    Manager
                </td>
                <td style="width: 150px;">
                    Aslary
                </td>
                <td style="width: 150px;">
                    Job
                </td>
                <td style="width: 150px;">
                    Action
                </td>
            </tr>
        </table>
    </div>
    <div style="height:200px; width:935px; overflow:scroll;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" ShowHeader="false"
            AutoGenerateColumns="false" PageSize="5" AllowSorting="true" OnSorting="GridView1_Sorting">
            <AlternatingRowStyle BackColor="YELLOW" />
            <Columns>
                <asp:BoundField HeaderText="Emp Id" DataField="empno" SortExpression="empno" ItemStyle-Width="150px" />
                <asp:BoundField HeaderText="Name" DataField="ename" SortExpression="ename" ItemStyle-Width="150px" />
                <asp:BoundField HeaderText="Manager" DataField="ManagerName" SortExpression="ManagerName"
                    ItemStyle-Width="150px" />
                <asp:BoundField HeaderText="Salary" DataField="Salary" SortExpression="Salary" ItemStyle-Width="150px" />
                <asp:BoundField HeaderText="Job" DataField="Job" SortExpression="Job" ItemStyle-Width="150px" />
                <asp:TemplateField HeaderText="Action" ItemStyle-Width="150px">
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
