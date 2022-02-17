using System;
using System.Collections.Generic;
using System.Web;
namespace HBrasil.Models
{
    /// <summary>
    /// Summary description for Planos
    /// </summary>
    public class Planos :  Convenios
    {
        public int CodPlano { get; set; }
        public string DescPlano { get; set; }
        public int CodTipo { get; set; }
        public string DescTipoAtendimento { get; set; }
        public Boolean Status { get; set; }
        public int Ambulatorio { get; set; }
        public int Exames { get; set; }
        public int Hospital { get; set; }
        public int Maternidade { get; set; }
        public int PS { get; set; }
        public string DescAmbulatorio { get; set; }
        public string DescExames { get; set; }
        public string DescHospital { get; set; }
        public string DescMaternidade { get; set; }
        public string DescPS { get; set; }
        public string Spot { get; set; }


    }
}