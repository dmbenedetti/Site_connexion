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
            int id_edicao = Convert.ToInt32(Request.QueryString["id"]);

            var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Where(x => x.id_edicao == id_edicao).FirstOrDefault();
            if (edicao != null) {
                Label1.Text = edicao.nr_edicao.ToString();
                txt_nrEdicao.Text = edicao.nr_edicao.ToString();
                DateTime data = Convert.ToDateTime(edicao.dt_edicao);
                txt_data.Text = data.ToString("dd/MM/yyyy");
                //txt_ds.Text = edicao.ds_descricao;
                //txt_destaque.Text = edicao.ds_destaque;
                //lbl_arquivo.Text = "<a href='../Revista_SuaSaude/" + edicao.ds_arquivo + "' target='_blank'>" + edicao.ds_arquivo + "</a>";
                //Image1.ImageUrl = "../Revista_SuaSaude/"+edicao.ds_imagem;
                //lbl_erro2.Text = "";
            }//fim do if edicao!=null
           
                          

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
    protected string uploadimagem(int nr_edicao, DateTime data)
    {
        //se selecionou uma outra imagem;
        string imagem;
        string erro_foto = "";
        string autorizado1 = "";
        string nomeArq = "Revista-Sua-Saude_N" + nr_edicao.ToString() + "_" + data.ToString("dd-MM-yyyy");
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
        string caminho = Server.MapPath("../Revista_SuaSaude/");
        string extensao = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
        int tamanho_kb = FileUpload2.PostedFile.ContentLength;
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
                FileUpload2.SaveAs(caminho + nomeArq);
                imagem = nomeArq;
                return imagem;
            }//fim do try
            //se houver algum erro na hora de salvar o arquivo grava na srting erro.
            catch (Exception ex)
            {
                autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                erro_foto = erro_foto + autorizado1;
                lbl_erro.Text = erro_foto;
                return "erro";
            }//fim do catch
        }//fim do if
        //exibe na tela se houver algum erro gravado na string erro.
        else
        {
            //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
            erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
            return "erro";
        }//fim do else
    }
    protected string uploadpdf(int nr_edicao, DateTime data)
    {
        //se selecionou uma outra imagem;
        string imagem;
        string erro_foto = "";
        string autorizado1 = "";
        string nomeArq = "Revista-Sua-Saude_N" + nr_edicao.ToString() + "_" + data.ToString("dd-MM-yyyy");
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        string caminho = Server.MapPath("../Revista_SuaSaude/");
        string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        int tamanho_kb = FileUpload1.PostedFile.ContentLength;
        //verifica a extensão do arquivo.
        if (extensao == ".pdf")
        {
            //verifica o tamanho em kb
            if (tamanho_kb > 31457280) { autorizado1 = autorizado1 + "Arquivo: Não São permitidos arquivos maiores que 30 MB.<br />"; }//fim do if
        }//fim do if
        //se a extensão não for permitida grava o erro na string.
        else { autorizado1 = autorizado1 + "pdf: Extensão não permitida.<br />"; }//fim do else
        //verifica se há algum erro.
        if (autorizado1 == "")
        {
            //salva o arquivo e exibe mensagem de sucesso.
            try
            {
                FileUpload1.SaveAs(caminho + nomeArq);
                imagem = nomeArq;
                return imagem;
            }//fim do try
            //se houver algum erro na hora de salvar o arquivo grava na srting erro.
            catch (Exception ex)
            {
                autorizado1 = autorizado1 + "pdf: " + ex.Message + "<br />";
                erro_foto = erro_foto + autorizado1;
                lbl_erro2.Text += erro_foto;
                return "erro";
            }//fim do catch
        }//fim do if
        //exibe na tela se houver algum erro gravado na string erro.
        else
        {
            //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
            erro_foto = "Não foi possivel subir o pdf:<br />" + erro_foto + autorizado1;
            lbl_erro2.Text += erro_foto;
            return "erro";
        }//fim do else
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int nr_edicao = Convert.ToInt32(txt_nrEdicao.Text);
        DateTime data = Convert.ToDateTime(txt_data.Text);
        int id_edicao = Convert.ToInt32(Request.QueryString["id"]);
         var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Where(x => x.id_edicao == id_edicao).FirstOrDefault();
         if (edicao != null)
         {
             string erro = "";
             try
             {
                 edicao.dt_edicao = data;
                 edicao.nr_edicao = nr_edicao;
                 //edicao.ds_destaque = txt_destaque.Text;
                 //edicao.ds_descricao = txt_ds.Text;
                 #region fileUpload1
                 if (FileUpload1.HasFile)
                 {
                     string arquivo_new = uploadpdf(nr_edicao, data);
                     if (arquivo_new != "erro")
                     {
                         //string arquivo_old = edicao.ds_arquivo;
                         //FileInfo TheFile = new FileInfo(MapPath("../") + "/Revista_SuaSaude/" + arquivo_old);
                         //File.Delete(MapPath("../") + "/Revista_SuaSaude/" + arquivo_old);
                         //define o nome de arquivo no banco
                         //edicao.ds_arquivo = arquivo_new;
                     }//fim do if arquivo_new != "erro"
                     else { erro = arquivo_new + "<br />"; }//fim do else arquivo_new != "erro"
                 }//fim do if FileUpload1.HasFile 
                 #endregion
                 #region FileUpload2
                 if (FileUpload2.HasFile)
                 {
                     string imagem_new = uploadimagem(nr_edicao, data);
                     if (imagem_new != "erro")
                     {
                         //string imagem_old = edicao.ds_imagem;
                         //FileInfo TheFile = new FileInfo(MapPath("../") + "/Revista_SuaSaude/" + imagem_old);
                         //File.Delete(MapPath("../") + "/Revista_SuaSaude/" + imagem_old);
                         ////define o nome de arquivo no banco
                         //edicao.ds_imagem = imagem_new;
                     }//fim do if imagem_new != "erro"
                     else { erro += imagem_new + "<br />"; }//fim do else imagem_new != "erro"
                 }//fim do if FileUpload2.HasFile 
                 #endregion
                 if (erro != "")
                 {
                     lbl_erro.Text = erro;
                 }//fim do if erro == ""
                 else
                 {
                     cnDor.SaveChanges();
                     Response.Write(@"<script>alert('Edição alterada com sucesso!');location.href='portal_revista_suaSaude.aspx'</script>");
                 }//fim do else erro == ""
             }//fim do try
             catch (Exception ex)
             {
                 Response.Write(@"<script>alert('Não foi possivel Cadastrar a Edição.\n Erro:" + ex.Message + "')</script>");
             }//fim do catch
         }//fim do if edicao != null
         else {
             Response.Redirect("portal_revista_suaSaude.aspx");
         }//fim do else
    }
}