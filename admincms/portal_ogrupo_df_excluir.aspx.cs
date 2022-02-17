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
            var campanha = (from n in cnDor.TB_DEMOSTRATIVO_FINANCEIRO where n.idDemostrativo==id_conteudo select n.dsArquivo).FirstOrDefault();
            if (campanha != null)
            {
                lbl_titulo.Text = campanha;
            }
            else {
                Response.Write(@"<script>alert('Demonstrativo não encontrado');location.href='portal_ogrupo_df.aspx'</script>");
            }
        }//fim do if !Page.IsPostBack
    }


    protected void excluir_arquivo()
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        var campanha = (from n in cnDor.TB_DEMOSTRATIVO_FINANCEIRO
                        where n.idDemostrativo == id_conteudo
                        select n).FirstOrDefault();
        string imagem = campanha.dsArquivo;
        if (!String.IsNullOrEmpty(imagem))
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/pdf/df/" + imagem);
            File.Delete(MapPath("../") + "/pdf/df/" + imagem);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
            try
            {
                var campanha = (from n in cnDor.TB_DEMOSTRATIVO_FINANCEIRO where n.idDemostrativo == id_conteudo select n).FirstOrDefault();
                excluir_arquivo();
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
                Response.Write(@"<script>alert('Demonstrativo Excluido Com Sucesso');location.href='portal_ogrupo_df.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    
        
}

   
}