using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

namespace PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods
{

    /*
     * Reference: http://dotnetmentors.com/aspnet/jquery-autocomplete-by-example.aspx
     */
    public partial class JQuery_AutoComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string[] GetEmps(string term)
        {
            List<string> retCategory = new List<string>();
            string ConnectionString =ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = string.Format("select distinct ename from emp where eName Like '%{0}%'", term);
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        retCategory.Add(reader.GetString(0));
                    }
                }
                con.Close();
            }
            return retCategory.ToArray();
        }
    }

}