using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
            var campanha = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo==id_conteudo select n.nm_titulo).FirstOrDefault();
            if (campanha != null)
            {
                lbl_titulo.Text = campanha;
            }
            else {
                Response.Write(@"<script>alert('Campanha não encontrada');location.href='portal_campanhas_publicitarias.aspx'</script>");
            }
        }//fim do if !Page.IsPostBack
    }
    
    
    protected void excluir_imagem() {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);

        var campanha = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo == id_conteudo select n.ds_imgDestaque).FirstOrDefault();
        if (campanha != null)
        {
            var imagem = campanha;
        if (imagem != "" || imagem != null)
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/images/campanhas_publicitarias/" + imagem);
            File.Delete(MapPath("../") + "/images/campanhas_publicitarias/" + imagem);
        }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
            try
            {
                var campanha = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo == id_conteudo select n).FirstOrDefault();
                excluir_imagem();
                cnDor.DeleteObject(campanha);
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
                Response.Write(@"<script>alert('Notícia Excluida Com Sucesso');location.href='portal_campanhas_publicitarias.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    
        
}

   
}