﻿using System;
using System.Collections.Generic;
using System.Web;
using HAssuncao.Models;
using HAssuncao.DataAccess;
using System.Configuration;
using System.Text;
using System.Data;



namespace HAssuncao.Business
{
    public class ConvenioBL
    {

        #region Métodos
            public static List<Convenios> ListarConvenio()
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.ListarConvenio();
            }

            public static int InserirConvenio(string descricao)
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.InserirConvenio(descricao);
            }
            public static int AlterarConvenio(int codConvenio, string descricao)
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.AlterarConvenio(codConvenio, descricao);
            }
            public static int EliminarConvenio(int codConvenio)
            {
                ConvenioDAL convenioDAL = new ConvenioDAL();
                return convenioDAL.EliminarConvenio(codConvenio);
            }
        #endregion
    }
}