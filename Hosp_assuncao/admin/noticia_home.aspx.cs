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

public partial class admin_noticia_home : System.Web.UI.Page
{
    public string exibe_cont1 = "style=display:none;";
    public string exibe_cont2 = "style=display:none;";
    public string exibe_url1 = "style=display:block;";
    public string exibe_url2 = "style=display:block;";

    public string exibe_img = "style=display:block;";
    public string exibe_chamada2 = "style=display:block;";


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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_chamada = Convert.ToInt32(Request.QueryString["id"]);
            DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter select_dados = new DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter();
            DataTable tb00 = select_dados.Get_select_id(id_chamada);
            if (tb00.Rows.Count > 0)
            {
                
                string titulo = (string)tb00.Rows[0]["titulo"];
                string imagem = (string)tb00.Rows[0]["imagem"];
                string resumo = (string)tb00.Rows[0]["resumo"];
                string pagina = (string)tb00.Rows[0]["pagina"];
                string url = (string)tb00.Rows[0]["url"];

                string titulo2 = (string)tb00.Rows[0]["titulo2"];
                string resumo2 = (string)tb00.Rows[0]["resumo2"];
                string pagina2 = (string)tb00.Rows[0]["pagina2"];
                string url2 = (string)tb00.Rows[0]["url2"];

                int destino = Convert.ToInt32(tb00.Rows[0]["destino"]);
                int destino2 = Convert.ToInt32(tb00.Rows[0]["destino2"]);
                int tipo = Convert.ToInt32(tb00.Rows[0]["tipo"]);

                

                //imagem
                rdo_img.SelectedValue = tipo.ToString();
                if (imagem == "" || imagem == null) { img_chamada.Visible = false; }//fim do if
                else { img_chamada.ImageUrl = "../images/imgs_temp/" + imagem; }//fim do else

                //Chamada 1
                txt_titulo1.Text = titulo;
                txt_resumo1.Text = resumo;
                if (destino == 1) { rdo_tipo1.SelectedValue = "1"; }//fim do if
                else { rdo_tipo1.SelectedValue = "2"; }//fim do else
                txt_url1.Text = pagina;

                //Chamada 2
                txt_titulo2.Text = titulo2;
                txt_resumo2.Text = resumo2;
                if (destino2 == 1) { rdo_tipo2.SelectedValue = "1"; }//fim do if
                else { rdo_tipo2.SelectedValue = "2"; }//fim do else
                txt_url2.Text = pagina2;
                if (tipo == 0)
                {
                    exibe_img = "style=display:block";
                    exibe_chamada2 = "style=display:none";
                }
                else
                {
                    exibe_img = "style=display:none";
                    exibe_chamada2 = "style=display:block";
                }
            }//fim do if tb00.rows.count

