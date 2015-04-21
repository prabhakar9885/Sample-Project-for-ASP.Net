using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeSiteForASPDotNet.DataAccessRef;
using BusinessEntities;

namespace PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer
{
    public partial class DataList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccessServiceClient cl = new DataAccessServiceClient();
            EmployeeDataContract edc = cl.GetEmployeeData(0);

            DropDownListSql.DataTextField = "Name";
            DropDownListSql.DataValueField = "Id";
            DropDownListSql.DataSource = edc.Employees.ToList();
            DropDownListSql.DataBind();
        }

        protected void SelectedNewIndex(object sender, EventArgs e)
        {
            DataAccessServiceClient cl = new DataAccessServiceClient();
            EmployeeDataContract edc = cl.GetEmployeeData(0);

            DropDownListOutput.DataTextField = "Job";
            DropDownListOutput.DataValueField = "Id";
            DropDownListOutput.DataSource = edc.Employees.ToList();
            DropDownListOutput.DataBind();
        }
    }
}