using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class DynamicGridWithAddEditDelete : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Search_Click(object sender, EventArgs e)
    {
          //When Search button is clicked from the UI, a Postback occurs.
          //When the Postback occues, the Page_Load event and then RadGrid1_NeedDataSource event get triggered.
          //The RadGrid1_NeedDataSource event handler captures the text from the textbox, executes the SP and then re-initializes the RadGrid's DataSource
    }

    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        string SearchPattern = ShipCityNamePatternTB.Text.Trim();
        DataSet ds = new DataSet();

        if (SearchPattern == "")
            return;

        string ConnStr = ConfigurationManager.ConnectionStrings["NORTHWINDConnectionString2"].ToString();
        using (SqlConnection Conn = new SqlConnection(ConnStr))
        {
            SqlCommand Cmd = new SqlCommand("GetOrdersWithProductInfo", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add(new SqlParameter("@ShipCitySubstr", SearchPattern));
            SqlDataAdapter Adpt = new SqlDataAdapter(Cmd);

            Adpt.Fill(ds);
        }

        RadGrid1.DataSource = ds.Tables[0];
    }

    protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        GridDataItem Item = e.Item as GridDataItem;

        int OrderId = int.Parse(Item["OrderID"].Text);
        string ProductName = Item["ProductName"].Text;

        string ConnStr = ConfigurationManager.ConnectionStrings["NORTHWINDConnectionString2"].ToString();
        using (SqlConnection Conn = new SqlConnection(ConnStr))
        {
            SqlCommand Cmd = new SqlCommand("DeleteAnOrder", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add(new SqlParameter("@OrderId", OrderId));
            Cmd.Parameters.Add(new SqlParameter("@ProductName", ProductName));

            Conn.Open();
            Cmd.ExecuteNonQuery();
            Conn.Close();
        }
    }

    protected void RadGrid1_EditCommand(object sender, GridCommandEventArgs e)
    {
        GridDataItem Item = e.Item as GridDataItem;
        Session["ProductNameOld"] = Item["ProductName"].Text;
    }

    protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
    {
    }

    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        GridEditableItem Item = e.Item as GridEditableItem;

        Dictionary<string, string> NewValues = new Dictionary<string, string>();
        e.Item.OwnerTableView.ExtractValuesFromItem(NewValues, Item);

        int OrderId = int.Parse(Item["OrderId"].Text);
        string ProductNameOld = Session["ProductNameOld"].ToString();

        string ConnStr = ConfigurationManager.ConnectionStrings["NORTHWINDConnectionString2"].ToString();
        using (SqlConnection Conn = new SqlConnection(ConnStr))
        {
            SqlCommand Cmd = new SqlCommand("UpdateProductIdForAnOrder", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add(new SqlParameter("@OrderId", OrderId));
            Cmd.Parameters.Add(new SqlParameter("@ProductNameOld", ProductNameOld));
            Cmd.Parameters.Add(new SqlParameter("@ProductNameNew", NewValues["ProductName"].ToString()));

            Conn.Open();
            Cmd.ExecuteNonQuery();
            Conn.Close();
        }
    }
}


//      SP Code :
//      =========

//      CREATE PROCEDURE GetOrdersWithProductInfo 
//      (
//          @ShipCitySubstr		VARCHAR(20) = NULL
//      )
//      AS
//          INSERT INTO	temp_GetOrdersWithProductInfo 
//          SELECT		o.OrderID,
//                      p.ProductName,
//                      o.ShipCity
//          FROM		Orders o
//          JOIN		[Order Details] od
//          ON			o.OrderID = od.OrderID 
//          JOIN		Products p
//          ON			p.ProductID = od.ProductID
//          WHERE		o.ShipCity LIKE '%'+ISNULL(@ShipCitySubstr,'')	+'%'
//          ORDER BY	o.OrderID
	        
//          SELECT		* 
//          FROM		temp_GetOrdersWithProductInfo
	        
//          DELETE FROM temp_GetOrdersWithProductInfo
//      GO

//      ---------------------------------------------------------------------

//      CREATE PROCEDURE UpdateProductIdForAnOrder
//      (
//          @ProductNameOld	VARCHAR(80),
//          @ProductNameNew	VARCHAR(80),
//          @OrderId		INT
//      )
//      AS
//          UPDATE	[Order Details]
//          SET		ProductID = (	SELECT	p.ProductID
//                                  FROM	Products p
//                                  WHERE	p.ProductName = @ProductNameNew)
//          WHERE	OrderID = @OrderId AND
//                  ProductID = (	SELECT	p.ProductID
//                                  FROM	Products p
//                                  WHERE	p.ProductName = @ProductNameOld)
//      GO

//      ---------------------------------------------------------------------

//      CREATE PROCEDURE DeleteAnOrder
//      (
//          @ProductName	VARCHAR(80),
//          @OrderId		INT
//      )
//      AS
//      BEGIN
//          DELETE	FROM	[Order Details]
//          WHERE			OrderID= @OrderId AND
//                          ProductID = ( SELECT	p.ProductID
//                                          FROM	Products p
//                                          WHERE	p.ProductName = @ProductName)

//          DELETE	FROM	Orders
//          WHERE			OrderID = @OrderId AND
//                          NOT EXISTS( SELECT	1 
//                                      FROM	[Order Details] od
//                                      WHERE	od.OrderID=@OrderId)
//      END
//      GO