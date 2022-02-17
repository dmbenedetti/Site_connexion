using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_portal_editar_pagina : System.Web.UI.Page
{
    public string div_conteudo = "style='display:none;'";
    public string div_formulario = "style='display:none;'";
    public string div_url = "style='display:none;'";
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) {
            DataSet1TableAdapters.tb_paginasTableAdapter select_pagina = new DataSet1TableAdapters.tb_paginasTableAdapter();
            DataTable tb01 = select_pagina.Get_select_id(id);
            if (tb01.Rows.Count > 0) {
                txt_titulo.Text = (string)tb01.Rows[0]["titulo"];
                FCKeditor1.Value = (string)tb01.Rows[0]["conteudo"];
                txt_ordem.Text = tb01.Rows[0]["ordem"].ToString();
                txt_url.Text = (string)tb01.Rows[0]["url"];
                //Image1.ImageUrl = "../images/destaque_home/" + (string)tb01.Rows[0]["imagem_destaque"];
                //txt_link_img.Text = (string)tb01.Rows[0]["link_imagem_destaque"];
                int tipo_pag = Convert.ToInt32(tb01.Rows[0]["tipo"]);
                //radiolist da galeria
                RadioButtonList3.SelectedValue = Convert.ToString(tb01.Rows[0]["galeria"]);

                string exibir = (string)tb01.Rows[0]["exibir"];
                RadioButtonList2.Text = exibir;

                if (tipo_pag == 0)
                {
                    RadioButtonList1.SelectedValue = "0";
                    div_conteudo = "style='display:blcok;'";
                    div_formulario = "style='display:none;'";
                }
                else if (tipo_pag == 2)
                {
                    RadioButtonList1.SelectedValue = "2";
                    div_conteudo = "style='display:none;'";
                    div_formulario = "style='display:none;'";
                    div_url = "style='display:blcok;'";
                }
                else if (tipo_pag == 3)
                {
                    RadioButtonList1.SelectedValue = "3";
                    div_conteudo = "style='display:none;'";
                    div_formulario = "style='display:none;'";
                    div_url = "style='display:blcok;'";
                }
                else
                {
                    RadioButtonList1.SelectedValue = "1";
                    div_conteudo = "style='display:none;'";
                    div_formulario = "style='display:blcok;'";
                }
                DataSet1TableAdapters.tb_formulariosTableAdapter formularios = new DataSet1TableAdapters.tb_formulariosTableAdapter();
                DataTable tb02 = formularios.Get_select_all();
                DropDownList1.DataSource = tb02;
                DropDownList1.DataTextField = "nome";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();

                int id_tipo = Convert.ToInt32(tb01.Rows[0]["id_tipo"]);

                if (id_tipo == 0)
                {
                    //não faz nada
                }
                else {
                    DropDownList1.SelectedValue = id_tipo.ToString();
                }

            }//fim do if tb01.rows.count
        }//fim do if Page.IsPostBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataSet1TableAdapters.tb_paginasTableAdapter editar_pagina = new DataSet1TableAdapters.tb_paginasTableAdapter();
        
        int id= Convert.ToInt32(Request.QueryString["id"]);
        string titulo = txt_titulo.Text;
        string conteudo = FCKeditor1.Value;
        int sessao = 1;
        int subpagina = 1;
        string exibir = RadioButtonList2.Text;
        int galeria = Convert.ToInt32(RadioButtonList3.SelectedValue);

        string url = txt_url.Text;
        DataTable tb00 = editar_pagina.Get_select_id(id);


        int pagina_mae = Convert.ToInt32(tb00.Rows[0]["pagina_mae"]);
        DateTime data = DateTime.Now.Date;
        string ordem_str = txt_ordem.Text;
        if (ordem_str == null || ordem_str == "")
        {
            ordem_str = "0";
        }
        int ordrem = Convert.ToInt32(ordem_str);
        int tipo_pag = Convert.ToInt32(RadioButtonList1.SelectedValue);
        int id_tipo = Convert.ToInt32(DropDownList1.SelectedValue);

        if (tipo_pag == 0) {
            id_tipo = 0;
        }
        string link_imagem = "";
        string imagem = "";
        
        editar_pagina.Update_pagina(titulo, conteudo, subpagina, pagina_mae, data, ordrem, tipo_pag,imagem,link_imagem,id_tipo,exibir,url,galeria,id);
        Response.Write(@"<script>alert('Subpagina Editada com Sucesso!');location.href='subpaginas.aspx?id=" + pagina_mae.ToString() + "'</script>");
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string tipo = RadioButtonList1.SelectedValue;
        if (tipo == "0")
        {
            div_conteudo = "style='display:block;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:none;'";
        }
        else if (tipo == "2")
        {

            div_conteudo = "style='display:none;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:block;'";

        }
        else if (tipo == "3")
        {

            div_conteudo = "style='display:none;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:block;'";

        }
        else
        {
            div_conteudo = "style='display:none;'";
            div_url = "style='display:none;'";
            div_formulario = "style='display:blcok;'";
        }

    }
}
