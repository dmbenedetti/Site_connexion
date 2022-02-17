using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write(@"<script>parent.$.fn.colorbox.close();</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(@"<script>parent.$.fn.colorbox.close();</script>");
    }
}