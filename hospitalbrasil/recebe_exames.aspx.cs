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

public partial class quem_somos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
                string titulo = "Exames on-line";
                lbl_titulo.Text = titulo;
                if (Request.QueryString["resposta"] != "" || Request.QueryString["resposta"] == null)
                {
                    string resposta = Request.QueryString["resposta"];
                    
                    if (resposta == "0")
                    {
                        lblresposta.Text = "Operação realizada com sucesso";
                    }
                    else if (resposta == "1")
                    {
                        lblresposta.Text = "A Identificação do cliente não foi encontrada";
                    }
                    else if (resposta == "2")
                    {
                        lblresposta.Text = "O CRM do médico não foi encontrado";
                    }
                    else if (resposta == "3")
                    {
                        lblresposta.Text = "O Paciente / Médico Não possui um e-mail cadastrado";
                    }
                    else if (resposta == "4")
                    {
                        lblresposta.Text = " O e-mail (caso enviado) não é válido";
                    }
                    else if (resposta == "5")
                    {
                        lblresposta.Text = "Nenhuma informação foi enviada";
                    }
                }
        }//fim do if Page.IsPostBack
    }
}
