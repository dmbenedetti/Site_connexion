using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;

public partial class admincms_MasterPage : System.Web.UI.MasterPage
{
    public string div_portal = "style='display:none;'";
    public string div_hospitais = "style='display:none;'";

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {






        string id_user = Convert.ToString(Session.Contents["iduser"]);
        string nome_user = Convert.ToString(Session.Contents["nomeuser"]);
        if (id_user == null || id_user == "")
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
        else
        {
            lbl_nome_user.Text = Session.Contents["nomeuser"].ToString();
            int user = Convert.ToInt32(id_user);
            if (!Page.IsPostBack)
            {
                drp_hospitais.DataSource = (from p in cnDor.TB_PERMISSAO_ADMIN
                                            join h in cnDor.TB_HOSPITAL on p.id_hospital equals h.id_hospital
                                            where p.id_user == user
                                            select new { h.nm_hospital, h.id_hospital }).ToList();
                drp_hospitais.DataTextField = "nm_hospital";
                drp_hospitais.DataValueField = "id_hospital";
                drp_hospitais.DataBind();

                string hosp = Convert.ToString(Session.Contents["idHosp"]);

                string nm_hospital = "";
                int bStatus = 2;
                if (hosp == "")
                {
                    //faz a busca do primeiro hospital que o usuario tem permissão
                    var hospital = (from h in cnDor.TB_PERMISSAO_ADMIN where h.id_user == user select h).FirstOrDefault();
                    if (hospital != null)
                    {
                        nm_hospital = hospital.TB_HOSPITAL.nm_hospital;
                        bStatus = hospital.TB_HOSPITAL.id_status;

                        //definindo a session com o id do hospital ativo
                        Session["idHosp"] = hospital.id_hospital.ToString();
                        drp_hospitais.SelectedValue = Convert.ToString(Session.Contents["idHosp"]);
                        //
                        if (Session.Contents["idHosp"].ToString() == "1")
                        {
                            lbl_menu_portal.Visible = true;
                            lbl_menu_hosp.Visible = false;

                        }//fim do if
                        else
                        {//se ainda não o hospital ativo não For o Portal 
                            lbl_menu_hosp.Visible = true;
                            lbl_menu_portal.Visible = false;
                        }//fim do else
                    }
                    else
                    {
                        Session["idHosp"] = "0";
                    }
                }//fim do if hosp=""
                else
                {
                    int id_hosp = Convert.ToInt32(hosp);
                    var hospital = (from h in cnDor.TB_PERMISSAO_ADMIN where h.id_hospital == id_hosp select h).FirstOrDefault();
                    if (hospital != null)
                    {
                        nm_hospital = hospital.TB_HOSPITAL.nm_hospital;
                        bStatus = hospital.TB_HOSPITAL.id_status;

                        //Response.Write(@"<script>alert('não é vazio')</script>");
                        if (Session.Contents["idHosp"].ToString() == "1")
                        {
                            drp_hospitais.SelectedValue = hosp;
                            lbl_menu_portal.Visible = true;
                            lbl_menu_hosp.Visible = false;

                        }//fim do if
                        else
                        {//se ainda não o hospital ativo não For o Portal 
                            drp_hospitais.SelectedValue = hosp;
                            lbl_menu_hosp.Visible = true;
                            lbl_menu_portal.Visible = false;

                        }//fim do else
                    }
                    else
                    {
                        Session["idHosp"] = "0";
                    }
                }
                if (ConfigurationManager.AppSettings["df"] != id_user)
                {
                    lbl_menu_portal.Text = "<div id='menu_portal'>";
                    lbl_menu_portal.Text += "<p class='TituloSessao'>Portal Rede D&acute;or";
                    lbl_menu_portal.Text += "</p>";
                    lbl_menu_portal.Text += "<ul>";
                    lbl_menu_portal.Text += "<li><a href='hospitais.aspx'>» Gerenciar Hospitais</a></li>";
                    lbl_menu_portal.Text += "<li><a href='hospitais_Especialidades.aspx'>» Gerenciar Especialidades</a></li>";
                    lbl_menu_portal.Text += "<li><a href='hospitais_Exames.aspx'>» Gerenciar Exames</a></li>";
                    lbl_menu_portal.Text += "<li><a href='hospitais_ps.aspx'>» Gerenciar Emergência</a></li>";
                    lbl_menu_portal.Text += "<li><a href='usuarios.aspx'>» Usuários Área Restrita</a></li>";
                    lbl_menu_portal.Text += "<li><a href='newsletter.aspx' target='new'>» Exportar NewsLetter</a></li>";
                    lbl_menu_portal.Text += "</ul></div>";

                    lbl_menu_hosp.Text = "<div id='menu_portal'>";
                    lbl_menu_hosp.Text += "<p class='TituloSessao'>Hospital " + nm_hospital + "</p>";
                    lbl_menu_hosp.Text += "<ul>";
                    if (bStatus == 1)
                    {
                        lbl_menu_hosp.Text += "<li><a href='hospital_homepage.aspx'>» Gerenciar Home Page</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='ohospital.aspx'>» Gerenciar O Hospital</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='servico.aspx'>» Gerenciar Serviços</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='hospitais_editar.aspx?id=" + Session["idHosp"].ToString() + "'>» Gerenciar Exames e Especialidades</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='portal_imprensa.aspx'>» Gerenciar Imprensa</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='area_medica.aspx'>» Gerenciar Profissionais da Saúde</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='portal_faleConosco.aspx'>» Fale Conosco</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='adm_metatags.aspx'>» Metatags</a></li>";
                        lbl_menu_hosp.Text += "<li><a href='hospitais_menu_ordem.aspx'>» Ordenar Menu</a></li>";
                    }
                }
                int idHosp = 0;
                int.TryParse(Session["idHosp"].ToString(), out idHosp);
                var foto_bebe = (from h in cnDor.TB_HOSPTIAL_FOTO_BEBE where h.id_hospital == idHosp select h).FirstOrDefault();
                if (foto_bebe != null && foto_bebe.fg_foto_bebe)
                {
                    lbl_menu_hosp.Text += "<li><a href='foto_bebe.aspx'>» Foto Bebê</a></li>";
                }
                if (ConfigurationManager.AppSettings["df"] == id_user)
                {
                    lbl_menu_hosp.Text += "<li><a href='portal_ogrupo_df.aspx'>» Demostrativo Financeiro</a></li>";
                }
                lbl_menu_hosp.Text += "</ul></div>";




                int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
                var idioma = cnDor.TB_IDIOMA.Where(x => x.id_idioma == id_idioma).FirstOrDefault();
                img_idioma.ImageUrl = "images/" + idioma.ds_flag;
                lbl_idioma.Text = idioma.nm_idioma;

            }//fim do if !Page.IsPostBack
        }

    }
    protected void btn_sair_Click(object sender, ImageClickEventArgs e)
    {
        Session.Remove("iduser");
        Session.Remove("nomeuser");
        Session.Remove("idioma");
        Session.Remove("idHosp");
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
    protected void drp_hospitais_SelectedIndexChanged(object sender, EventArgs e)
    {
        int hospital = Convert.ToInt32(drp_hospitais.SelectedValue);
        Session["idHosp"] = hospital.ToString();
        if (hospital == 1) {
            drp_hospitais.SelectedValue = Convert.ToString(Session.Contents["idHosp"]);
            div_portal = "style='display:block;'";
            div_hospitais = "style='display:none;'";
        }
        else {
            drp_hospitais.SelectedValue = Convert.ToString(Session.Contents["idHosp"]);
            div_portal = "style='display:none;'";
            div_hospitais = "style='display:block;'";
        }
        Response.Redirect("default.aspx");
    }
}
