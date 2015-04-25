using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class TelerikWebForm1 : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void UploadImage(object sender, EventArgs e)
    {
        string FileName = ImageRadAsyncUpload.UploadedFiles[0].FileName;
        ProfilePicImage.ImageUrl = "~/Workspace/Data/" + FileName;
    }
}
