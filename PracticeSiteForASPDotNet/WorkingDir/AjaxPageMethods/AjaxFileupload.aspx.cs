using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods
{
    public partial class AjaxFileupload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && FileUpload1.PostedFile != null)
            {
                if (FileUpload1.PostedFile.FileName.Length > 0)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/WorkingDir/Uploads/" + FileUpload1.FileName));
                }
            }
        }
    }
}