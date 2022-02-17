using System;
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

public partial class _Default : System.Web.UI.Page 
{
    public string chamadas1_home = "";
    public string imagem_destaque_home = "";
    public string imagem_banner1 = "";
    public string imagem_banner2 = "";
    public string noticia1 = "";
    public string noticia2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet1TableAdapters.tb_chamadas_home1TableAdapter chamadas1 = new DataSet1TableAdapters.tb_chamadas_home1TableAdapter();
        DataTable tb00 = chamadas1.Get_select_all();
        if (!Page.IsPostBack)
        {
            chamadas1_home = "<table width='960' align='center'>";
            chamadas1_home += "<tr>";
            int dest_chamada1 = Convert.ToInt32(tb00.Rows[0]["destino"]);
            if (dest_chamada1 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[0]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[0]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[0]["link"] + "' target='_blank'>" + (string)tb00.Rows[0]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[0]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[0]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[0]["link"] + "'>" + (string)tb00.Rows[0]["titulo"] + "</a></td>";
            }
            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
            int dest_chamada2 = Convert.ToInt32(tb00.Rows[1]["destino"]);
            if (dest_chamada2 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[1]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[1]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[1]["link"] + "' target='_blank'>" + (string)tb00.Rows[1]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[1]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[1]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[1]["link"] + "'>" + (string)tb00.Rows[1]["titulo"] + "</a></td>";
            }

            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";

            int dest_chamada3 = Convert.ToInt32(tb00.Rows[2]["destino"]);
            if (dest_chamada3 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[2]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[2]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[2]["link"] + "' target='_blank'>" + (string)tb00.Rows[2]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[2]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[2]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[2]["link"] + "'>" + (string)tb00.Rows[2]["titulo"] + "</a></td>";
            }
            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
            int dest_chamada4 = Convert.ToInt32(tb00.Rows[3]["destino"]);
            if (dest_chamada4 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[3]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[3]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[3]["link"] + "' target='_blank'>" + (string)tb00.Rows[3]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[3]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[3]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[3]["link"] + "'>" + (string)tb00.Rows[3]["titulo"] + "</a></td>";
            }
            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";

            int dest_chamada5 = Convert.ToInt32(tb00.Rows[4]["destino"]);
            if (dest_chamada5 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[4]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[4]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[4]["link"] + "' target='_blank'>" + (string)tb00.Rows[4]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[4]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[4]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[4]["link"] + "'>" + (string)tb00.Rows[4]["titulo"] + "</a></td>";
            }










            /*chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[2]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[2]["imagem"] + "'  width=74 height=41/></a></td>";
                            chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[2]["link"] + "'>" + (string)tb00.Rows[2]["titulo"] + "</a></td>";
                            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
                            chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[3]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[3]["imagem"] + "' width=74 height=41 /></a></td>";
                            chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[3]["link"] + "'>" + (string)tb00.Rows[3]["titulo"] + "</a></td>";
                            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
                            chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[4]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[4]["imagem"] + "'  width=74 height=41/></a></td>";
                            chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[4]["link"] + "'>" + (string)tb00.Rows[4]["titulo"] + "</a></td>";					*/
            chamadas1_home += "</tr>";
            chamadas1_home += "</table>";


            DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter imagem_destaque = new DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter();
            DataTable tb01 = imagem_destaque.Get_select_all();
            imagem_destaque_home = "<a href='" + (string)tb01.Rows[0]["link"] + "'><img src='images/destaque_home/" + (string)tb01.Rows[0]["imagem"] + "' width=1015 height=249 /></a>";

            DataSet1TableAdapters.tb_banners_homeTableAdapter banners = new DataSet1TableAdapters.tb_banners_homeTableAdapter();
            DataTable tb03 = banners.Get_select_all();
            imagem_banner1 = "<a href='" + (string)tb03.Rows[0]["link"] + "'><img src='images/" + (string)tb03.Rows[0]["imagem"] + "' width=204 height=193 /></a>";
            imagem_banner2 = "<a href='" + (string)tb03.Rows[1]["link"] + "'><img src='images/" + (string)tb03.Rows[1]["imagem"] + "' width=204 height=193 /></a>";



            string titulo1_noticia1 = "";
            string resumo1_noticia1 = "";
            string pagina1_noticia1 = "";
            string imagem_noticia1 = "";
            string titulo2_noticia1 = "";
            string resumo2_noticia1 = "";
            string pagina2_noticia1 = "";
            int tipo_noticia1 = 0;


            string titulo1_noticia2 = "";
            string resumo1_noticia2 = "";
            string pagina1_noticia2 = "";
            string imagem_noticia2 = "";
            string titulo2_noticia2 = "";
            string resumo2_noticia2 = "";
            string pagina2_noticia2 = "";
            int tipo_noticia2 = 0;

            DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter noticias_chamadas = new DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter();
            DataTable tb04 = noticias_chamadas.Get_select_all();
            if (tb04.Rows.Count > 0)
            {
                titulo1_noticia1 = (string)tb04.Rows[0]["titulo"];
                resumo1_noticia1 = (string)tb04.Rows[0]["resumo"];
                pagina1_noticia1 = (string)tb04.Rows[0]["pagina"];
                imagem_noticia1 = (string)tb04.Rows[0]["imagem"];
                titulo2_noticia1 = (string)tb04.Rows[0]["titulo2"];
                resumo2_noticia1 = (string)tb04.Rows[0]["resumo2"];
                pagina2_noticia1 = (string)tb04.Rows[0]["pagina2"];
                tipo_noticia1 = Convert.ToInt32(tb04.Rows[0]["tipo"]);
                int not_destino1 = Convert.ToInt32(tb04.Rows[0]["destino"]);
                int not_destino2 = Convert.ToInt32(tb04.Rows[0]["destino2"]);
                string not1_dest1 = "";
                string not1_dest2 = "";
                if (not_destino1 == 2)
                {
                    not1_dest1 = " target='_blank'";
                }
                if (not_destino2 == 2)
                {
                    not1_dest2 = " target='_blank'";
                }

                titulo1_noticia2 = (string)tb04.Rows[1]["titulo"];
                resumo1_noticia2 = (string)tb04.Rows[1]["resumo"];
                pagina1_noticia2 = (string)tb04.Rows[1]["pagina"];
                imagem_noticia2 = (string)tb04.Rows[1]["imagem"];
                titulo2_noticia2 = (string)tb04.Rows[1]["titulo2"];
                resumo2_noticia2 = (string)tb04.Rows[1]["resumo2"];
                pagina2_noticia2 = (string)tb04.Rows[1]["pagina2"];
                tipo_noticia2 = Convert.ToInt32(tb04.Rows[1]["tipo"]);
                int not2_destino1 = Convert.ToInt32(tb04.Rows[1]["destino"]);
                int not2_destino2 = Convert.ToInt32(tb04.Rows[1]["destino2"]);
                string not2_dest1 = "";
                string not2_dest2 = "";
                if (not2_destino1 == 2)
                {
                    not2_dest1 = " target='_blank'";
                }
                if (not2_destino2 == 2)
                {
                    not2_dest2 = " target='_blank'";
                }

                if (tipo_noticia1 == 0)
                {
                    noticia1 += "<img src='images/imgs_temp/" + imagem_noticia1 + "' width=219 height=75 /><br /><p><a href='" + pagina1_noticia1 + "' " + not1_dest1 + ">" + titulo1_noticia1 + "</a></p><p>" + resumo1_noticia1 + "</p>";


                }//fim do if tipo=0
                else
                {
                    noticia1 += "<div><a href='" + pagina1_noticia1 + "' " + not1_dest1 + ">" + titulo1_noticia1 + "</a><p>" + resumo1_noticia1 + "</p></div><div><a href='" + pagina2_noticia1 + "' " + not1_dest2 + ">" + titulo2_noticia1 + "</a><p>" + resumo2_noticia1 + "</p></div>";
                }//fim do else tipo=0


                if (tipo_noticia2 == 0)
                {
                    noticia2 += "<img src='images/imgs_temp/" + imagem_noticia2 + "' width=219 height=75 /><br /><p><a href='" + pagina1_noticia2 + "' " + not2_dest1 + ">" + titulo1_noticia2 + "</a></p><p>" + resumo1_noticia2 + "</p>";
                }//fim do if tipo=0
                else
                {
                    noticia2 += "<div><a href='" + pagina1_noticia2 + "' " + not2_dest1 + ">" + titulo1_noticia2 + "</a><p>" + resumo1_noticia2 + "</p></div><div><a href='" + pagina2_noticia2 + "' " + not2_dest2 + ">" + titulo2_noticia2 + "</a><p>" + resumo2_noticia2 + "</p></div>";
                }//fim do else tipo=0
            }//fim do tb04







        }//fim do if pagepostback
        else {
            chamadas1_home = "<table width='960' align='center'>";
            chamadas1_home += "<tr>";
            int dest_chamada1 = Convert.ToInt32(tb00.Rows[0]["destino"]);
            if (dest_chamada1 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[0]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[0]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[0]["link"] + "' target='_blank'>" + (string)tb00.Rows[0]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[0]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[0]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[0]["link"] + "'>" + (string)tb00.Rows[0]["titulo"] + "</a></td>";
            }
            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
            int dest_chamada2 = Convert.ToInt32(tb00.Rows[1]["destino"]);
            if (dest_chamada2 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[1]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[1]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[1]["link"] + "' target='_blank'>" + (string)tb00.Rows[1]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[1]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[1]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[1]["link"] + "'>" + (string)tb00.Rows[1]["titulo"] + "</a></td>";
            }

            chamadas1_home += "<td width='2' height='41' valign='middle'><img src='images/divisor.jpg' /></td>";

            int dest_chamada3 = Convert.ToInt32(tb00.Rows[2]["destino"]);
            if (dest_chamada3 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[2]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[2]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[2]["link"] + "' target='_blank'>" + (string)tb00.Rows[2]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[2]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[2]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[2]["link"] + "'>" + (string)tb00.Rows[2]["titulo"] + "</a></td>";
            }
            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
            int dest_chamada4 = Convert.ToInt32(tb00.Rows[3]["destino"]);
            if (dest_chamada4 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[3]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[3]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[3]["link"] + "' target='_blank'>" + (string)tb00.Rows[3]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[3]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[3]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[3]["link"] + "'>" + (string)tb00.Rows[3]["titulo"] + "</a></td>";
            }
            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";

            int dest_chamada5 = Convert.ToInt32(tb00.Rows[4]["destino"]);
            if (dest_chamada5 == 2)
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[4]["link"] + "'  target='_blank'><img src='images/chamadas_home/" + (string)tb00.Rows[4]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[4]["link"] + "' target='_blank'>" + (string)tb00.Rows[4]["titulo"] + "</a></td>";
            }
            else
            {
                chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[4]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[4]["imagem"] + "' width=74 height=41 /></a></td>";
                chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[4]["link"] + "'>" + (string)tb00.Rows[4]["titulo"] + "</a></td>";
            }










