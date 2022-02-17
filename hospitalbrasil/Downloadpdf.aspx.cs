using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail
using System.Text;


using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.xml;
using System.IO;
public partial class Downloadpdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string html = Session.Contents["html"].ToString();

            geraPDF(html);

        }
    }
    private void DownloadAsPDF(MemoryStream ms)
    {
        string arquivo = "Aviso_de_Cirurgia_" + DateTime.Now.ToString("dd-MM-yyyy");
        Response.Clear();
        Response.ClearContent();
        Response.ClearHeaders();
        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + arquivo + ".pdf");

        Response.OutputStream.Write(ms.GetBuffer(), 0, ms.GetBuffer().Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();
        Response.End();
        ms.Close();

    }
    private void geraPDF(string html)
    {
        //(1)using PDFWriter
        Document doc = new Document();
        MemoryStream memoryStream = new MemoryStream();
        PdfWriter writer = PdfWriter.GetInstance(doc, memoryStream);
        doc.Open();
        iTextSharp.text.html.simpleparser.StyleSheet styles = new iTextSharp.text.html.simpleparser.StyleSheet();
        iTextSharp.text.html.simpleparser.HTMLWorker hw = new iTextSharp.text.html.simpleparser.HTMLWorker(doc);
        hw.Parse(new StringReader(html));
        writer.CloseStream = false;

        doc.Close();
        //Get the pointer to the beginning of the stream. 
        memoryStream.Position = 0;
        //You may use this PDF in memorystream to send as an attachment in an email
        //OR download as a PDF
        //SendEmail(memoryStream);
        DownloadAsPDF(memoryStream);

    }
}