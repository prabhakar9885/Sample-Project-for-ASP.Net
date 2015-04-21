using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using PracticeSiteForASPDotNet.DataAccessRef;

namespace PracticeSiteForASPDotNet.WorkingDir.Categories.Electronics
{
    public partial class PageInElectronicsFloder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XDocument xdoc = XDocument.Load(Server.MapPath("~/WorkingDir/Data/Countries/Countries.xml"));

            var temp = from t1 in xdoc.Descendants("Country")
                       select new
                       {
                           Text = t1.Element("Name").Value.Trim(),
                           Value = t1.Attribute("id").Value
                       };
            InitialiseDropDownlist(temp.ToList<dynamic>());
            InitialiseCheckBoxList(temp.ToList<dynamic>());
            InitialiseRadioButtonList(temp.ToList<dynamic>());
            InitialiseListBox(temp.ToList<dynamic>());
            InitialiseBulletedList(temp.ToList<dynamic>());
        }

        private void InitialiseListBox(List<dynamic> list)
        {
            foreach (var item in list)
                ListBox1.Items.Add(new ListItem(item.Text, item.Value));
        }

        private void InitialiseBulletedList(List<dynamic> list)
        {
            foreach (var item in list)
                BulletedList1.Items.Add(new ListItem(item.Text, item.Value));
        }

        private void InitialiseRadioButtonList(List<dynamic> list)
        {
            foreach (var item in list)
                RadioButtonList1.Items.Add(new ListItem(item.Text, item.Value));
        }

        private void InitialiseCheckBoxList(List<dynamic> list)
        {
            foreach (var item in list)
                CheckBoxList1.Items.Add(new ListItem(item.Text, item.Value));
        }

        private void InitialiseDropDownlist(List<dynamic> temp)
        {
            #region From XML
            CountriesDropDownlist.DataSource = (temp).ToList();
            CountriesDropDownlist.DataTextField = "Text";
            CountriesDropDownlist.DataValueField = "Value";

            CountriesDropDownlist.DataBind();
            #endregion

            #region From SQL
            DataAccessServiceClient cl = new DataAccessServiceClient();
            EmployeeDataContract edc = cl.GetEmployeeData(0);

            DropDownListSql.DataTextField = "Name";
            DropDownListSql.DataValueField = "Id";
            DropDownListSql.DataSource = edc.Employees.ToList();
            DropDownListSql.DataBind();
            #endregion
        }
    }
}