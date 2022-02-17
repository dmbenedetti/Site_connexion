using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("pt-br");
        Response.AppendHeader("content-disposition", "attachment; filename=exames.xls");
        Response.AddHeader ("Content-Type", "text/html; charset=utf-8");
        Response.AddHeader("Pragma", "no-cache");
        Response.Charset = "utf-8";
        Response.ContentType = "application/vnd.ms-excel";
    }
}