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
using System.Drawing;

public partial class RadGridDemo2 : System.Web.UI.Page
{
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack && FileUpload1.PostedFile != null)
        //{
        //    if (FileUpload1.PostedFile.FileName.Length > 0)
        //    {
        //        FileUpload1.SaveAs(Server.MapPath("~/Workspace/Uploads/" + FileUpload1.FileName));
        //        ScriptHolder.InnerHtml = "var wndo = $find('<%=RadWindow2.ClientID %>');"+
        //                                    "wndo.setUrl(e.target.href);"+
        //                                    "wndo.show();";
        //    }
        //}
    }

    protected void RadGrid1_SortCommand(object sender, GridSortCommandEventArgs e)
    {
        //if (!e.Item.OwnerTableView.SortExpressions.ContainsExpression(e.SortExpression))
        //{
        //    GridSortExpression sortExpr = new GridSortExpression();
        //    sortExpr.FieldName = e.SortExpression;
        //    sortExpr.SortOrder = GridSortOrder.Ascending;

        //    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
        //}
        //else
        //{
        //    GridSortExpression sortExpr = new GridSortExpression();
        //    sortExpr.FieldName = e.SortExpression;
        //    sortExpr.SortOrder = GridSortOrder.Descending;

        //    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
        //}
    }

    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        DataAccessServiceClient client = new DataAccessServiceClient();
        dt = client.GetEmployeeDataTable().Tables[0];

        (sender as RadGrid).DataSource = dt;
    }

    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem gdi = (GridDataItem)e.Item;
            try
            {
                if( gdi["ActionColumn"] != null)
                {
                    GridTableCell cell = (GridTableCell)gdi["ActionColumn"];
                    HyperLink link = (HyperLink)cell.FindControl("Link2");
                    
                    link.Attributes.Add("href", "RadWindowContent2.aspx?" +
                        "ename=" + gdi["enameUnique"].Text.Trim() + "&" +
                        "job=" + gdi["Job"].Text.Trim() + "&" +
                        "salary=" + gdi["SalaryUnique"].Text.Trim() + "&" +
                        "manager=" + gdi["ManagerName"].Text.Trim());
                }
                if (gdi["empnoUnique"] != null)
                {
                    GridTableCell cell = (GridTableCell)gdi["empnoUnique"];
                    HyperLink link = (HyperLink)cell.FindControl("Link");

                    link.Attributes.Add("href", "RadWindowContent.aspx?" +
                        "ename=" + gdi["enameUnique"].Text.Trim() + "&" +
                        "job=" + gdi["Job"].Text.Trim() + "&" +
                        "salary=" + gdi["SalaryUnique"].Text.Trim() + "&" +
                        "manager=" + gdi["ManagerName"].Text.Trim());
                }
                else if (double.Parse(gdi["SalaryUnique"]
                            .Text.Replace(",", "").ToString()) <= 25000)
                    gdi["SalaryUnique"].BackColor = Color.Yellow;
            }
            catch (Exception ex)
            {

                throw;
            }

        }
    }


}
