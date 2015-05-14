<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewWithSqlDataSourceInAspx.aspx.cs"
    Inherits="TelerikWebApp1.Workspace.DataGrid.GridViewWithSqlDataSourceInAspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvDetails" DataKeyNames="empno" runat="server" AutoGenerateColumns="false"
            CssClass="Gridview" HeaderStyle-BackColor="#61A6F8" ShowFooter="true" HeaderStyle-Font-Bold="true"
            HeaderStyle-ForeColor="White" DataSourceID="sqlds" OnRowCommand="gvDetails_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:LinkButton ID="imgbtnUpdate" CommandName="Update" runat="server" ToolTip="Update" Text="Update"
                            Height="20px" />
                        <asp:LinkButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ToolTip="Cancel" Text="Cancel"
                            Height="20px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="imgbtnEdit" CommandName="Edit" runat="server" ToolTip="Edit"
                            Text="Edite" Height="20px" />
                        <asp:LinkButton ID="imgbtnDelete" CommandName="Delete" Text="Delete" runat="server"
                            ToolTip="Delete" Height="20px" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="imgbtnAdd" runat="server" CommandName="Insert" Text="Add"
                            Height="30px" ToolTip="Add new User" ValidationGroup="validaiton" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User ID" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:TextBox ID="txteditUsrID" runat="server" Text='<%#Eval("empno") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblitemUsrID" runat="server" Text='<%#Eval("empno") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewUsrID" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvusername" runat="server" ControlToValidate="txtNewUsrID"
                            Text="*" ValidationGroup="validaiton" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("ename") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblfname" runat="server" Text='<%#Eval("ename") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewName" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvfname" runat="server" ControlToValidate="txtNewName"
                            Text="*" ValidationGroup="validaiton" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Manager" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtManager" runat="server" Text='<%#Eval("mgr") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbllManager" runat="server" Text='<%#Eval("mgr") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewManager" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvlname" runat="server" ControlToValidate="txtNewManager"
                            Text="*" ValidationGroup="validaiton" />
                    </FooterTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtcity" runat="server" Text='<%#Eval("City") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblcity" runat="server" Text='<%#Eval("City") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtftrcity" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtftrcity"
                            Text="*" ValidationGroup="validaiton" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Designation" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDesg" runat="server" Text='<%#Eval("Designation") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDesg" runat="server" Text='<%#Eval("Designation") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtftrDesignation" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvdesignation" runat="server" ControlToValidate="txtftrDesignation"
                            Text="*" ValidationGroup="validaiton" />
                    </FooterTemplate>
                </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>

        <div>
            <asp:Label ID="lblresult" runat="server"></asp:Label>
        </div>

        <asp:SqlDataSource ID="sqlds" runat="server" ConnectionString="<%$ ConnectionStrings:MyDB %>"
            SelectCommand="Select * from emp" 
            InsertCommand="insert into emp(empno,ename,mgr) values(@empno, @Name, @Manager)"
            DeleteCommand="delete from emp where empno=@empno" 
            UpdateCommand="update emp set eName=@Name, mgr=@Manager where empno=@empno">
            <UpdateParameters>
                <asp:Parameter Name="empno" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Manager" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="empno" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Manager" Type="String" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="empno" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <%--
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>--%>
    </div>
    </form>
</body>
</html>
