<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="TelerikWebApp1.Workspace.Kendo.Demos.Grid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script src="../Scripts/kendo.web.min.js" type="text/javascript"></script>

    <link href="../Styles/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/kendo.default.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="cars"></div>
        <script type="text/javascript">
            $(function () {

                var cars = [
                                { year: 2012, make: "Ferrari", model: "CA" },
                                { year: 2009, make: "Benz", model: "LA" },
                                { year: 2010, make: "Americano", model: "FL" },
                                { year: 2003, make: "Trapez", model: "NY" },
                                { year: 2008, make: "Cart", model: "SJ" },
                                { year: 2012, make: "Royal", model: "AL" },
                                { year: 2009, make: "Engfield", model: "SF" },
                                { year: 2005, make: "Bullet", model: "SF" },
                                { year: 2000, make: "Oddy", model: "FL" },
                                { year: 2015, make: "Bokadi", model: "NY" }
                           ];

                var carsDS = new kendo.data.DataSource({
                    data: cars,
                    pageSize: 4,
                    sort: { field: "year", dir: "asc" }
                });
                carsDS.read();

                $("#cars").kendoGrid({
                    dataSource: carsDS,
                    columns: [
                                { field: "year", title: "Year" },
                                { field: "make", title: "Make" },
                                { field: "model", title: "Model" },
                                { command: [ "edit", "destroy"] }
                               ],
                    scrollable: false,
                    pageable: true,
                    sortable: true,
                    groupable: true,
                    filterable: true,
                    editable: "inline"
                });
            });
        </script>
    </div>
    </form>
</body>
</html>