            /*chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[2]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[2]["imagem"] + "'  width=74 height=41/></a></td>";
                            chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[2]["link"] + "'>" + (string)tb00.Rows[2]["titulo"] + "</a></td>";
                            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
                            chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[3]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[3]["imagem"] + "' width=74 height=41 /></a></td>";
                            chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[3]["link"] + "'>" + (string)tb00.Rows[3]["titulo"] + "</a></td>";
                            chamadas1_home += "<td width='2' height='42' valign='middle'><img src='images/divisor.jpg' /></td>";
                            chamadas1_home += "<td width='82' height='42'><a href='" + (string)tb00.Rows[4]["link"] + "'><img src='images/chamadas_home/" + (string)tb00.Rows[4]["imagem"] + "'  width=74 height=41/></a></td>";
                            chamadas1_home += "<td valign='middle' align='left' width='95'><a href='" + (string)tb00.Rows[4]["link"] + "'>" + (string)tb00.Rows[4]["titulo"] + "</a></td>";					*/
            chamadas1_home += "</tr>";
            chamadas1_home += "</table>";


            DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter imagem_destaque = new DataSet1TableAdapters.tb_imagem_destaque_homeTableAdapter();
            DataTable tb01 = imagem_destaque.Get_select_all();
            imagem_destaque_home = "<a href='" + (string)tb01.Rows[0]["link"] + "'><img src='images/destaque_home/" + (string)tb01.Rows[0]["imagem"] + "' width=1015 height=248 /></a>";

