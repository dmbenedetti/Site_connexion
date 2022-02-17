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
using System.Text.RegularExpressions;

public partial class quem_somos : System.Web.UI.Page
{
    public string CortarString(string textCrop, int num, string trail)
    {
        var result = "";
        var rx = new Regex("<[^>]*>");
        textCrop = rx.Replace(textCrop, "");
        var iMax = num - trail.Length;
        if (iMax <= 0)
        {
            result = "";
        }
        if (textCrop.Length <= num)
        {
            result = textCrop;
        }
        else
        {
            try
            {
                var sOut = textCrop.Substring(0, num);
                var iPos = sOut.LastIndexOf(" ");
                if (iPos != -1)
                {
                    return sOut.Substring(0, iPos) + trail;
                }
                iPos = sOut.Length;
                return sOut.Substring(0, iPos) + trail;
            }
            catch (Exception ex)
            {
                //Erros.FormataErro(ex);
            }
        }
        return result;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string pesquisa = Request.QueryString["pesquisa"];


        DataSet1TableAdapters.tb_paginasTableAdapter lista_produtos = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb01 = lista_produtos.Get_select_pagina_pesquisa(pesquisa,pesquisa);

        DataTable tb_mostra = new DataTable("produtos");
        tb_mostra.Columns.Add("id");
        tb_mostra.Columns.Add("titulo");
        tb_mostra.Columns.Add("conteudo");
        


        if (tb01.Rows.Count > 0)
        {
            string lista_prod = "";

            for (int i = 0; i < tb01.Rows.Count; i++)
            {
                DataRow dr = tb_mostra.NewRow();

                dr["id"] = Convert.ToString(tb01.Rows[i]["id"]);
                dr["titulo"] = (string)tb01.Rows[i]["titulo"];
                string conteudo_temp = (string)tb01.Rows[i]["conteudo"];
                string conteudo = CortarString(conteudo_temp, 500, ".....");
                
                dr["conteudo"] = conteudo;


                tb_mostra.Rows.Add(dr);


                /*int id_produto_p = Convert.ToInt32(tb01.Rows[i]["id"]);
                DataSet1TableAdapters.tb_fotos_produtos1TableAdapter foto_prod = new DataSet1TableAdapters.tb_fotos_produtos1TableAdapter();
                DataTable tb02 = foto_prod.Get_select_id_produto(id_produto_p);
                string foto_produto = "";
                if (tb02.Rows.Count > 0)
                {
                    foto_produto = Convert.ToString(tb02.Rows[0]["arquivo"]);
                }//fim do if
                else
                {
                    foto_produto = "default.gif";
                }//fim do else


                
                */
                //lista_prod += "<div class='produtos'><div class='img_produto'><img src='images/produtos/" + foto_produto + "' width='170' /></div><p><strong>" + (string)tb01.Rows[i]["titulo"] + "</strong><p>cod." + (string)tb01.Rows[i]["codigo"] + "</p></p><a href='produtos_detalhes.aspx?id=" + Convert.ToString(tb01.Rows[i]["id"]) + "'><img src='images/btn_detalhes.jpg' /></a></div>";
            }//fim do for
            Literal1.Text = lista_prod;
        }//fim do if
        else
        {
            //Literal1.Text = "<p>Não há nenhum produto cadastrado nesta categoria.</p>";
        }//fim do else

        ListView1.DataSource = tb_mostra;
        ListView1.DataBind();
    }
}
