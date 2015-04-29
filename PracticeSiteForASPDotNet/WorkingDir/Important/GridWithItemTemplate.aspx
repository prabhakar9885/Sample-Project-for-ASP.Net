<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="GridWithItemTemplate.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.Important.GridWithItemTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .FixedHeader
        {
            position: absolute;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowSorting="true"
            OnSorting="GridView1_Sorting" Style="height: 100px; overflow: scroll;" HeaderStyle-CssClass="FixedHeader"
            AlternatingRowStyle-BackColor="WhiteSmoke" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Emp Id" SortExpression="empno" HeaderStyle-Width="120px"
                    ItemStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("empno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Name" SortExpression="ename" HeaderStyle-Width="120px"
                    ItemStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("ename") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Manager" SortExpression="ManagerName" HeaderStyle-Width="120px"
                    ItemStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("ManagerName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Salary" SortExpression="Salary" HeaderStyle-Width="120px"
                    ItemStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Job" SortExpression="Job" HeaderStyle-Width="120px"
                    ItemStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Job") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="120px" ItemStyle-Width="120px">
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
