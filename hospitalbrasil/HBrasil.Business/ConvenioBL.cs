using System;
using System.Collections.Generic;
using System.Web;
using HBrasil.Models;
using HBrasil.DataAccess;
using System.Configuration;
using System.Text;
using System.Data;



namespace HBrasil.Business
{
    public class ConvenioBL
    {

        #region Métodos
            public static List<Convenios> ListarConvenio()
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.ListarConvenio();
            }

            public static int InserirConvenio(string descricao, string spot)
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.InserirConvenio(descricao, spot);
            }
            public static int AlterarConvenio(int codConvenio, string descricao, string spot)
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.AlterarConvenio(codConvenio, descricao, spot);
            }
            public static int EliminarConvenio(int codConvenio)
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.EliminarConvenio(codConvenio);
            }
        #endregion
    }
}