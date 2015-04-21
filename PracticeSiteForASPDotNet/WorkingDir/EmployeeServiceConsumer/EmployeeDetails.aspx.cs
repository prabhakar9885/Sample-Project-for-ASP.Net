using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccessRef.DataAccessServiceClient client = new DataAccessRef.DataAccessServiceClient();
            DataAccessRef.EmployeeDataContract edc = client.GetEmployeeData(0);

            if (!IsPostBack)
            {
                GridView1.DataSource = edc.Employees.ToList();
                GridView1.DataBind();
                UG.Focus();
            }
        }

        DateTime Now()
        {
            return DateTime.Now;
        }

        protected void UpdateEdu(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (UG.Checked)
                sb.Append(UG.Text);
            if (PG.Checked)
                sb.Append("; " + PG.Text);
            if (Phd.Checked)
                sb.Append("; " + Phd.Text);

            MyLabel.InnerHtml = "<b>Selected: </b>" + sb.ToString();
        }
    }
}