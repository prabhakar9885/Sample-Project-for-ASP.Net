<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="GridWithBoundFields.aspx.cs"
    EnableEventValidation="false"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.Important.GridWithBoundFields" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" rules="all" border="1" id="Table1" style="border-collapse: collapse;">
            <tr>
                <td style="width: 120px;">
                    <asp:LinkButton ID="Sort1" OnClientClick="javascript:__doPostBack('GridView1','Sort$empno')"
                        runat="server">Emp Id</asp:LinkButton>
                </td>
                <td style="width: 150px;">
                    <asp:LinkButton ID="Sort2" OnClientClick="javascript:__doPostBack('GridView1','Sort$ename')"
                        runat="server">Name</asp:LinkButton>
                </td>
                <td style="width: 150px;">
                    <asp:LinkButton ID="Sort3" OnClientClick="javascript:__doPostBack('GridView1','Sort$ManagerName')"
                        runat="server">Manager</asp:LinkButton>
                </td>
                <td style="width: 150px;">
                    <asp:LinkButton ID="Sort4" OnClientClick="javascript:__doPostBack('GridView1','Sort$Salary')"
                        runat="server">Salary</asp:LinkButton>
                </td>
                <td style="width: 150px;">
                    <asp:LinkButton ID="Sort5" OnClientClick="javascript:__doPostBack('GridView1','Sort$Job')"
                        runat="server">Job</asp:LinkButton>
                </td>
                <td style="width: 150px;">
                    Action
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 200px; width: 906px; overflow: scroll;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" ShowHeader="false"
            AutoGenerateColumns="false" PageSize="5" AllowSorting="true" OnSorting="GridView1_Sorting">
            <AlternatingRowStyle BackColor="YELLOW" />
            <Columns>
                <asp:TemplateField HeaderText="Emp Id" SortExpression="empno" HeaderStyle-Width="120px"
                    ItemStyle-Width="120px">
                    <ItemTemplate>
                        <asp:LinkButton ID="View" runat="server">
                            <%--CommandName="View" 
                            CommandArgument='<%#Eval("ename") %>;<%#Eval("ManagerName") %>;<%#Eval("Salary") %>'>--%>
                                <%#Eval("empno") %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <%--<asp:BoundField HeaderText="Emp Id" DataField="empno" SortExpression="empno" ItemStyle-Width="150px" />--%>
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
