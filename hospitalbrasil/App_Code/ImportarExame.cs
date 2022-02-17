using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ImportarExame
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]

[Serializable]
public class resultadoExames
{
    public string NrFicha { get; set; }
    public List<Erro> Erros = new List<Erro>();
    public string ToStringXML()
    {
        string Return = "";
        Return = "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>";
        Return += "<ResultadoExames NrFicha=\"" + NrFicha + "\">";
        if (Erros.Count > 0)
        {
            Return += "<Erros>";
            foreach (Erro oErro in Erros)
            {
                Return += "<Erro idExame=\"" + oErro.idExame + "\" DscErro=\"" + oErro.DscErro + "\">";
            }
            Return += "</Erros>";
        }
        Return += "</ResultadoExames>";

        return Return;
    }
}
[Serializable]
public class Erro
{
    public string idExame { get; set; }
    public string DscErro { get; set; }
}

public class ImportarExame : System.Web.Services.WebService {

    public ImportarExame () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string Import(string XML)
    {
        resultadoExames ResultadoExames = new resultadoExames();
        exameBO oExameBO = new exameBO();
        try
        {
            exameBO_Result oResultado = oExameBO.Import(XML);
            if (oResultado.Status)
            {
                ResultadoExames.NrFicha = oResultado.ID;
            }
            else
            {
                Erro oErro = new Erro();
                ResultadoExames.NrFicha = oResultado.ID;
                oErro.idExame = oResultado.IDE;
                oErro.DscErro = oResultado.Mensage;
                ResultadoExames.Erros.Add(oErro);
            }

        }
        catch (Exception ex)
        {
            Erro oErro = new Erro();
            oErro.idExame = "0";
            oErro.DscErro = ex.Message;
            ResultadoExames.Erros.Add(oErro);
        }
        return ResultadoExames.ToStringXML();
    }

   
}

