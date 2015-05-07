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

public partial class RadAsyncUploadDemo1 : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if(RadAsyncUpload1.UploadedFiles.Count>0)
            return;
        RadAsyncUpload1.UploadedFiles[0].
            SaveAs(Server.MapPath(@"~/Workspace/Uploads/"+
            RadAsyncUpload1.UploadedFiles[0].FileName));
    }
}
