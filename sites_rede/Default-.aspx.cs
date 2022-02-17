using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {


        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        if (id_idioma == null || id_idioma == 0)
        {
            Session["idioma"] = 1;
        }

        if (!Page.IsPostBack)
        {
            var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 4).ToList();
            if (menu_grupo.Count > 0)
            {
                string ogrupo = "";
                for (int i = 0; menu_grupo.Count > i; i++)
                {
                    ogrupo += "<li><a href='ogrupo_page.aspx?id=" + menu_grupo[i].id_conteudo.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_grupo.Text = ogrupo;
            }//fim do if menu_grupo

            var menu_iep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1 && x.ds_visivel == true && !(x.id_tipo >= 13 && x.id_tipo <= 16)).ToList(); if (menu_iep.Count > 0)
            {
                string iep = "";
                for (int i = 0; menu_iep.Count > i; i++)
                {
                    iep += "<li><a href='iep_page.aspx?id=" + menu_iep[i].id_conteudo.ToString()+ "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_iep.Text = iep;
            }//fim do if menu_iep

            var menu_es = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 3 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 12).ToList();
            if (menu_es.Count > 0)
            {
                string es = "";
                for (int i = 0; menu_es.Count > i; i++)
                {
                    es += "<li><a href='espaco_saude_page.aspx?id=" + menu_es[i].id_conteudo.ToString() + "'>" + menu_es[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_es.Text = es;
            }//fim do if menu_ep


            var menu_ep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo != 5 && x.id_tipo != 6 && x.id_idioma == 1 && x.ds_visivel == true).ToList();
            if (menu_ep.Count > 0)
            {
                string ep = "";
                for (int i = 0; menu_ep.Count > i; i++)
                {
                    ep += "<li><a href='imprensa_page.aspx?id=" + menu_ep[i].id_conteudo.ToString() + "'>" + menu_ep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_ep.Text = ep;
            }//fim do if menu_ep
            int videos = 0;
            string svideos = "";
            var youtube = (from n in cnDor.TB_PORTAL_VIDEO select n);
            foreach (db_rede_dorModel.TB_PORTAL_VIDEO Video in youtube)
            {
                svideos += "<div style=\"margin: 15px 0px 5px 0px;\"><strong>" + Video.ds_nome + "</strong><br style=\"margin: 0px 0px 15px 0px;\">" + Video.ds_video.Replace("><", " style=\"width: 293; height: 178;\" ><") + "</div>";
                videos++;
                if (videos >= 2)
                {
                    break;
                }
            }
            ltlYouTube.Text = svideos;
            var banner = cnDor.TB_PORTAL_BANNER.Where(x => x.id_status == 1 && x.id_idioma == 1).ToList();
            if (banner.Count > 0) {
                lbl_banner1.Text = "<a target='_blank' href='" + banner[0].ds_link + "'><img src='images/baners_home/" + banner[0].ds_imagem + "' /></a>";
                lbl_banner2.Text = "<a target='_blank' href='" + banner[1].ds_link + "'><img src='images/baners_home/" + banner[1].ds_imagem + "' /></a>";
                lbl_banner3.Text = "<a target='_blank' href='" + banner[2].ds_link + "'><img src='images/baners_home/" + banner[2].ds_imagem + "' /></a>";
                lbl_banner4.Text = "<a target='_blank' href='" + banner[3].ds_link + "'><img src='images/baners_home/" + banner[3].ds_imagem + "' /></a>";
            }//fim do if banner.count

            var slider = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_status == 1 && x.id_idioma == 1).ToList();
            if (slider.Count > 0) {
                ltl_slider.Text="";
                for (int i = 0; slider.Count > i; i++) {
                    ltl_slider.Text += "<li><a target='_blank' href='"+slider[i].ds_link+"'><img src='images/slider_home/"+slider[i].ds_imagem+"' /></a></li>";
                }//fim do for slider
            }//fim do if slider

            var noticias = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo == 5 && x.id_idioma == 1).OrderByDescending(x => x.dt_conteudo).Take(3).Select(x => new { 
            x.id_conteudo, 
            x.nm_titulo, 
            x.dt_conteudo, 
            x.id_noticia,
            ds_imgDestaque = x.ds_imgDestaque == null ? "destaque_default.jpg" : x.ds_imgDestaque,
            x.ds_resumo
            });
            dtl_noticias.DataSource = noticias;
            dtl_noticias.DataBind();

            var releases = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo == 6 && x.id_idioma == 1).OrderByDescending(x => x.dt_conteudo).Take(3);
            dtl_releases.DataSource = releases;
            dtl_releases.DataBind();

            #region codigo antigo do menu
            //var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1).ToList();
            //if (menu_grupo.Count > 0)
            //{
            //    string ogrupo = "";
            //    for (int i = 0; menu_grupo.Count > i; i++)
            //    {
            //        ogrupo += "<li><a href='ogrupo.aspx?id=" + menu_grupo[i].id_conteudo.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
            //    }//fim do for
            //    ltr_ogrupo.Text = ogrupo;
            //}//fim do if menu_grupo
            //var menu_iep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1).ToList();
            //if (menu_iep.Count > 0)
            //{
            //    string iep = "";
            //    for (int i = 0; menu_iep.Count > i; i++)
            //    {
            //        iep += "<li><a href='iep_page.aspx?id=" + menu_iep[i].id_conteudo.ToString()+ "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
            //    }//fim do for
            //    ltr_iep.Text = iep;
            //}//fim do if menu_iep
            //var menu_imprensa = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && (x.id_tipo != 5 && x.id_tipo != 6) && x.id_idioma == 1).ToList();
            //if (menu_imprensa.Count > 0)
            //{
            //    string imprensa = "";
            //    for (int i = 0; menu_imprensa.Count > i; i++)
            //    {
            //        imprensa += "<li><a href='#'>" + menu_imprensa[i].nm_titulo.ToUpper() + "</a></li>";
            //    }//fim do for
            //    ltr_imprensa.Text = imprensa;
            //}//fim do if menu_imprensa 
            #endregion
     
        }//fim do if postback
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string newsletter = txt_newsletter.Text;
        Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
        Match match = regex.Match(newsletter);
        if (match.Success)
        {
            try
            {
                db_rede_dorModel.TB_NEWSLETTER oNewsLetter = new db_rede_dorModel.TB_NEWSLETTER();
                oNewsLetter.ds_email = newsletter;
                oNewsLetter.dt_data = System.DateTime.Now;
                oNewsLetter.id_hospital = 1;
                cnDor.AddToTB_NEWSLETTER(oNewsLetter);
                cnDor.SaveChanges();
            }
            catch { }
        }
        txt_newsletter.Text = "";
        Response.Write("<script>alert('e-mail cadastrado.')</script>");
            
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("busca.aspx?wrd=" + TextBox1.Text);
    }
}