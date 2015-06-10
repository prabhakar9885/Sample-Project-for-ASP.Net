<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Multiselect.aspx.cs" Inherits="TelerikWebApp1.Workspace.Kendo.Demos.Multiselect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.dataviz.min.css" />
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.dataviz.material.min.css" />
    <script src="http://cdn.kendostatic.com/2015.1.429/js/jquery.min.js"></script>
    <script src="http://cdn.kendostatic.com/2015.1.429/js/kendo.all.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <select id="multiselect1" style="width: 450px;">
        </select>
        <input type="button" value="Show Value part" id="button1"/>
        <br />
        
        <select id="multiselect2" style="width: 450px;" multiple>
            <option selected>Item 1</option>
            <option>Item 2</option>
            <option selected>Item 3</option>
            <option>Item 4</option>
            <option>Item 5</option>
            <option>Item 6</option>
        </select>
        <input type="button" value="Show Value part" id="button2"/>
        <br />
        
        <select id="multiselect3" style="width: 450px;">
        </select>
        <script id="tagTemplate3" type="text/x-kendo-template">
                ID: #= CustomerID # ; Name: #= ContactName#
        </script>
        <input type="button" value="Show Value part" id="button3"/>
        <br />

        <input id="multiselect4" style="width: 450px;"/>
        <script id="headerTemplate" type="text/x-kendo-template">
            <span style="padding-left: 5px;"><strong>Header</strong></span>
        </script>
        <input type="button" value="Show Value part" id="button4"/>
        <br />


        <input id="multiselect5" style="width: 450px;"/>
        <input type="button" value="Show Value part" id="button5"/>
        <br />


        <script type="text/javascript">
            $(document).ready(function () {

                // MultiSelect 1
                var ms1 = $("#multiselect1").kendoMultiSelect({
                    dataTextField: "key",
                    dataValueField: "value",
                    dataSource: [
                                        { key: "Item1", value: "1" },
                                        { key: "Item2", value: "2" }
                                      ]
                }).data("kendoMultiSelect");
                $("#button1").click(function (e) {
                    alert("Required: " + ms1.value());
                });


                // MultiSelect 2
                var ms2 = $("#multiselect2").kendoMultiSelect().data("kendoMultiSelect");
                $("#button2").click(function (e) {
                    alert("Required: " + ms2.value());
                });


                // MultiSelect 3
                var ms3 = $("#multiselect3").kendoMultiSelect({
                    tagTemplate: $("#tagTemplate3").html(),
                    dataTextField: "ContactName",
                    dataValueField: "CustomerID",
                    dataSource: {
                        transport: {
                            read: {
                                dataType: "jsonp",
                                url: "http://demos.telerik.com/kendo-ui/service/Customers"
                            }
                        }
                    }
                });
                $("#button3").click(function (e) {
                    alert("Required: " + ms3.val());
                });


                // MultiSelect 4
                var ms4 = $("#multiselect4").kendoMultiSelect({
                    headerTemplate: $("#headerTemplate").html(),
                    tagTemplate: $("#tagTemplate3").html(),
                    dataTextField: "ContactName",
                    dataValueField: "CustomerID",
                    dataSource: {
                        transport: {
                            read: {
                                dataType: "jsonp",
                                url: "http://demos.telerik.com/kendo-ui/service/Customers"
                            }
                        }
                    }
                }).data("kendoMultiSelect");
                ms4.list.width(400);
                $("#button4").click(function (e) {
                    alert("Required: " + ms4.value());
                });


                // MultiSelect 5
                var ms5 = $("#multiselect5").kendoMultiSelect({
                                placeholder: "Select products...",
                                dataTextField: "ProductName",
                                dataValueField: "ProductID",
                                //autoBind: false,
                                dataSource: {
                                    type: "odata",
                                    serverFiltering: true,
                                    transport: {
                                        read: {
                                            url: "http://demos.telerik.com/kendo-ui/service/Northwind.svc/Products"
                                        }
                                    }
                                },
                                value: [
                                        { ProductName: "Chang", ProductID: 2 },
                                        { ProductName: "Uncle Bob's Organic Dried Pears", ProductID: 7 }
                                    ]
                            }).data("kendoMultiSelect");
                $("#button5").click(function (e) {
                    alert("Required: " + ms5.value());
                });

            });
        </script>
    </div>
    </form>
</body>
</html>
