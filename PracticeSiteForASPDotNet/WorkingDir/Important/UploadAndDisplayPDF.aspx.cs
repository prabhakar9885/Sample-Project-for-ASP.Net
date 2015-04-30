using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;

namespace PracticeSiteForASPDotNet.WorkingDir.Important
{
    public partial class DisplayPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoadPDF_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile &&
                FileUpload1.FileName.EndsWith(".pdf", StringComparison.OrdinalIgnoreCase))
            {

                string path = @"/WorkingDir/Uploads/" + FileUpload1.FileName;
                
                if (File.Exists(Server.MapPath("~" + path)))
                    File.Delete(Server.MapPath("~" + path));

                FileUpload1.SaveAs(Server.MapPath("~" + path));
                
                placeholder.Attributes.Add("css", "border-color:Green; border-width: 5px");
                placeholder.InnerHtml =
                 @"<object data='" + path + @"' type='application/pdf' width='300' height='200'                                  runat='server' id='PdfObj'>
                        alt : <a href='" + path + @"' runat='server' id='pdfAlt'>test.pdf</a>
                  </object>";
            }
        }

        protected void ShowOutline_Click(object sender, EventArgs e)
        {
            Outline.Attributes.Add("style", "background-color: GREEN;");
        }

    }
}