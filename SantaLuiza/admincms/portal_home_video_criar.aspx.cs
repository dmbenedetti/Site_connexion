using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_portal_home_video_criar : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        string titulo = txt_nome.Text;
        string resumo = txt_resumo.Text;
        int id_status = Convert.ToInt32(drp_status.SelectedValue);
        try
        {
            db_rede_dorModel.TB_PORTAL_VIDEO novoVideo = new db_rede_dorModel.TB_PORTAL_VIDEO();
            novoVideo.id_idioma = id_idioma;
            novoVideo.id_status = 1;
            novoVideo.ds_nome = titulo;
            novoVideo.ds_video = resumo;
            novoVideo.id_status = id_status;
            cnDor.AddToTB_PORTAL_VIDEO(novoVideo);
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