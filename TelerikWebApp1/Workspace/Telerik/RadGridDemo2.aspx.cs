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
using TelerikWebApp1.DataAccessRef;
using DataAccessLayer;

public partial class RadGridDemo2 : System.Web.UI.Page
{
    EmployeeDataContract edc;

    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessServiceClient client = new DataAccessServiceClient();
        edc = client.GetEmployeeData(0);

        RadGrid1.DataSource = edc.Employees;
        RadGrid1.DataBind();

    }

    protected void RadGrid1_SortCommand(object sender, GridSortCommandEventArgs e)
    {
        if (!e.Item.OwnerTableView.SortExpressions.ContainsExpression(e.SortExpression))
        {
            GridSortExpression sortExpr = new GridSortExpression();
            sortExpr.FieldName = e.SortExpression;
            sortExpr.SortOrder = GridSortOrder.Ascending;

            e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
        }
        else
        {
            GridSortExpression sortExpr = new GridSortExpression();
            sortExpr.FieldName = e.SortExpression;
            sortExpr.SortOrder = GridSortOrder.Descending;

            e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
        }
    }

}
