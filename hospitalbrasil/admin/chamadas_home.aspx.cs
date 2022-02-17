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

public partial class admin_chamadas_home1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) { 
        
        
        DataSet1TableAdapters.tb_chamadas_home1TableAdapter chamadas = new DataSet1TableAdapters.tb_chamadas_home1TableAdapter();
        DataTable tb00 = chamadas.Get_select_id(id);
        Image1.ImageUrl = "../images/chamadas_home/" + (string)tb00.Rows[0]["imagem"];
        txt_titulo.Text = (string)tb00.Rows[0]["titulo"];
        txt_link.Text = (string)tb00.Rows[0]["link"];
        int destino = Convert.ToInt32(tb00.Rows[0]["destino"]);
        RadioButtonList1.SelectedValue = destino.ToString();
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_chamadas_home1TableAdapter chamadas = new DataSet1TableAdapters.tb_chamadas_home1TableAdapter();
        DataTable tb01 = chamadas.Get_select_id(id);

        string titulo = txt_titulo.Text;
        string link = txt_link.Text;
        string imagem = "";
        int destino = Convert.ToInt32(RadioButtonList1.SelectedValue);
       
        if (tb01.Rows.Count > 0) {
            imagem = (string)tb01.Rows[0]["imagem"];
        }


        string erro_foto = "";

        //**************************************************************************************
        if (FileUpload1.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/chamadas_home/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //string nome_foto1 = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            int tamanho_kb = FileUpload1.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 1638400) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 200 KB.<br />"; }//fim do if
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
        else { 
        
        }//fim do else

        //**************************************************************************************

        chamadas.Update_chamada(imagem, titulo, link,destino, id);
        Response.Write(@"<script>alert('Chamada Alterada com Sucesso');location.href='home.aspx'</script>");
    }

}
