using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 5;//imprensa
    public string div_conteudo = "style='display:block;'";
    public string div_formulario = "style='display:none;'";
    public string div_url = "style='display:none;'";
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            DropDownList1.DataSource = cnDor.TB_FORMULARIOS.Where(x => x.id_hospital == 1 && x.id_status == 1).Select(x => new { x.id_formulario, x.nm_formulário }).ToList();
            DropDownList1.DataTextField = "nm_formulário";
            DropDownList1.DataValueField = "id_formulario";
            DropDownList1.DataBind();

            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
            var pagina = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_conteudo).FirstOrDefault();
            if (pagina != null)
            {

                txt_titulo.Text = pagina.nm_titulo;
                txt_resumo.Text = pagina.ds_resumo;
                Boolean visivel = Convert.ToBoolean(pagina.ds_visivel);
                if (visivel == true) { rdo_visivel.SelectedValue = "1"; }
                else { rdo_visivel.SelectedValue = "0"; }
                int tipo = Convert.ToInt32(pagina.id_tipo);
                if (tipo == 1)
                {//se for uma pagina de conteudo interno
                    FCKeditor1.Value = pagina.ds_conteudo;
                    div_conteudo = "style='display:block;'";
                    div_formulario = "style='display:none;'";
                    div_url = "style='display:none;'";
                    RadioButtonList1.SelectedValue = "1";
                }
                else if (tipo == 2)
                {//se for um link interno
                    txt_url.Text = pagina.ds_url;
                    div_conteudo = "style='display:none;'";
                    div_formulario = "style='display:none;'";
                    div_url = "style='display:block;'";
                    RadioButtonList1.SelectedValue = "2";
                }
                else if (tipo == 3)
                {//se for um link externo
                    txt_url.Text = pagina.ds_url;
                    div_conteudo = "style='display:none;'";
                    div_formulario = "style='display:none;'";
                    div_url = "style='display:block;'";
                    RadioButtonList1.SelectedValue = "3";
                }
                else 
                {//se for um formulário
                    DropDownList1.SelectedValue = pagina.ds_url;
                    div_conteudo = "style='display:none;'";
                    div_url = "style='display:none;'";
                    div_formulario = "style='display:blcok;'";
                    RadioButtonList1.SelectedValue = "10";
                    RequiredFieldValidator3.Enabled = true;
                }


            }//fim do if pagina!=null
            else {
                Response.Redirect("portal_imprensa.aspx");
            }
            
        }//fim do if postback
    }
    public static string GetStringNoAccents(string str)
    {

        /** Troca os caracteres acentuados por não acentuados **/
        string[] acentos = new string[] { "ç", "Ç", "á", "é", "í", "ó", "ú", "ý", "Á", "É", "Í", "Ó", "Ú", "Ý", "à", "è", "ì", "ò", "ù", "À", "È", "Ì", "Ò", "Ù", "ã", "õ", "ñ", "ä", "ë", "ï", "ö", "ü", "ÿ", "Ä", "Ë", "Ï", "Ö", "Ü", "Ã", "Õ", "Ñ", "â", "ê", "î", "ô", "û", "Â", "Ê", "Î", "Ô", "Û" };
        string[] semAcento = new string[] { "c", "C", "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "Y", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "a", "o", "n", "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "A", "O", "N", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U" };

        for (int i = 0; i < acentos.Length; i++)
        {
            str = str.Replace(acentos[i], semAcento[i]);
        }

        /** Troca os caracteres especiais da string por "" **/
        string[] caracteresEspeciais = { "\\.", ",", "-", ":", "\\(", "\\)", "ª", "\\|", "\\\\", "°" };

        for (int i = 0; i < caracteresEspeciais.Length; i++)
        {
            str = str.Replace(caracteresEspeciais[i], "");
        }

        /** Troca os espaços no início por "" **/
        str = str.Replace("^\\s+", "");
        /** Troca os espaços no início por "" **/
        str = str.Replace("\\s+$", "");
        /** Troca os espaços duplicados, tabulações e etc por  " " **/
        str = str.Replace("\\s+", " ");
        return str;

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string tipo = RadioButtonList1.SelectedValue;
        if (tipo == "1")
        {
            div_conteudo = "style='display:block;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:none;'";
            RequiredFieldValidator3.Enabled = false;
        }
        else if (tipo == "2")
        {

            div_conteudo = "style='display:none;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:block;'";
            RequiredFieldValidator3.Enabled = false;

        }
        else if (tipo == "3")
        {

            div_conteudo = "style='display:none;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:block;'";
            RequiredFieldValidator3.Enabled = false;

        }
        else 
        {
            div_conteudo = "style='display:none;'";
            div_url = "style='display:none;'";
            div_formulario = "style='display:blcok;'";
            RequiredFieldValidator3.Enabled = true;
        }

        
    }
    protected void grava_pagina_interna(int id_conteudo) {
        try
        {
            var pagina = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_conteudo).FirstOrDefault();
            if (pagina != null)
            {
                pagina.dt_conteudo = DateTime.Now;
                pagina.id_tipo = 1;//paginas internas
                Boolean visivel;
                if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }
                pagina.ds_visivel = visivel;
                pagina.nm_titulo = txt_titulo.Text;
                pagina.ds_resumo = txt_resumo.Text;
                pagina.ds_conteudo = FCKeditor1.Value;
                pagina.ds_imgDestaque = null;
                pagina.ds_url = null;
                pagina.id_noticia = null;
                pagina.nr_edicaorevista = null;
                pagina.ds_sessao_revista = null;
                pagina.ds_materiaDestaque = null;
                pagina.nm_titulo_fonetico = iFonetizar.Fonetizar(pagina.nm_titulo, false);
                pagina.ds_resumo_fonetico = iFonetizar.Fonetizar(pagina.ds_resumo, false);
                pagina.ds_conteudo_fonetico = iFonetizar.Fonetizar(pagina.ds_conteudo, false);
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Dados atualizados com sucesso!');location.href='portal_imprensa.aspx'", true);
            }//fim do if pagina!=null
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(),"erro","alert('Não foi possivel atualizar o conteudo "+ex.Message+"');",true);
        }
    }
    protected void grava_link_interno(int id_conteudo)
    {
        try
        {
            var pagina = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_conteudo).FirstOrDefault();
            if (pagina != null)
            {
                pagina.dt_conteudo = DateTime.Now;
                pagina.id_tipo = 2;//link interno
                Boolean visivel;
                if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }
                pagina.ds_visivel = visivel;
                pagina.nm_titulo = txt_titulo.Text;
                pagina.ds_resumo = txt_resumo.Text;
                pagina.ds_conteudo = null;
                pagina.ds_imgDestaque = null;
                pagina.ds_url = txt_url.Text;
                pagina.id_noticia = null;
                pagina.nr_edicaorevista = null;
                pagina.ds_sessao_revista = null;
                pagina.ds_materiaDestaque = null;
                pagina.nm_titulo_fonetico = iFonetizar.Fonetizar(pagina.nm_titulo, false);
                pagina.ds_resumo_fonetico = iFonetizar.Fonetizar(pagina.ds_resumo, false);
                pagina.ds_conteudo_fonetico = iFonetizar.Fonetizar(pagina.ds_conteudo, false);
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Dados atualizados com sucesso!');location.href='portal_imprensa.aspx'", true);
            }//fim do if pagina!=null
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel atualizar o conteudo " + ex.Message + "');", true);
        }
    }
    protected void grava_link_externo(int id_conteudo)
    {
        try
        {
            var pagina = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_conteudo).FirstOrDefault();
            if (pagina != null)
            {
                pagina.dt_conteudo = DateTime.Now;
                pagina.id_tipo = 3;//link externo
                Boolean visivel;
                if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }
                pagina.ds_visivel = visivel;
                pagina.nm_titulo = txt_titulo.Text;
                pagina.ds_resumo = txt_resumo.Text;
                pagina.ds_conteudo = null;
                pagina.ds_imgDestaque = null;
                pagina.ds_url = txt_url.Text;
                pagina.id_noticia = null;
                pagina.nr_edicaorevista = null;
                pagina.ds_sessao_revista = null;
                pagina.ds_materiaDestaque = null;
                pagina.nm_titulo_fonetico = iFonetizar.Fonetizar(pagina.nm_titulo, false);
                pagina.ds_resumo_fonetico = iFonetizar.Fonetizar(pagina.ds_resumo, false);
                pagina.ds_conteudo_fonetico = iFonetizar.Fonetizar(pagina.ds_conteudo, false);
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Dados atualizados com sucesso!');location.href='portal_imprensa.aspx'", true);
            }//fim do if pagina!=null
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel atualizar o conteudo " + ex.Message + "');", true);
        }
    }
    protected   void grava_formulario(int id_conteudo)
    {
        try
        {
            var pagina = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_conteudo).FirstOrDefault();
            if (pagina != null)
            {
                pagina.dt_conteudo = DateTime.Now;
                pagina.id_tipo = 10;//formulário
                Boolean visivel;
                if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }
                pagina.ds_visivel = visivel;
                pagina.nm_titulo = txt_titulo.Text;
                pagina.ds_resumo = txt_resumo.Text;
                pagina.ds_conteudo = null;
                pagina.ds_imgDestaque = null;
                pagina.ds_url = DropDownList1.SelectedValue;
                pagina.id_noticia = null;
                pagina.nr_edicaorevista = null;
                pagina.ds_sessao_revista = null;
                pagina.ds_materiaDestaque = null;
                pagina.nm_titulo_fonetico = iFonetizar.Fonetizar(pagina.nm_titulo, false);
                pagina.ds_resumo_fonetico = iFonetizar.Fonetizar(pagina.ds_resumo, false);
                pagina.ds_conteudo_fonetico = iFonetizar.Fonetizar(pagina.ds_conteudo, false);
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Dados atualizados com sucesso!');location.href='portal_imprensa.aspx'", true);
            }//fim do if pagina!=null
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel atualizar o conteudo " + ex.Message + "');", true);
        }   
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        string tipo = RadioButtonList1.SelectedValue;
        if (tipo == "1")
        {
            grava_pagina_interna(id_conteudo);
        }
        else if (tipo == "2")
        {
            grava_link_interno(id_conteudo);
        }
        else if (tipo == "3")
        {
            grava_link_externo(id_conteudo);
        }
        else 
        {
            grava_formulario(id_conteudo);
        }
    }
    protected void DropDownList1_PreRender(object sender, EventArgs e)
    {
        DropDownList1.Items.Remove("");
        DropDownList1.Items.Insert(0, "");
    }
}