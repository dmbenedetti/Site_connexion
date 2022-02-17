using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Post_ImportarExame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Web.HttpPostedFile oFile = Request.Files["XML"];
        Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        if (oFile != null)
        {
            if (oFile.ContentLength > 0)
            {
                System.IO.StreamReader xml = new System.IO.StreamReader(oFile.InputStream);
                exameBO oExameBO = new exameBO();

                try
                {
                    exameBO_Result oResultado = oExameBO.Import(xml.ReadToEnd());
                    if (oResultado.Status)
                    {
                        Response.Write("<ResultadoExames NrFicha=\"" + oResultado.ID + "\" />");
                    }
                    else
                    {
                        Response.Write("<ResultadoExames NrFicha=\"" + oResultado.ID + "\">");
                        Response.Write("\n<Erros>");
                        Response.Write("\n<Erro IdExame=\"" + oResultado.IDE + "\" DsErro=\"" + oResultado.Mensage + "\">");
                        Response.Write("\n</Erros>");
                        Response.Write("\n</ResultadoExames>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<ResultadoExames NrFicha=\"\">");
                    Response.Write("\n<Erros>");
                    Response.Write("\n<Erro IdExame=\"\" DsErro=\"" + ex.Message + "\">");
                    Response.Write("\n</Erros>");
                    Response.Write("\n</ResultadoExames>");
                }

            }
            else
            {
                Response.Write("<ResultadoExames NrFicha=\"\">");
                Response.Write("\n<Erros>");
                Response.Write("\n<Erro IdExame=\"\" DsErro=\"Não possui arquivo\">");
                Response.Write("\n</Erros>");
                Response.Write("\n</ResultadoExames>");
            }

        }
        else
        {
            Response.Write("<ResultadoExames NrFicha=\"\">");
            Response.Write("\n<Erros>");
            Response.Write("\n<Erro IdExame=\"\" DsErro=\"Não possui arquivo\">");
            Response.Write("\n</Erros>");
            Response.Write("\n</ResultadoExames>");
        }
    }
}
