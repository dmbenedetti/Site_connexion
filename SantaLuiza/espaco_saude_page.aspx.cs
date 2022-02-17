using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class espaco_saude : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { 
        
            int id= Convert.ToInt32(Request.QueryString["id"]);

            var conteudo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id && x.id_status == 1).FirstOrDefault();
            if (conteudo != null) {

                if (conteudo.id_tipo == 1)//pagina interna
                {
                    lbl_titulo.Text = conteudo.nm_titulo;
                    ltr_conteudo.Text = conteudo.ds_conteudo;
                }
                else if(conteudo.id_tipo == 2)//link interna
                {
                    Response.Redirect(conteudo.ds_url);
                }
                else if (conteudo.id_tipo == 3)//link externo
                {
                    Response.Write(@"<script>window.open('"+conteudo.ds_url+"','janela');history.back()</script>");
                }
                else if (conteudo.id_tipo == 10)//formulario
                {
                    Response.Redirect(conteudo.ds_url);
                }
                else { 
                
                }
            }//fim if conteudo !=null
        }//fim if postback
    }
}