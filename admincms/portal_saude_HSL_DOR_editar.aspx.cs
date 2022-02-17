using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            int id = Convert.ToInt32(Request.QueryString["id"]);
            var audio = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_saude == id).FirstOrDefault();
            if (audio != null) {
                TextBox1.Text = audio.nm_titulo;
                DropDownList1.SelectedValue = audio.id_tema.ToString();
                DropDownList2.SelectedValue = audio.id_espedcialista.ToString();
                //lbl_audio.Text = "<a href='#'>"+audio.ds_audio+"</a>";
                lbl_audio.Text = "<audio controls><source src='../podcast/"+audio.ds_audio+"' type='audio/mpeg'>Your browser does not support the audio element.</audio>";

            }//fim do if audio  

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
    protected void Button1_Click1(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        var audio = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_saude == id).FirstOrDefault();
        if (audio != null) { 
            int tema = Convert.ToInt32(DropDownList1.SelectedValue);
            int especialista = Convert.ToInt32(DropDownList2.SelectedValue);
            audio.nm_titulo = TextBox1.Text;
            audio.id_tema = tema;
            audio.id_espedcialista = especialista;
            try
            {
                if (FileUpload1.HasFile)
                {
                    //se selecionou uma outra imagem;
                    string imagem;
                    string erro_foto = "";
                    string autorizado1 = "";
                    string nomeArq = DateTime.Now.Ticks.ToString();
                    nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
                    nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                    string caminho = "../podcast/";
                    string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                    int tamanho_kb = FileUpload1.PostedFile.ContentLength;
                    //verifica a extensão do arquivo.
                    if (extensao == ".mp3")
                    {
                        //verifica o tamanho em kb
                        if (tamanho_kb > 6291456) { autorizado1 = autorizado1 + "Áudio: Não São permitidos arquivos maiores que 6 MB.<br />"; }//fim do if
                    }//fim do if
                    //se a extensão não for permitida grava o erro na string.
                    else { autorizado1 = autorizado1 + "Áudio: Extensão não permitida.<br />"; }//fim do else
                    //verifica se há algum erro.
                    if (autorizado1 == "")
                    {
                        string imagem_old = audio.ds_audio;
                        FileInfo TheFile = new FileInfo(MapPath("../") + "/podcast/" + imagem_old);
                        File.Delete(MapPath("../") + "/podcast/" + imagem_old);

                        string url = Server.MapPath(caminho);
                        FileUpload1.SaveAs(url + nomeArq);
                        audio.ds_audio = nomeArq;
                        cnDor.SaveChanges();
                        Response.Write(@"<script>alert('Dados Alterado com sucesso.');location.href='portal_saude_HSL_DOR.aspx'</script>");

                    }//fim do if
                    //exibe na tela se houver algum erro gravado na string erro.
                    else
                    {
                        erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
                    }//fim do else
                }//fim do if FileUpload1.HasFile
                else {
                    cnDor.SaveChanges();
                    Response.Write(@"<script>alert('Dados Alterado com sucesso.');location.href='portal_saude_HSL_DOR.aspx'</script>");
                }//fim do else FileUpload1.HasFile
            
            }
            catch (Exception ex)
            {
                lbl_erro.Text = ex.Message;
            }
        }//fim do if audio
    }
}