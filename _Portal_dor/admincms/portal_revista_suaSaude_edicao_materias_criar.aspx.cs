using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            int id_edicao = Convert.ToInt32(Request.QueryString["id"]);
            var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Where(x => x.id_edicao == id_edicao).FirstOrDefault();
            if (edicao != null) {
                lbl_nr_edicao.Text = edicao.nr_edicao.ToString();
            }//fim do if edicao != null
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
    protected string uploadimagem(string nomeArq, string caminho)
    {
        
            //salva o arquivo e exibe mensagem de sucesso.
            try
            {
                string url = Server.MapPath(caminho);
                FileUpload1.SaveAs(url + nomeArq);;
                return nomeArq;
            }//fim do try
            //se houver algum erro na hora de salvar o arquivo grava na srting erro.
            catch (Exception ex)
            {
                return "erro";
            }//fim do catch
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_edicao = Convert.ToInt32(Request.QueryString["id"]);
        db_rede_dorModel.TB_PORTAL_CONTEUDO revista_materia = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
        revista_materia.ds_conteudo = FCKeditor1.Value;
        revista_materia.nm_titulo = txt_titulo.Text;
        revista_materia.ds_resumo = txt_resumo.Text;
        revista_materia.ds_sessao_revista = txt_sessao.Text;
        revista_materia.id_sessao = 3;//publicações e campanhas
        revista_materia.id_tipo = 9;//revista sua saude
        revista_materia.id_status = 1;
        revista_materia.nr_edicaorevista = id_edicao;
        
        try
        {
            var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Where(x => x.id_edicao == id_edicao).FirstOrDefault();
            int nr_edicao = edicao.nr_edicao;
            DateTime data = DateTime.Now;
            if (FileUpload1.HasFile)
            {
                //se selecionou uma outra imagem;
                string imagem;
                string erro_foto = "";
                string autorizado1 = "";
                string nomeArq = DateTime.Now.Ticks.ToString();
                nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
                nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string caminho = "../Revista_SuaSaude/materias/";
                string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
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
                    uploadimagem(nomeArq, caminho);
                    revista_materia.ds_imgDestaque = nomeArq;
                }//fim do if
                //exibe na tela se houver algum erro gravado na string erro.
                else
                {
                    erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
                }//fim do else
            }//fim do if FileUpload1.HasFile
            revista_materia.nm_titulo_fonetico = iFonetizar.Fonetizar(revista_materia.nm_titulo, false);
            revista_materia.ds_resumo_fonetico = iFonetizar.Fonetizar(revista_materia.ds_resumo, false);
            revista_materia.ds_conteudo_fonetico = iFonetizar.Fonetizar(revista_materia.ds_conteudo, false);
            revista_materia.id_hospital = Convert.ToInt32(Session["idHosp"]);
            cnDor.AddToTB_PORTAL_CONTEUDO(revista_materia);
            cnDor.SaveChanges();
            Response.Write(@"<script>alert('Matéria Inserida com sucesso.');location.href='portal_revista_suaSaude_edicao_materias.aspx?id=" + id_edicao.ToString()+ "'</script>");
        }
        catch (Exception ex) {
            lbl_erro.Text = ex.Message;
        }








    }
}