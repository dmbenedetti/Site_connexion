using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 5;//Imprensa

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            chb_hospitais.DataSource = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1 && x.id_hospital !=1).ToList();
            chb_hospitais.DataTextField = "nm_hospital";
            chb_hospitais.DataValueField = "id_hospital";
            chb_hospitais.DataBind();
            chb_hospitais.Enabled = false;

            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
            int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);

            var noticia = (from n in cnDor.TB_PORTAL_CONTEUDO
                               where n.id_conteudo==id_conteudo && n.id_noticia==id_noticia
                               select n.nm_titulo).FirstOrDefault();
            if (noticia != null)
            {
                lbl_titulo.Text = noticia;
            }
            else {
                Response.Write(@"<script>alert('Notícia não encontrada');location.href='portal_noticias.aspx'</script>");
            }
            


        }//fim do if !Page.IsPostBack
    }
    
    
    protected void excluir_imagem() {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);

        var noticia = (from n in cnDor.TB_PORTAL_CONTEUDO
                       where n.id_conteudo == id_conteudo && n.id_noticia == id_noticia
                       select n.ds_imgDestaque).FirstOrDefault();
        if(noticia!=null){
        var imagem = noticia;
        if (imagem != "" || imagem != null)
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/images/noticias/" + imagem);
            File.Delete(MapPath("../") + "/images/noticias/" + imagem);
        }
        
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
            try
            {
                var conteudo_hosptial = (from v in cnDor.TB_PORTAL_CONTEUDO_HOSPITAL where v.id_conteudo == id_conteudo select v);
                foreach (var ch in conteudo_hosptial)
                {
                    cnDor.DeleteObject(ch);
                }

                var noticia = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo == id_conteudo && n.id_noticia == id_noticia select n).FirstOrDefault();
                excluir_imagem();
                cnDor.DeleteObject(noticia);
                cnDor.SaveChanges();  
                   /* //
                     * 
                     * voltar aqui para fazer o insert da notícia na tabela de hospitais;
                     *
                     * 
                     *location.href='portal_noticias.aspx'
                    * */
                //provavelmente o ACT está dando conflito com a linha abaixo, resolvi fazendo o response.write na linha seguinte
                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Dados Gravados com sucesso');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Notícia Excluida Com Sucesso');location.href='portal_noticias.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    
        
}

   
}