using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_portal_home_video_excluir : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_video = Convert.ToInt32(Request.QueryString["id"]);

            var video = (from n in cnDor.TB_PORTAL_VIDEO
                            where n.id_video == id_video
                            select n).FirstOrDefault();
            txt_nome.Text = video.ds_nome;
            txt_resumo.Text = video.ds_video;
            drp_status.SelectedValue = video.id_status.ToString();

        }//fim do if !Page.IsPostBack

    }



    protected void  Button1_Click(object sender, EventArgs e)
    {
        int id_video = Convert.ToInt32(Request.QueryString["id"]);
            try
            {
                var video = (from n in cnDor.TB_PORTAL_VIDEO where n.id_video == id_video select n).FirstOrDefault();
                cnDor.DeleteObject(video);
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
                Response.Write(@"<script>alert('Video Excluido Com Sucesso');location.href='portal_home_video.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    

    }
}