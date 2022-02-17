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

public partial class fotosbb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataSet1TableAdapters.tb_fotosbb_textoTableAdapter texto = new DataSet1TableAdapters.tb_fotosbb_textoTableAdapter();
            DataTable tb00 = texto.Get_select_id();
            if (tb00.Rows.Count > 0)
            {
                //Literal1.Text = (string)tb00.Rows[0]["conteudo"];
            }
        }//fim do if page.ispostback
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string codigo = txt_codigo.Text;
        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb00 = fotos.Get_select_codigo(codigo);
        if (tb00.Rows.Count > 0)
        {

            DateTime data_hoje = DateTime.Now.Date;
            DateTime data_saida = Convert.ToDateTime(tb00.Rows[0]["data_saida"]);
            int id_fotos = Convert.ToInt32(tb00.Rows[0]["id"]);
            if (data_hoje > data_saida)
            {
                lbl_msg.Text = "<strong>Importante:</strong><br />A senha informada não está correta ou a foto não está disponível.";
                txt_codigo.Text = "";
            }
            else
            {
                Response.Redirect("fotosbb_ver.aspx?id_bb=" + id_fotos);
            }

        }//fim do if tb00
        else {
            lbl_msg.Text = "<strong>Importante:</strong><br />A senha informada não está correta ou a foto não está disponível.";
            txt_codigo.Text = "";
        }
    }
    protected void txt_codigo_TextChanged(object sender, EventArgs e)
    {
        string codigo = txt_codigo.Text.ToUpper();
        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb00 = fotos.Get_select_codigo(codigo);
        if (tb00.Rows.Count > 0)
        {

            DateTime data_hoje = DateTime.Now.Date;
            DateTime data_saida = Convert.ToDateTime(tb00.Rows[0]["data_saida"]);
            int id_fotos = Convert.ToInt32(tb00.Rows[0]["id"]);
            if (data_hoje > data_saida)
            {
                lbl_msg.Text = "<strong>Importante:</strong><br />A senha informada não está correta ou a foto não está disponível.";
                txt_codigo.Text = "";
            }
            else
            {
                Response.Redirect("fotosbb_ver.aspx?id_bb=" + id_fotos);
            }
        }
        else
        {
            lbl_msg.Text = "<strong>Importante:</strong><br />A senha informada não está correta ou a foto não está disponível.";
            txt_codigo.Text = "";
        }
    }
    protected void btn1_Click(object sender, EventArgs e)
    {

        string codigo = txt_codigo.Text.ToUpper();
        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb00 = fotos.Get_select_codigo(codigo);
        if (tb00.Rows.Count > 0)
        {

            DateTime data_hoje = DateTime.Now.Date;
            DateTime data_saida = Convert.ToDateTime(tb00.Rows[0]["data_saida"]);
            int id_fotos = Convert.ToInt32(tb00.Rows[0]["id"]);
            if (data_hoje > data_saida)
            {
                lbl_msg.Text = "<strong>Importante:</strong><br />A senha informada não está correta ou a foto não está disponível.";
                txt_codigo.Text = "";
            }
            else
            {
                Response.Redirect("fotos_bebes_view.aspx?id_bb=" + id_fotos);
            }
        }
        else
        {
            lbl_msg.Text = "<strong>Importante:</strong><br />A senha informada não está correta ou a foto não está disponível.";
            txt_codigo.Text = "";
        }
    }
}
