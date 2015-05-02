using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeSiteForASPDotNet.DataAccessRef;
using System.Data;

/*
 * Scrollable-table with Fixed-hearder: 
 *  http://www.aspsnippets.com/Articles/Scrollable-GridView-with-Fixed-Headers-in-ASP.Net.aspx
 */

namespace PracticeSiteForASPDotNet.WorkingDir.Important
{
    public partial class GridWithBoundFields : System.Web.UI.Page
    {
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccessServiceClient dsc = new DataAccessServiceClient();
            dt = dsc.GetEmployeeDataTable().Tables[0];
            if (!IsPostBack)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataView View = dt.DefaultView;
            View.Sort = String.Format("{0} {1}", e.SortExpression, GetSortDirection());
            GridView1.DataSource = View;
            GridView1.DataBind();
        }

        private string GetSortDirection()
        {
            if (ViewState["SortDirection"] == null)
                ViewState["SortDirection"] = "ASC";
            else if (ViewState["SortDirection"].ToString() == "ASC")
                ViewState["SortDirection"] = "DESC";
            else
                ViewState["SortDirection"] = "ASC";

            return ViewState["SortDirection"].ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IdNameSal")
            {
                string[] arr = e.CommandArgument.ToString().Split(new char[] { ';' });
                SelectedId.InnerText = arr[0];
                SelectedName.InnerText = arr[1];
                SelectedSalary.InnerText = arr[2];
            }
        }

    }
}