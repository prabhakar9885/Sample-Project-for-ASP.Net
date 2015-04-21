<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
  <title>Calling page methods with jQuery</title>
  <style type="text/css">
    #Result {
      cursor: pointer;
    }
  </style>

  
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
        $('#Result').click(function() {
          $.ajax({
            type: "POST",
            url: "Default.aspx/HelloWorld",
            data: "{}",
            contentType: "application/json",
            dataType: "json",
            success: function(msg) {
              // Replace the div's content with the page method's return.
              $("#Result").text(msg.d);
            }
          });
        });
    });
  </script>

</head>
<body>
  <div id="Result">Click here for the time.</div>
</body>
</html>