            FCK1.Visible = false;
            FCK2.Visible = false;
            lblcont2.Visible = false;
            lblcont1.Visible = false;


        }//fim do if page.ispostback
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int id_chamada = Convert.ToInt32(Request.QueryString["id"]);
        string erro_foto = "";

        int tipo = Convert.ToInt32(rdo_img.SelectedValue);
        string imagem = fup_imagem.FileName;
        string imagem_old = img_chamada.ImageUrl;
        if (imagem == "" || imagem == null)
        {
            imagem = imagem_old.Remove(0, 20);
        }

        string titulo1 = txt_titulo1.Text;
        string resumo1 = txt_resumo1.Text;
        string destino1 = rdo_tipo1.SelectedValue;
        string pagina1 = txt_url1.Text;
        string conteudo1 = FCK1.Value;
        // se o destino1 for 3 faz o insert de uma nova noticia no portal, pega o id e coloca na string pagina1
        if (destino1 == "3")
        {
            DateTime data = DateTime.Now.Date;
            DataSet1TableAdapters.tb_noticiasTableAdapter paginas = new DataSet1TableAdapters.tb_noticiasTableAdapter();
            paginas.Insert_noticia(titulo1, resumo1, conteudo1, data);
            DataTable tb_rows = paginas.Get_select_all();
            int qtde_linhas = tb_rows.Rows.Count;
            string ultimo_id = Convert.ToString(tb_rows.Rows[qtde_linhas - 1]["id"]);
            pagina1 = "internas.aspx?id=" + ultimo_id;
            destino1 = "1";
        }//fim do if


        string titulo2 = txt_titulo2.Text;
        string resumo2 = txt_resumo2.Text;
        string destino2 = rdo_tipo2.SelectedValue;
        string pagina2 = txt_url2.Text;
        string conteudo2 = FCK2.Value;
        // se o destino2 for 3 faz o insert de uma nova página no portal, pega o id e coloca na string pagina1
        if (destino2 == "3")
        {
            DateTime data = DateTime.Now.Date;
            DataSet1TableAdapters.tb_noticiasTableAdapter paginas = new DataSet1TableAdapters.tb_noticiasTableAdapter();
            paginas.Insert_noticia(titulo2, resumo2, conteudo2, data);
            DataTable tb_rows = paginas.Get_select_all();
            int qtde_linhas = tb_rows.Rows.Count;
            string ultimo_id = Convert.ToString(tb_rows.Rows[qtde_linhas - 1]["id"]);
            pagina2 = "internas.aspx?id=" + ultimo_id;
            destino1 = "1";
        }//fim do if

        string foto1 = "";
        string nomeArq = "chamada" + id_chamada.ToString();


        if (fup_imagem.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/imgs_temp/");
            string extensao = System.IO.Path.GetExtension(fup_imagem.FileName).ToLower();
            string nome_foto1 = nomeArq + System.IO.Path.GetExtension(fup_imagem.FileName).ToLower();
            int tamanho_kb = fup_imagem.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 204800) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 200 KB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else

            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    fup_imagem.SaveAs(caminho + nome_foto1);
                    imagem = nome_foto1;
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
        //se não houver produto postado no foto1
        else
        {

            foto1 = "";
        }
        //**************************************************************************************
        if (erro_foto == "")
        {
            int dest1 = 1;
            if (rdo_tipo1.SelectedValue == "2") {
                dest1 = 2;
            }
            int dest2 = 1;
            if (rdo_tipo2.SelectedValue == "2")
            {
                dest2 = 2;
            }


            //faz o update
            DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter chamadas_home = new DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter();
            //chamadas_home.Update_chamada_sem_imagem(0, tema, titulo1, resumo1, pagina1, url1, titulo2, resumo2, pagina2, url2, destino1, destino2, id_chamada);
            //chamadas_home.Update_chamada_home(tipo, imagem, titulo1, resumo1, pagina1, pagina1, titulo2, resumo2, pagina2, pagina2, 1, 1, id_chamada);
            chamadas_home.Update_chamada_home(tipo, imagem, titulo1, resumo1, pagina1, pagina1, dest1, titulo2, resumo2, pagina2, pagina2, dest2, id_chamada);
            //chamadas_home.Update_chamada_com_imagem(0, tema, foto1, titulo1, resumo1, pagina1, url1, destino1, id_chamada);
            Response.Redirect("home.aspx");

        }
        else
        {
            lblmsg.Text = erro_foto;
        }
    }
    protected void rdo_tipo1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string resultado = rdo_tipo1.SelectedValue;
        if (resultado == "1")
        {
            FCK1.Visible = false;
            lblcont1.Visible = false;
            lbl_link1.Visible = true;
            txt_url1.Visible = true;
            if (rdo_img.SelectedValue == "0")
            {
                exibe_img = "style=display:block";
                exibe_chamada2 = "style=display:none";
            }
            else
            {
                exibe_img = "style=display:none";
                exibe_chamada2 = "style=display:block";
            }
        }
        else if (resultado == "2")
        {
            FCK1.Visible = false;
            lblcont1.Visible = false;
            lbl_link1.Visible = true;
            txt_url1.Visible = true;
            if (rdo_img.SelectedValue == "0")
            {
                exibe_img = "style=display:block";
                exibe_chamada2 = "style=display:none";
            }
            else
            {
                exibe_img = "style=display:none";
                exibe_chamada2 = "style=display:block";
            }
        }
        else
        {
            FCK1.Visible = true;
            lblcont1.Visible = true;
            lbl_link1.Visible = false;
            txt_url1.Visible = false;
            if (rdo_img.SelectedValue == "0")
            {
                exibe_img = "style=display:block";
                exibe_chamada2 = "style=display:none";
            }
            else
            {
                exibe_img = "style=display:none";
                exibe_chamada2 = "style=display:block";
            }
        }
    }
    protected void rdo_tipo2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string resultado2 = rdo_tipo2.SelectedValue;
        if (resultado2 == "1")
        {
            FCK2.Visible = false;
            lblcont2.Visible = false;
            lbl_link2.Visible = true;
            txt_url2.Visible = true;
        }
        else if (resultado2 == "2")
        {
            FCK2.Visible = false;
            lblcont2.Visible = false;
            lbl_link2.Visible = true;
            txt_url2.Visible = true;
        }
        else
        {
            FCK2.Visible = true;
            lblcont2.Visible = true;
            lbl_link2.Visible = false;
            txt_url2.Visible = false;
        }
    }
    protected void rdo_img_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdo_img.SelectedValue == "0")
        {
            exibe_img = "style=display:block";
            exibe_chamada2 = "style=display:none";
        }
        else
        {
            exibe_img = "style=display:none";
            exibe_chamada2 = "style=display:block";
        }
    }
}
