using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class programetes_discovery : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            var video_destaque = cnDor.TB_PORTAL_PROGRAMETES_DESTAQUE.FirstOrDefault();
            lbl_titulo_destaque.Text = video_destaque.nm_titulo;
            ltr_video_destaque.Text = video_destaque.ds_video;

            var texto = cnDor.TB_PORTAL_PROGRAMETES_TEXTO.FirstOrDefault();
            ltr_texto.Text = texto.ds_texto;

        }//fim do if postback
    }
}