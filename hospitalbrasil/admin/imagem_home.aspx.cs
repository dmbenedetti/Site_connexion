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

public partial class admin_imagem_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { 
        DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter imagem_home = new DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter();
        DataTable tb00 = imagem_home.Get_select_all();
        Image1.ImageUrl = "../images/destaque_home/" + (string)tb00.Rows[0]["imagem"];
        txt_link.Text = (string)tb00.Rows[0]["link"];
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter imagem_home = new DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter();
        DataTable tb00 = imagem_home.Get_select_all();
        string link = txt_link.Text;
        string imagem = (string)tb00.Rows[0]["imagem"];
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

        }//fim do if
        else
        {

        }//fim do else

        //**************************************************************************************
        imagem_home.Update_imagem(link);
        Response.Write(@"<script>alert('Imagem Alterada com Sucesso');location.href='home.aspx'</script>");
        

    }
}
