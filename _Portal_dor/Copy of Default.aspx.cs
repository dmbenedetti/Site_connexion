using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            var banner = cnDor.TB_PORTAL_BANNER.Where(x => x.id_status == 1 && x.id_idioma == 1).ToList();
            if (banner.Count > 0) {
                lbl_banner1.Text = "<a href='" + banner[0].ds_link + "'><img src='images/baners_home/" + banner[0].ds_imagem + "' /></a>";
                lbl_banner2.Text = "<a href='" + banner[1].ds_link + "'><img src='images/baners_home/" + banner[1].ds_imagem + "' /></a>";
                lbl_banner3.Text = "<a href='" + banner[2].ds_link + "'><img src='images/baners_home/" + banner[2].ds_imagem + "' /></a>";
                lbl_banner4.Text = "<a href='" + banner[3].ds_link + "'><img src='images/baners_home/" + banner[3].ds_imagem + "' /></a>";
            }//fim do if banner.count

            var slider = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_status == 1 && x.id_idioma == 1).ToList();
            if (slider.Count > 0) {
                ltl_slider.Text="";
                for (int i = 0; slider.Count > i; i++) {
                    ltl_slider.Text += "<li><a href='"+slider[i].ds_link+"'><img src='images/slider_home/"+slider[i].ds_imagem+"' /></a></li>";
                }//fim do for slider
            }//fim do if slider

            var noticias = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo == 5 && x.id_idioma == 1).OrderByDescending(x=>x.dt_conteudo).Take(3);
            dtl_noticias.DataSource = noticias;
            dtl_noticias.DataBind();

            var releases = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo == 6 && x.id_idioma == 1).OrderByDescending(x => x.dt_conteudo).Take(3);
            dtl_releases.DataSource = releases;
            dtl_releases.DataBind();

            var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1).ToList();
            if (menu_grupo.Count > 0) {
                string ogrupo = "";
                for (int i = 0; menu_grupo.Count > i; i++) {
                    ogrupo += "<li><a href='ogrupo.aspx?id=" + menu_grupo[i].id_conteudo.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_ogrupo.Text = ogrupo;
            }//fim do if menu_grupo

            

            var menu_iep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1).ToList();
            if (menu_iep.Count > 0)
            {
                string iep = "";
                for (int i = 0; menu_iep.Count > i; i++)
                {
                    iep += "<li><a href='#'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_iep.Text = iep;
            }//fim do if menu_iep

            var menu_imprensa = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && (x.id_tipo !=5 && x.id_tipo!=6) && x.id_idioma == 1).ToList();
            if (menu_imprensa.Count > 0)
            {
                string imprensa = "";
                for (int i = 0; menu_imprensa.Count > i; i++)
                {
                    imprensa += "<li><a href='#'>" + menu_imprensa[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_imprensa.Text = imprensa;
            }//fim do if menu_imprensa
     
        }//fim do if postback
    }
}