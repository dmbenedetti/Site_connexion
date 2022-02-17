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
    public class TipoAtendimentoBL
    {
        #region Métodos
        public List<TiposAtendimentos> ListarTipoAtendimento()
        {
            TipoAtendimentoDAL tipoAtendimentoDAL = new TipoAtendimentoDAL();
            return tipoAtendimentoDAL.ListarTipoAtendimento();
        }

        public int InserirTipoAtendimento(string descricao)
        {
            TipoAtendimentoDAL tipoAtendimentoDAL = new TipoAtendimentoDAL();
            return tipoAtendimentoDAL.InserirTipoAtendimento(descricao);
        }
        public int AlterarTipoAtendimento(string descricao, int codTipoAtendimento)
        {
            TipoAtendimentoDAL tipoAtendimentoDAL = new TipoAtendimentoDAL();
            return tipoAtendimentoDAL.AlterarTipoAtendimento(descricao, codTipoAtendimento);
        }
        public int EliminarTipoAtendimento(int codTipoAtendimento)
        {
            TipoAtendimentoDAL tipoAtendimentoDAL = new TipoAtendimentoDAL();
            return tipoAtendimentoDAL.EliminarTipoAtendimento(codTipoAtendimento);
        }
        public int SelecionarTipoAtendimento(string descricao)
        {
            TipoAtendimentoDAL tipoAtendimentoDAL = new TipoAtendimentoDAL();
            return tipoAtendimentoDAL.SelecionarTipoAtendimento(descricao);
        }
        #endregion
    }
}