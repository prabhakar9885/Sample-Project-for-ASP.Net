using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

namespace PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/WorkingDir/Uploads/" + FileUpload1.FileName));
                UploadButton.ForeColor = Color.Green;
                Label1.Text = "<script type='text/javascript'>alert('aa');</script>";
            }
        }
    }
}