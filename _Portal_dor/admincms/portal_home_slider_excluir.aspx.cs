using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admincms_portal_home_slider_excluir : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_slider = Convert.ToInt32(Request.QueryString["id"]);
            var slider = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_slider == id_slider).FirstOrDefault();
            if (slider != null)
            {
                Label1.Text = slider.ds_link.ToString();
                Image1.ImageUrl = "../images/slider_home/" + slider.ds_imagem;
            }//fim do if banner !=null
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "erro", "alert('Slider não localizado');location.href='portal_home_slider.aspx';", true);
            }//fim do else
        }//fim do if isPostBack
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_slider = Convert.ToInt32(Request.QueryString["id"]);
        var slider = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_slider == id_slider).FirstOrDefault();
        try
        {
            cnDor.DeleteObject(slider);
            cnDor.SaveChanges();

            FileInfo TheFile = new FileInfo(MapPath("~/") + "/images/slider_home//" + slider.ds_imagem);
            File.Delete(MapPath("~/") + "/images/slider_home//" + slider.ds_imagem);

            ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Imagem excluida com sucesso');location.href='portal_home_slider.aspx';", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "erro", "alert('Não foi possivel excluir a imagem./nErro: "+ex.Message+"');location.href='portal_home_slider.aspx';", true);
        }
    }
}