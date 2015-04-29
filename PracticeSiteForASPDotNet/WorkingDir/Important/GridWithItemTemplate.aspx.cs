using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeSiteForASPDotNet.DataAccessRef;
using System.Data;

namespace PracticeSiteForASPDotNet.WorkingDir.Important
{
    public partial class GridWithItemTemplate : System.Web.UI.Page
    {
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccessServiceClient dsc = new DataAccessServiceClient();
            dt = dsc.GetEmployeeDataTable().Tables[0] ;
            GridView1.DataSource = dt;
            GridView1.DataBind();
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowIndex == 0)
                    e.Row.Style.Add("height", "150px");
            }
        }

    }
}