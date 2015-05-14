using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace TelerikWebApp1.Workspace.DataGrid
{
    public partial class GridViewWithSqlDataSourceInAspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                TextBox empno = (TextBox)gvDetails.FooterRow.FindControl("txtNewUsrID");
                TextBox ename = (TextBox)gvDetails.FooterRow.FindControl("txtNewName");
                TextBox Mgr = (TextBox)gvDetails.FooterRow.FindControl("txtNewManager");
                sqlds.InsertParameters["empno"].DefaultValue = empno.Text.Trim();
                sqlds.InsertParameters["Name"].DefaultValue = ename.Text.Trim();
                sqlds.InsertParameters["Manager"].DefaultValue = Mgr.Text;
                sqlds.Insert();
                lblresult.Text = ename.Text + " Details Inserted Successfully";
                lblresult.ForeColor = Color.Green;
            }
            if (e.CommandName == "Update")
            {
                GridViewRow gvrow = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                //Label lblusername = (Label)gvrow.FindControl("lbleditusr");
                //TextBox txtfirstname = (TextBox)gvrow.FindControl("txtfname");
                //TextBox txtlastname = (TextBox)gvrow.FindControl("txtlname");
                //TextBox txtCity = (TextBox)gvrow.FindControl("txtcity");
                //TextBox txtDesgnation = (TextBox)gvrow.FindControl("txtDesg");

                TextBox empno = (TextBox)gvrow.FindControl("txteditUsrID");
                TextBox ename = (TextBox)gvrow.FindControl("txtName");
                TextBox Mgr = (TextBox)gvrow.FindControl("txtManager");

                sqlds.UpdateParameters["empno"].DefaultValue = empno.Text.Trim();
                sqlds.UpdateParameters["Name"].DefaultValue = ename.Text.Trim();
                sqlds.UpdateParameters["Manager"].DefaultValue = Mgr.Text;

                sqlds.Update();
                lblresult.Text = ename.Text + " Details Updated Successfully";
                lblresult.ForeColor = Color.Green;
            }
            if (e.CommandName == "Delete")
            {
                GridViewRow gvdeleterow = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                Label empno = (Label)gvdeleterow.FindControl("lblitemUsrID");

                sqlds.DeleteParameters["empno"].DefaultValue = empno.Text.Trim();

                sqlds.Delete();
                lblresult.Text = empno.Text + " Deleted Successfully";
                lblresult.ForeColor = Color.Red;
            }
        }
 
    }
}