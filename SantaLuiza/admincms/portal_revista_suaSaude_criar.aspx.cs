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
    protected void Button1_Click(object sender, EventArgs e)
    {
        int nr_edicao = Convert.ToInt32(txt_nrEdicao.Text);
        DateTime data = Convert.ToDateTime(txt_data.Text);
        db_rede_dorModel.TB_PORTAL_EDICAO_REVISTA novaEdicao = new db_rede_dorModel.TB_PORTAL_EDICAO_REVISTA();
        novaEdicao.id_status = 1;
        novaEdicao.nr_edicao = nr_edicao;
        novaEdicao.dt_edicao = data;
        //novaEdicao.ds_destaque = txt_destaque.Text;
        //novaEdicao.ds_descricao = txt_ds.Text;
        try
        {

            //se selecionou uma outra imagem;
            string imagem; ;
            string erro_foto = "";
            string nomeArq = "Revista-Sua-Saude_N"+nr_edicao.ToString()+"_"+data.ToString("dd-MM-yyyy");
            nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
            nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string autorizado1 = "";
            string caminho = Server.MapPath("../Revista_SuaSaude/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //string nome_foto1 = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            int tamanho_kb = FileUpload1.PostedFile.ContentLength;

            string nomeArq_img = "Revista-Sua-Saude_N" + nr_edicao.ToString() + "_" + data.ToString("dd-MM-yyyy");
            nomeArq_img = GetStringNoAccents(nomeArq_img).Replace(" ", "_");
            nomeArq_img = nomeArq_img + System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();



            //verifica a extensão do arquivo.
            if (extensao == ".pdf")
            {

                //verifica o tamanho em kb
                if (tamanho_kb > 31457280) { autorizado1 = autorizado1 + "Arquivo: Não São permitidos arquivos maiores que 30 MB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado1 = autorizado1 + "Arquivo: Extensão não permitida.<br />"; }//fim do else

            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //faz o upload do arquivo pdf
                    FileUpload1.SaveAs(caminho + nomeArq);
                    imagem = nomeArq;
                //    novaEdicao.ds_arquivo = nomeArq;
                ////faz o upload da imagem destaque
                //    uploadimagem(nr_edicao,data);
                //    novaEdicao.ds_imagem = nomeArq_img;
                //grava no banco a edição da revista
                    cnDor.AddToTB_PORTAL_EDICAO_REVISTA(novaEdicao);
                    cnDor.SaveChanges();
                //pega o id_da edição no banco e redireciona para cadastrar as matérias
                    var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Select(x => x.id_edicao).OrderByDescending(x=>x).FirstOrDefault();
                    Response.Redirect("portal_revista_suaSaude_edicao_materias.aspx?id=" + edicao.ToString());

            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto = erro_foto + autorizado1;
                lbl_erro.Text = erro_foto;
            }//fim do else


           
        }
        catch (Exception ex)
        {
            Response.Write(@"<script>alert('Não foi possivel Cadastrar a Edição.\n Erro:" + ex.Message + "')</script>");
            
        }
    }
}