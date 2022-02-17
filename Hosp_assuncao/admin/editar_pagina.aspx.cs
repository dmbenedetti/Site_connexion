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
                Image1.ImageUrl = "../images/destaque_home/" + (string)tb01.Rows[0]["imagem_destaque"];
                txt_link_img.Text = (string)tb01.Rows[0]["link_imagem_destaque"];
                txt_url.Text = (string)tb01.Rows[0]["url"];
                string exibir = (string)tb01.Rows[0]["exibir"];
                RadioButtonList2.Text = exibir;
                //radiolist da galeria
                RadioButtonList3.SelectedValue = Convert.ToString(tb01.Rows[0]["galeria"]);

                int tipo_pag = Convert.ToInt32(tb01.Rows[0]["tipo"]);
                if (tipo_pag == 0)
                {
                    RadioButtonList1.SelectedValue = "0";
                    div_conteudo = "style='display:blcok;'";
                    div_formulario = "style='display:none;'";
                }
                else if (tipo_pag == 2) {
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
        int subpagina = 0;
        int pagina_mae = 0;
        string exibir = RadioButtonList2.Text;
        string url = txt_url.Text;
        int galeria = Convert.ToInt32(RadioButtonList3.SelectedValue);

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
        string link_imagem = txt_link_img.Text;
        string imagem = "";
        DataTable tb01 = editar_pagina.Get_select_id(id);
        if (tb01.Rows.Count > 0) {
            imagem = (string)tb01.Rows[0]["imagem_destaque"];
        }


        string erro_foto = "";

        //**************************************************************************************

        if (FileUpload1.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/destaque_home/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //string nome_foto1 = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            int tamanho_kb = FileUpload1.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 6553600) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else

            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    FileUpload1.SaveAs(caminho + imagem);
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    erro_foto = erro_foto + autorizado1;
                }//fim do catch

            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {

                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto = erro_foto + autorizado1;
            }//fim do else

        }//fim fo if
        
        //**************************************************************************************












        editar_pagina.Update_pagina(titulo, conteudo, subpagina, pagina_mae, data, ordrem, tipo_pag,imagem,link_imagem,id_tipo,exibir,url,galeria,id);
        Response.Write(@"<script>alert('Página Editada com Sucesso!');location.href='paginas.aspx'</script>");
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
        else if (tipo == "2") {

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
