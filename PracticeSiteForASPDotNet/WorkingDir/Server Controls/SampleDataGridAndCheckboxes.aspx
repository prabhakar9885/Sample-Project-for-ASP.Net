<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleDataGridAndCheckboxes.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer.EmployeeDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server">
            <%--<asp:BoundField ReadOnly="True" HeaderText="Emp Id" DataField="Id" SortExpression="Id">
            </asp:BoundField>
            <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name">
            </asp:BoundField>--%>
        </asp:GridView>
    </div>
    <div>
        <fieldset style="width: 40%;">
            <legend>Education </legend>
            <asp:CheckBox ID="UG" runat="server" Text="Under Graduate" AutoPostBack="true" OnCheckedChanged="UpdateEdu" />
            <asp:CheckBox ID="PG" runat="server" Text="Post Graduate" AutoPostBack="true" OnCheckedChanged="UpdateEdu" />
            <asp:CheckBox ID="Phd" runat="server" Text="Phd" AutoPostBack="true" OnCheckedChanged="UpdateEdu" />
            <br />
            <label id="MyLabel" runat="server">
                <b>Selected</b></label>
        </fieldset>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </form>
</body>
</html>
