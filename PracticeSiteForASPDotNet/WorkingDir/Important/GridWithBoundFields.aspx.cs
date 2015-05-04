using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeSiteForASPDotNet.DataAccessRef;
using System.Data;
using System.Drawing;

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

            if (IsPostBack && FileUpload1.PostedFile != null && FileUpload1.HasFile)
            {
                if (FileUpload1.PostedFile.FileName.Length > 0)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/WorkingDir/Uploads/" + FileUpload1.FileName));
                }
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


        /**
         *  Source: http://forums.asp.net/t/1747819.aspx?how+to+change+gridview+cell+color+based+on+cell+item
         */
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                Label l = (Label) GridView1.Rows[i].FindControl("Salary");
                if (double.Parse(l.Text.Replace(",", "").Trim()) < 25000)
                {
                    GridView1.Rows[i].Cells[3].BackColor = Color.Red;
                    l.ForeColor = Color.Lavender;
                }
                else if (double.Parse(l.Text.Replace(",", "").Trim()) < 35000)
                {
                    GridView1.Rows[i].Cells[3].BackColor = Color.Lavender;
                }
                else
                {
                    GridView1.Rows[i].Cells[3].BackColor = Color.Green;
                    l.ForeColor = Color.White;
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = (LinkButton)e.Row.FindControl("UploadLink");
                lb.Attributes["onclick"] = "javascript:return showBrowseDialog('" + e.Row.RowIndex + "')";
            }
        }

    }
}