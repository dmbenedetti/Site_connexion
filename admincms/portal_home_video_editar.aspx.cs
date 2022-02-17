using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_portal_home_video_editar : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        int id_video = Convert.ToInt32(Request.QueryString["id"]);
        string titulo = txt_nome.Text;
        string resumo = txt_resumo.Text;
        int id_status = Convert.ToInt32(drp_status.SelectedValue);
        try
        {
            var novoVideo = (from n in cnDor.TB_PORTAL_VIDEO where n.id_video == id_video select n).FirstOrDefault();
            novoVideo.id_idioma = id_idioma;
            novoVideo.id_status = 1;

            novoVideo.ds_nome = titulo;
            novoVideo.ds_video = resumo;
            novoVideo.id_status = id_status;
            cnDor.SaveChanges();
            //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Notícia Gravada com sucesso!');location.href='portal_noticias.aspx'", true);
            Response.Write(@"<script>alert('Video Gravado com sucesso!');location.href='portal_home_video.aspx'</script>");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este video \nErro: " + ex.Message + "');", true);
        }

    }
}