            DataSet1TableAdapters.tb_banners_homeTableAdapter banners = new DataSet1TableAdapters.tb_banners_homeTableAdapter();
            DataTable tb03 = banners.Get_select_all();
            imagem_banner1 = "<a href='" + (string)tb03.Rows[0]["link"] + "'><img src='images/" + (string)tb03.Rows[0]["imagem"] + "' width=164 height=186 /></a>";
            imagem_banner2 = "<a href='" + (string)tb03.Rows[1]["link"] + "'><img src='images/" + (string)tb03.Rows[1]["imagem"] + "' width=164 height=186 /></a>";



            string titulo1_noticia1 = "";
            string resumo1_noticia1 = "";
            string pagina1_noticia1 = "";
            string imagem_noticia1 = "";
            string titulo2_noticia1 = "";
            string resumo2_noticia1 = "";
            string pagina2_noticia1 = "";
            int tipo_noticia1 = 0;


            string titulo1_noticia2 = "";
            string resumo1_noticia2 = "";
            string pagina1_noticia2 = "";
            string imagem_noticia2 = "";
            string titulo2_noticia2 = "";
            string resumo2_noticia2 = "";
            string pagina2_noticia2 = "";
            int tipo_noticia2 = 0;

            DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter noticias_chamadas = new DataSet1TableAdapters.tb_home_chamadas_noticiasTableAdapter();
            DataTable tb04 = noticias_chamadas.Get_select_all();
            if (tb04.Rows.Count > 0)
            {
                titulo1_noticia1 = (string)tb04.Rows[0]["titulo"];
                resumo1_noticia1 = (string)tb04.Rows[0]["resumo"];
                pagina1_noticia1 = (string)tb04.Rows[0]["pagina"];
                imagem_noticia1 = (string)tb04.Rows[0]["imagem"];
                titulo2_noticia1 = (string)tb04.Rows[0]["titulo2"];
                resumo2_noticia1 = (string)tb04.Rows[0]["resumo2"];
                pagina2_noticia1 = (string)tb04.Rows[0]["pagina2"];
                tipo_noticia1 = Convert.ToInt32(tb04.Rows[0]["tipo"]);
                int not_destino1 = Convert.ToInt32(tb04.Rows[0]["destino"]);
                int not_destino2 = Convert.ToInt32(tb04.Rows[0]["destino2"]);
                string not1_dest1 = "";
                string not1_dest2 = "";
                if (not_destino1 == 2)
                {
                    not1_dest1 = " target='_blank'";
                }
                if (not_destino2 == 2)
                {
                    not1_dest2 = " target='_blank'";
                }

                titulo1_noticia2 = (string)tb04.Rows[1]["titulo"];
                resumo1_noticia2 = (string)tb04.Rows[1]["resumo"];
                pagina1_noticia2 = (string)tb04.Rows[1]["pagina"];
                imagem_noticia2 = (string)tb04.Rows[1]["imagem"];
                titulo2_noticia2 = (string)tb04.Rows[1]["titulo2"];
                resumo2_noticia2 = (string)tb04.Rows[1]["resumo2"];
                pagina2_noticia2 = (string)tb04.Rows[1]["pagina2"];
                tipo_noticia2 = Convert.ToInt32(tb04.Rows[1]["tipo"]);
                int not2_destino1 = Convert.ToInt32(tb04.Rows[1]["destino"]);
                int not2_destino2 = Convert.ToInt32(tb04.Rows[1]["destino2"]);
                string not2_dest1 = "";
                string not2_dest2 = "";
                if (not2_destino1 == 2)
                {
                    not2_dest1 = " target='_blank'";
                }
                if (not2_destino2 == 2)
                {
                    not2_dest2 = " target='_blank'";
                }

                if (tipo_noticia1 == 0)
                {
                    noticia1 += "<img src='images/imgs_temp/" + imagem_noticia1 + "' width=219 height=75 /><br /><p><a href='" + pagina1_noticia1 + "' " + not1_dest1 + ">" + titulo1_noticia1 + "</a></p><p>" + resumo1_noticia1 + "</p>";


                }//fim do if tipo=0
                else
                {
                    noticia1 += "<div><a href='" + pagina1_noticia1 + "' " + not1_dest1 + ">" + titulo1_noticia1 + "</a><p>" + resumo1_noticia1 + "</p></div><div><a href='" + pagina2_noticia1 + "' " + not1_dest2 + ">" + titulo2_noticia1 + "</a><p>" + resumo2_noticia1 + "</p></div>";
                }//fim do else tipo=0


                if (tipo_noticia2 == 0)
                {
                    noticia2 += "<img src='images/imgs_temp/" + imagem_noticia2 + "' width=219 height=75 /><br /><p><a href='" + pagina1_noticia2 + "' " + not2_dest1 + ">" + titulo1_noticia2 + "</a></p><p>" + resumo1_noticia2 + "</p>";
                }//fim do if tipo=0
                else
                {
                    noticia2 += "<div><a href='" + pagina1_noticia2 + "' " + not2_dest1 + ">" + titulo1_noticia2 + "</a><p>" + resumo1_noticia2 + "</p></div><div><a href='" + pagina2_noticia2 + "' " + not2_dest2 + ">" + titulo2_noticia2 + "</a><p>" + resumo2_noticia2 + "</p></div>";
                }//fim do else tipo=0
            }//fim do tb04
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string busca = TextBox1.Text;
        Response.Redirect("resultados.aspx?pesquisa="+busca);
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string busca = TextBox1.Text;
        Response.Redirect("resultados.aspx?pesquisa=" + busca);
    }
    protected void drp_hosps_SelectedIndexChanged(object sender, EventArgs e)
    {
       // string site = drp_hosps.SelectedValue;
        //Response.Redirect("pagina.aspx?site=" + site);
        //Response.Write("<script> top.location.href='http://www.terra.com.br'</script> ");
        //Page.ClientScript.RegsterStartupScript("<Script>alert('Seu script!');</script>");
        //if (site == "0") { }
        //else {
            //Page.RegisterStartupScript("javascript", "<script>window.open('" + site + "','teste ')</script>");
            //Response.Redirect(site);
            

        //}
    }
}
