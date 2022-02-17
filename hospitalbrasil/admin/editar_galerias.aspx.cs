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
using System.IO;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class admin_editar_galerias : System.Web.UI.Page
{
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
    public string erro;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {

        string titulo = txt_titulo.Text;
        int id_pg = Convert.ToInt32( Request.QueryString["id"]);
        string foto1 = "";
        string erro_foto = "";
        string nomeArq = "img" + DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");

        //**************************************************************************************
        // FOTO 1
        //verifica se há algum arquivo postado na foto2
        if (fupfoto.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/galeria/");
            string extensao = System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
            string nome_foto1 = nomeArq + System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
            int tamanho_kb = fupfoto.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 204800)
                {
                    autorizado1 = autorizado1 + "Foto: Não São permitidos arquivos maiores que 200 KB.<br />";

                }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else
            {
                autorizado1 = autorizado1 + "Foto: Extensão não permitida.<br />";
            }//fim do else


            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    fupfoto.SaveAs(caminho + nome_foto1);
                    foto1 = nome_foto1;
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Foto: " + ex.Message + "<br />";
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
            erro_foto = "Nenhuma Foto selecionada para o envio!";
        }
        //**************************************************************************************
        if (erro_foto == "")
        {


            string insert_string = "INSERT INTO tb_galeria (id_pg, nome_arquivo ,titulo) VALUES(@id_pg, @nome_arquivo, @titulo)";
            string connexionstring = ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ToString();
            SqlDataReader dr;
            SqlConnection cn = new SqlConnection(connexionstring);
            SqlCommand cm = new SqlCommand(insert_string, cn);
            cm.Parameters.Add(new SqlParameter("@id_pg",id_pg ));
            cm.Parameters.Add(new SqlParameter("@nome_arquivo", foto1));
            cm.Parameters.Add(new SqlParameter("@titulo", titulo));
            try
            {
                cn.Open();
                dr = cm.ExecuteReader(CommandBehavior.CloseConnection);
                cn.Close();
                Response.Write(@"<script>alert('Foto Cadastrada com sucesso!');location.href='editar_galerias.aspx?id="+ id_pg.ToString()+"';</script>");
            }
            catch (Exception ex)
            {
                Response.Write(@"<script>alert('erro na hora de inserir no banco de dados!!!!!!')");
                cn.Close();
            }



        }
        else
        {
            lblmsg.Text = erro_foto;
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
}
