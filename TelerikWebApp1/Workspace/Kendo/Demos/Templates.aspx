<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Templates.aspx.cs" Inherits="TelerikWebApp1.Workspace.Kendo.Demos.Templates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/kendo.default.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        table, tr, td
        {
            border: 1px Solid Gray;
        }
    </style>
    <script src="../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script src="../Scripts/kendo.web.min.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <script type="text/javascript">
        $(function () {
            var data = {
                listName: "Cars List",
                cars: [
                                     { Make: "Ferrari", Model: "LA" },
                                     { Make: "Oddie", Model: "NY" }
                                  ]
            };

            var carsTemplate = kendo.template($("#template_li").html())(data);
            $("#container").html(carsTemplate);

            var carsTemplate = kendo.template($("#template_table").html())(data);
            $("#tableContainer").html(carsTemplate);
        });
    </script>

    <div id="container">
    </div>
    <script type="text/x-kendo-template" id="template_li">
        <h1> #= listName # </h1>
        <ul>
        # for( var i=0; i< cars.length; i++ ){ #
            <li>  #= cars[i]["Make"] # - #= cars[i]["Model"] #  </li>
        # } #
        </ul>
    </script>


    <div id="tableContainer">
    </div>
    <script type="text/javascript" id="template_table">
        <h1> #= listName # </h1>
        <table>
        #  for( var i = 0; i<cars.length; i++){  #
                <tr>    
                     <td>  
                        #= cars[i]["Make"] #
                     </td> 
                     <td> 
                        #= cars[i]["Model"] #
                     </td> 
               </tr>   
        #   } #
        </table>
    </script>
    </form>
</body>
</html>
