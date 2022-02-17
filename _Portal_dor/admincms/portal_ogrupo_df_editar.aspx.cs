using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 4;//IEP
    int tipo = 14;//Inst IEP

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);

            var df = (from n in cnDor.TB_DEMOSTRATIVO_FINANCEIRO
                               where n.idDemostrativo==id_conteudo 
                               select n).FirstOrDefault();
            txt_titulo.Text = df.dsDemostrativo;
            txtData.Text = Convert.ToDateTime(df.dtDemonstrativo).ToString("dd/MM/yyyy");
            if (String.IsNullOrEmpty(df.dsArquivo))
            {
                filepdf.Text = "";
                LinkButton2.Visible = false;
            }
            else
            {
                filepdf.NavigateUrl = "../pdf/df/" + df.dsArquivo;
                filepdf.Text = df.dsArquivo;
                LinkButton2.Visible = true;
            }


        }//fim do if !Page.IsPostBack
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        string titulo = txt_titulo.Text;
        string sfile = "";
        bool erro = false;
        if (FileUpload2.HasFile)
        {
            string upload = uploadfile();
            if (upload != "erro")
            {
                sfile = upload;
            }//fim do if upload!="erro"
            else
            {
                erro = true;
            }
        }//fim do if FileUpload1.HasFile
        if (erro == false)
        {
            try
            {
                var df = (from n in cnDor.TB_DEMOSTRATIVO_FINANCEIRO where n.idDemostrativo == id_conteudo select n).FirstOrDefault();
                df.dsDemostrativo = txt_titulo.Text;
                df.dtDemonstrativo = Convert.ToDateTime(txtData.Text);
                if (FileUpload2.HasFile)
                {
                    if (!string.IsNullOrEmpty(df.dsArquivo))
                    {
                        LinkButton2_Click(null, null);
                    }
                    //define a nova imagem
                    df.dsArquivo = sfile;
                }//fim do if FileUpload1.HasFile
                cnDor.SaveChanges();
                //provavelmente o ACT está dando conflito com a linha abaixo, resolvi fazendo o response.write na linha seguinte
                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Dados Gravados com sucesso');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Dados Gravados com sucesso');location.href='portal_ogrupo_df.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }
        }//fim do if
        else {
            lbl_erro.Text = "Algum erro";
        }
    }

    protected string uploadfile()
    {
        //se selecionou uma outra imagem;
        string imagem;
        string erro_foto = "";
        string nomeArq = DateTime.Now.Ticks.ToString().Substring(0, 4) + FileUpload2.PostedFile.FileName;
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        //nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        string autorizado1 = "";
        string caminho = Server.MapPath("~/pdf/iep/");
        string extensao = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
        //verifica a extensão do arquivo.
        if (extensao != ".pdf")
        { autorizado1 = autorizado1 + "Arquivo: Extensão não permitida.<br />"; }//fim do else
        //verifica se há algum erro.
        if (autorizado1 == "")
        {
            //salva o arquivo e exibe mensagem de sucesso.
            try
            {
                //FileInfo TheFile = new FileInfo(MapPath("../") + "/images/" + imagem);
                //File.Delete(MapPath("../") + "/images/" + imagem);
                FileUpload2.SaveAs(caminho + nomeArq);
                imagem = nomeArq;
                return imagem;
            }//fim do try
            //se houver algum erro na hora de salvar o arquivo grava na srting erro.
            catch (Exception ex)
            {
                autorizado1 = autorizado1 + "Arquivo: " + ex.Message + "<br />";
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

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        var df = (from n in cnDor.TB_DEMOSTRATIVO_FINANCEIRO
                        where n.idDemostrativo == id_conteudo
                        select n).FirstOrDefault();
        string imagem = df.dsArquivo;
        if (imagem != "" || imagem != null)
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/pdf/df/" + imagem);
            File.Delete(MapPath("../") + "/pdf/df/" + imagem);
        }
        LinkButton2.Visible = false;
        filepdf.Text = "";
        df.dsArquivo = null;
        cnDor.SaveChanges();
    }

}