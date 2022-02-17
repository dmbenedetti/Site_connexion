using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 6;//Fale Conosco
    public string div_conteudo = "style='display:block;'";
    public string div_formulario = "style='display:none;'";
    public string div_url = "style='display:none;'";
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void grava_pagina_interna() {
        int idioma = Convert.ToInt32(Session.Contents["idioma"]);
        Boolean visivel;
        if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }
        
        db_rede_dorModel.TB_PORTAL_CONTEUDO novoConteudo = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
        novoConteudo.nm_titulo = txt_titulo.Text;
        novoConteudo.ds_resumo = txt_resumo.Text;
        novoConteudo.ds_conteudo = FCKeditor1.Value;
        novoConteudo.ds_visivel = visivel;
        novoConteudo.id_status = 1;
        novoConteudo.id_sessao = sessao_site;
        novoConteudo.id_idioma = idioma;
        novoConteudo.id_tipo = 1;//paginas internas
        novoConteudo.dt_conteudo = DateTime.Now;
        novoConteudo.id_hospital = Convert.ToInt32(Session["idHosp"]);
        novoConteudo.nm_titulo_fonetico = iFonetizar.Fonetizar(novoConteudo.nm_titulo, false);
        novoConteudo.ds_resumo_fonetico = iFonetizar.Fonetizar(novoConteudo.ds_resumo, false);
        novoConteudo.ds_conteudo_fonetico = iFonetizar.Fonetizar(novoConteudo.ds_conteudo, false);
        try
        {
            cnDor.AddToTB_PORTAL_CONTEUDO(novoConteudo);
            cnDor.SaveChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Conteúdo gravado com Sucesso!');location.href='portal_faleConosco.aspx'", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('erro na hora de gravar o conteudo \n "+ex.Message+"')", true);   
        }
    }
    protected void grava_link_interno()
    {
        int idioma = Convert.ToInt32(Session.Contents["idioma"]);
        Boolean visivel;
        if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }

        db_rede_dorModel.TB_PORTAL_CONTEUDO novoLinkInterno = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
        novoLinkInterno.nm_titulo = txt_titulo.Text;
        novoLinkInterno.ds_resumo = txt_resumo.Text;
        novoLinkInterno.ds_url = txt_url.Text;
        novoLinkInterno.ds_visivel = visivel;
        novoLinkInterno.id_status = 1;
        novoLinkInterno.id_sessao = sessao_site;
        novoLinkInterno.id_idioma = idioma;
        novoLinkInterno.id_tipo = 2;//Link interno
        novoLinkInterno.dt_conteudo = DateTime.Now;
        novoLinkInterno.nm_titulo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.nm_titulo, false);
        novoLinkInterno.id_hospital = Convert.ToInt32(Session["idHosp"]);
        novoLinkInterno.ds_resumo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.ds_resumo, false);
        novoLinkInterno.ds_conteudo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.ds_conteudo, false);
        try
        {
            cnDor.AddToTB_PORTAL_CONTEUDO(novoLinkInterno);
            cnDor.SaveChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Link gravado com Sucesso!');location.href='portal_faleConosco.aspx'", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('erro na hora de gravar o conteudo \n " + ex.Message + "')", true);
        }
    }
    protected void grava_link_externo()
    {
        int idioma = Convert.ToInt32(Session.Contents["idioma"]);
        Boolean visivel;
        if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }

        db_rede_dorModel.TB_PORTAL_CONTEUDO novoLinkInterno = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
        novoLinkInterno.nm_titulo = txt_titulo.Text;
        novoLinkInterno.ds_resumo = txt_resumo.Text;
        novoLinkInterno.ds_url = txt_url.Text;
        novoLinkInterno.ds_visivel = visivel;
        novoLinkInterno.id_status = 1;
        novoLinkInterno.id_sessao = sessao_site;
        novoLinkInterno.id_idioma = idioma;
        novoLinkInterno.id_tipo = 3;//Link Externo
        novoLinkInterno.dt_conteudo = DateTime.Now;
        novoLinkInterno.nm_titulo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.nm_titulo, false);
        novoLinkInterno.id_hospital = Convert.ToInt32(Session["idHosp"]);
        novoLinkInterno.ds_resumo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.ds_resumo, false);
        novoLinkInterno.ds_conteudo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.ds_conteudo, false);
        try
        {
            cnDor.AddToTB_PORTAL_CONTEUDO(novoLinkInterno);
            cnDor.SaveChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Link gravado com Sucesso!');location.href='portal_faleConosco.aspx'", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('erro na hora de gravar o conteudo \n " + ex.Message + "')", true);
        }
    }
    protected void grava_formulario()
    {
        int idioma = Convert.ToInt32(Session.Contents["idioma"]);
        Boolean visivel;
        if (rdo_visivel.SelectedValue == "1") { visivel = true; } else { visivel = false; }

        db_rede_dorModel.TB_PORTAL_CONTEUDO novoLinkInterno = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
        novoLinkInterno.nm_titulo = txt_titulo.Text;
        novoLinkInterno.ds_resumo = txt_resumo.Text;
        novoLinkInterno.ds_url = txt_url.Text;
        novoLinkInterno.ds_visivel = visivel;
        novoLinkInterno.id_status = 1;
        novoLinkInterno.id_sessao = sessao_site;
        novoLinkInterno.id_idioma = idioma;
        novoLinkInterno.id_tipo = 10;//Formulário
        novoLinkInterno.dt_conteudo = DateTime.Now;
        novoLinkInterno.id_hospital = Convert.ToInt32(Session["idHosp"]);
        novoLinkInterno.ds_email_form = txtEmail.Text;
        novoLinkInterno.nm_titulo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.nm_titulo, false);
        novoLinkInterno.ds_resumo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.ds_resumo, false);
        novoLinkInterno.ds_conteudo_fonetico = iFonetizar.Fonetizar(novoLinkInterno.ds_conteudo, false);
        try
        {
            cnDor.AddToTB_PORTAL_CONTEUDO(novoLinkInterno);
            cnDor.SaveChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Formulário gravado com Sucesso!');location.href='portal_faleConosco.aspx'", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('erro na hora de gravar o conteudo \n " + ex.Message + "')", true);
        }
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        string tipo = RadioButtonList1.SelectedValue;
        if (tipo == "1")
        {
            grava_pagina_interna();
        }
        else if (tipo == "2")
        {
            grava_link_interno();
        }
        else if (tipo == "3")
        {
            grava_link_externo();
        }
        else 
        {
            grava_formulario();
        }
        
    }
    protected void DropDownList1_PreRender(object sender, EventArgs e)
    {
        DropDownList1.Items.Remove("");
        DropDownList1.Items.Insert(0, "");
    }
}