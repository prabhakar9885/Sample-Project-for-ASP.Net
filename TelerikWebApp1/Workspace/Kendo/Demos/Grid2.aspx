<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid2.aspx.cs" Inherits="TelerikWebApp1.Workspace.Kendo.Demos.Grid2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        <div id="grid1">
        </div>
        <%--http://docs.telerik.com/kendo-ui/web/grid/introduction--%>
        <%--http://docs.telerik.com/kendo-ui/web/grid/walkthrough--%>
        <table id="grid2">
            <colgroup>
                <col />
                <col style="width: 200px" />
            </colgroup>
            <thead>
                <tr>
                    <th data-field="title" data-filterable="false">
                        Title
                    </th>
                    <th data-field="year" data-type="number" data-template="<strong>#=year#</strong>">
                        Year
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Star Wars: A New Hope
                    </td>
                    <td>
                        1977
                    </td>
                </tr>
                <tr>
                    <td>
                        Star Wars: The Empire Strikes Back
                    </td>
                    <td>
                        1980
                    </td>
                </tr>
            </tbody>
        </table>

        <table id="grid3">
            <colgroup>
                <col style="width: 200px" />
                <col style="width: 200px" />
                <col />
            </colgroup>
            <thead>
                <tr>
                    <th data-field="firstName">
                        First Name
                    </th>
                    <th data-field="lastName">
                        Last Name
                    </th>
                    <th data-field="email" data-template="<a href='mailto:#= email #'>#= email #</a>">
                        Email
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Nancy
                    </td>
                    <td>
                        Davolio
                    </td>
                    <td>
                        email@domain.com
                    </td>
                </tr>
            </tbody>
        </table>


        <div id="grid4"></div>

        <div id="grid5"></div>

        <script type="text/javascript">

            //        Grid 1
            $(document).ready(function () {
                $("#grid1").kendoGrid({
                    columns: [{
                        field: "FirstName",
                        title: "First Name"
                    },
                                {
                                    field: "LastName",
                                    title: "Last Name"
                                }],
                    dataSource: {
                        data: [{
                            FirstName: "Joe",
                            LastName: "Smith"
                        },
                                {
                                    FirstName: "Jane",
                                    LastName: "Smith"
                                }]
                    }
                });

                //        Grid 2
                $("#grid2").kendoGrid({
                    sortable: true,
                    filterable: true
                });
                var grid2 = $("#grid2").data("kendoGrid");


                //        Grid 3
                $("#grid3").kendoGrid({
                    sortable: true,
                    selectable: "multiple cell",
                    filterable: true
                });


                //        Grid 4
                var people = [{ firstName: "John 1",
                    lastName: "Smith",
                    email: "john.smith@telerik.com"
                },
                               { firstName: "Jane 2",
                                   lastName: "Smith",
                                   email: "jane.smith@telerik.com"
                               },
                               { firstName: "Josh 3",
                                   lastName: "Davis",
                                   email: "josh.davis@telerik.com"
                               },
                               { firstName: "Josh 4",
                                   lastName: "Davis",
                                   email: "josh.davis@telerik.com"
                               },
                               { firstName: "Josh 5",
                                   lastName: "Davis",
                                   email: "josh.davis@telerik.com"
                               },
                               { firstName: "Cindy 6",
                                   lastName: "Jones",
                                   email: "cindy.jones@telerik.com"
                               }];

                $("#grid4").kendoGrid({
                    height: 200,
                    dataSource: people,
                    selectable: "row"
                });

                //      Grid 5
                var ds = new kendo.data.DataSource({ 
                    schema: {
                        model: {
                            id: "firstName",
                            fields: {
                                firstName: {
                                    editable: false,
                                    nullable: true
                                },
                                lastName: {
                                    validation: {
                                        required: true
                                    }
                                },
                                email: {
                                    defaultValue: "xyz@gmail.com",
                                    validation: {
                                        required: true
                                    }
                                }
                            }
                        }
                    }
                });
                $("#grid5").kendoGrid({
                    height: 200,
                    toolbar: ["create", "save", "cancel"],
                    editable: { 
                         update: true//,
                         //destroy: false
                      },
                    selectable: "row",
                    dataSource: people, 
                    columns: [
                        {field:"firstName", title:"First Name"},
                        {field:"lastName", title:"Last Name"},
                        {field:"email", title:"Email"},
                        {
                            command: "destroy"
                        }]
                });
            });

        </script>
    </div>
    </form>
</body>
</html>
