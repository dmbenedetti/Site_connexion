using System;
using System.Collections.Generic;
using System.Web;
using HAssuncao.Models;
using HAssuncao.DataAccess;
using System.Configuration;
using System.Text;
using System.Data;


namespace HAssuncao.Business
{
    public class PlanoBL
    {
        #region Métodos
        public  List<Planos> ListarPlano()
        {
            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.ListarPlano();
        }

        public List<Planos> ObterListaPlanoTipoAtendimento(string sConvenio)
        {
            if (sConvenio.Equals("Selecione um convênio"))
            {
                List<Planos> lista= new List<Planos>();
                return lista;
            }
            else 
            {
                
                PlanoDAL planoDAL = new PlanoDAL();
                return planoDAL.ObterListaPlanoTipoAtendimento(sConvenio);

            
            }


        
        }

        public List<Planos> TrocaLinhaColunaFrontEnd()
        {
            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.TrocaLinhaColunaFrontEnd();
        }

        public int InserirPlano(int StatusAmbulatorio,int StatusExames, int statusHosp, int statusPS, int statusMat, int codConvenio, int CodTipoAmb,int CodTipoExames, int CodTipoHosp, int CodTipoMat, int CodTipoPS, string descricao)
        {

            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.InserirPlano(StatusAmbulatorio, StatusExames, statusHosp, statusPS, statusMat, codConvenio, CodTipoAmb, CodTipoExames, CodTipoHosp, CodTipoMat, CodTipoPS, descricao);


        }

        public int EliminarPlano(int codTipo, int codConvenio, int codPlano)
        {
            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.EliminarPlano(codTipo, codConvenio, codPlano);
        }

        public List<Convenios> CarregarConvenio()
        {
            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.CarregarConvenio();
        }

        public int AlterarPlano(int codPlano, int StatusAmbulatorio,int StatusExames, int statusHosp, int statusMat, int statusPS, int codConvenio, int CodTipoAmb,int CodTipoExames, int CodTipoHosp, int CodTipoMat, int CodTipoPS, string descricao)
        {
            PlanoDAL planoDAL = new PlanoDAL();
            // return planoDAL.InserirPlano(StatusAmbulatorio,statusHosp,statusMaternidade,statusPS,codConvenio,descricao);
            return planoDAL.AlterarPlano(codPlano, StatusAmbulatorio,StatusExames, statusHosp, statusMat, statusPS, codConvenio, CodTipoAmb,CodTipoExames, CodTipoHosp, CodTipoMat, CodTipoPS, descricao);


        }

        public List<Planos> CarregaPlanos(string titulo)
        {
            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.CarregaPlanos(titulo);
        }

        public  List<TiposAtendimentos> CarregarTipoAtendimento()
        {
            PlanoDAL planoDAL = new PlanoDAL();
            return planoDAL.CarregarTipoAtendimento();
        }
        #endregion
    }
}