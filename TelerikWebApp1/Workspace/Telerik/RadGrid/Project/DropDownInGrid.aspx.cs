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
using System.IO;

public partial class DropDownInGrid : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string RootFolder = "~/Uploads";
        string P = "/P1";
        string C = "/C1";
        string User = "/User";
        string temp = "/temp";
        string Processing = "/Processing";

        if (!Directory.Exists(Server.MapPath(RootFolder)))
        {
            Directory.CreateDirectory(Server.MapPath(RootFolder));
        }
        Session["RootFolder"] = RootFolder;

        if (!Directory.Exists(Server.MapPath(RootFolder + P)))
        {
            Directory.CreateDirectory(Server.MapPath(RootFolder + P));
        }
        Session["P_Folder"] = RootFolder + P;

        if (!Directory.Exists(Server.MapPath(RootFolder + P + C)))
        {
            Directory.CreateDirectory(Server.MapPath(RootFolder + P + C));
        }
        Session["C_Folder"] = RootFolder + P + C;

        if (!Directory.Exists(Server.MapPath(RootFolder + P + C + User)))
        {
            Directory.CreateDirectory(Server.MapPath(RootFolder + P + C + User));
        }
        Session["User_Folder"] = RootFolder + P + C + User;

        if (!Directory.Exists(Server.MapPath(RootFolder + P + C + User + temp)))
        {
            Directory.CreateDirectory(Server.MapPath(RootFolder + P + C + User + temp));
        }
        Session["Temp_Folder"] = RootFolder + P + C + User + temp;

        if (!Directory.Exists(Server.MapPath(RootFolder + P + C + User + Processing)))
        {
            Directory.CreateDirectory(Server.MapPath(RootFolder + P + C + User + Processing));
        }
        Session["Processing_Folder"] = RootFolder + P + C + User + Processing;
    }
}
