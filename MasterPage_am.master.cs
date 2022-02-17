using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_grupo : System.Web.UI.MasterPage
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["idHosp"] == null)
        {
            Session["idHosp"] = 1;
        }
        int id_idioma = 0;
        if (Session.Contents["idioma"] != null)
        {
            int.TryParse(Session.Contents["idioma"].ToString(), out id_idioma);
        }
        if (id_idioma == 0)
        {
            Session["idioma"] = 1;
        }

        int idHosp = Convert.ToInt32(Session["idHosp"]);
        if (!Page.IsPostBack)
        {
            int? id_tipo = 1;
            var menus = (from a in cnDor.TB_PORTAL_CONTEUDO
                         join b in cnDor.TB_PORTAL_MENU_ORDEM on a.id_conteudo equals b.id_pagina into a1
                         from b in a1.DefaultIfEmpty()
                         where (b == null || b.id_tipo == 1) && a.ds_visivel == true && a.id_status == 1 && (a.id_tipo == 1 || a.id_tipo == 2 || a.id_tipo == 3 || a.id_tipo == 10) && a.id_hospital == idHosp
                         select new { id_conteudo = a.id_conteudo, nm_titulo = a.nm_titulo, nu_ordem = b.nu_ordem == null ? 99 : b.nu_ordem, id_sessao = a.id_sessao, link = "", a.id_tipo, idTipo = 1 }).ToList();
            var menus2 = (from a in cnDor.TB_PORTAL_MENUFIXO
                          from b in cnDor.TB_PORTAL_MENU_ORDEM.Where(c => c.id_pagina == a.id_menufixo && c.id_tipo == 2).DefaultIfEmpty()
                          //where b == null || b.id_tipo == 2
                          select new { id_conteudo = a.id_menufixo, nm_titulo = a.ds_menufixo, nu_ordem = b.nu_ordem == null ? 1 : b.nu_ordem, id_sessao = a.id_sessao, link = a.ds_linkmenu, id_tipo = id_tipo, idTipo = 2 }).ToList();

            var menu = menus.Union(menus2);

            //             //join c in cnDor.TB_PORTAL_MENUFIXO on b.id_pagina equals c.id_menufixo)
            //var aas = menu.Where(h => h.id_sessao == 1 && h.id_tipo != 4).OrderBy(p => p.nu_ordem).ToList();
            //var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 4 && x.id_hospital == idHosp ).ToList();
            var menu_grupo = menu.Where(h => h.id_sessao == 1 && h.id_tipo != 4).OrderBy(p => p.nu_ordem).ToList();
            if (menu_grupo.Count > 0)
            {
                string ogrupo = "";
                for (int i = 0; menu_grupo.Count > i; i++)
                {
                    if (menu_grupo[i].idTipo == 1)
                        ogrupo += "<li><a href='ogrupo_page.aspx?id=" + menu_grupo[i].id_conteudo.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
                    else
                        ogrupo += "<li><a href='" + menu_grupo[i].link.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_grupo.Text = ogrupo;
                ltl_grupo2.Text = ogrupo.Replace("<li>", "<li  class='has-sub'>");
                ltl_grupo3.Text = ltl_grupo2.Text;
            }//fim do if menu_grupo

            var menu_iep = menu.Where(h => h.id_sessao == 4 && !(h.id_tipo >= 13 && h.id_tipo <= 16)).OrderBy(p => p.nu_ordem).ToList(); //cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1 && x.ds_visivel == true && x.id_hospital == idHosp && !(x.id_tipo >= 13 && x.id_tipo <= 16)).ToList(); if (menu_iep.Count > 0)
            {
                string iep = "";
                for (int i = 0; menu_iep.Count > i; i++)
                {
                    if (menu_iep[i].idTipo == 1)
                        iep += "<li><a href='iep_page.aspx?id=" + menu_iep[i].id_conteudo.ToString() + "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
                    else
                        iep += "<li><a href='" + menu_iep[i].link.ToString() + "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_iep.Text = iep;
                ltl_iep2.Text = iep.Replace("<li>", "<li  class='has-sub'>");
                ltl_iep3.Text = ltl_iep2.Text;
            }//fim do if menu_iep

            var menu_es = menu.Where(h => h.id_sessao == 3).OrderBy(p => p.nu_ordem).ToList(); //cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 3 && x.id_idioma == 1 && x.ds_visivel == true && x.id_hospital == idHosp).ToList();
            if (menu_es.Count > 0)
            {
                string es = "";
                for (int i = 0; menu_es.Count > i; i++)
                {
                    if (menu_es[i].idTipo == 1)
                        es += "<li><a href='espaco_saude_page.aspx?id=" + menu_es[i].id_conteudo.ToString() + "'>" + menu_es[i].nm_titulo.ToUpper() + "</a></li>";
                    else
                        es += "<li><a href='" + menu_es[i].link.ToString() + "'>" + menu_es[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_es.Text = es;
                ltl_es2.Text = es.Replace("<li>", "<li  class='has-sub'>");
                ltl_es3.Text = ltl_es2.Text;
            }//fim do if menu_ep

            var menu_ps = menu.Where(h => h.id_sessao == 7 && ((h.id_tipo > 0 && h.id_tipo <= 3) || h.id_tipo == 10)).OrderBy(p => p.nu_ordem).ToList(); //cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 7 && x.id_idioma == 1 && x.ds_visivel == true && ((x.id_tipo > 0 && x.id_tipo <= 3) || x.id_tipo == 10) && x.id_hospital == idHosp).ToList();
            if (menu_ps.Count > 0)
            {
                string ps = "";
                for (int i = 0; menu_ps.Count > i; i++)
                {
                    if (menu_ps[i].idTipo == 1)
                        ps += "<li><a href='profissional_saude_page.aspx?id=" + menu_ps[i].id_conteudo.ToString() + "'>" + menu_ps[i].nm_titulo.ToUpper() + "</a></li>";
                    else
                        ps += "<li><a href='" + menu_ps[i].link.ToString() + "'>" + menu_ps[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_am.Text = ps;
                ltl_ps2.Text = ps.Replace("<li>", "<li  class='has-sub'>");
                ltl_ps3.Text = ltl_ps2.Text;
            }//fim do if menu_ep


            var menu_ep = menu.Where(h => h.id_sessao == 5 && h.id_tipo != 5 && h.id_tipo != 6).OrderBy(p => p.nu_ordem).ToList(); //cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo != 5 && x.id_tipo != 6 && x.id_idioma == 1 && x.ds_visivel == true && x.id_hospital == idHosp).ToList();
            if (menu_ep.Count > 0)
            {
                string ep = "";
                for (int i = 0; menu_ep.Count > i; i++)
                {
                    if (menu_ep[i].idTipo == 1)
                        ep += "<li><a href='imprensa_page.aspx?id=" + menu_ep[i].id_conteudo.ToString() + "'>" + menu_ep[i].nm_titulo.ToUpper() + "</a></li>";
                    else
                        ep += "<li><a href='" + menu_ep[i].link.ToString() + "'>" + menu_ep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_ep.Text = ep;
                ltl_imprensa2.Text = ep.Replace("<li>", "<li  class='has-sub'>");
                ltl_imprensa3.Text = ltl_imprensa2.Text;
            }//fim do if menu_ep




        }//fim do if postback
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("busca.aspx?wrd=" + TextBox1.Text);
    }
}
