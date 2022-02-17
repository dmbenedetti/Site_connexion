using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for exame_profissional_saude
/// </summary>
public class exame_profissional_saude
{
	public exame_profissional_saude()
	{
	}

    private int _id_exame_profissional_saude;
    private int _nu_registro;
    private string _ds_nome;
    private string _id_estado;
    private string _ds_tipo_conselho;

    public int id_exame_profissional_saude { get { return _id_exame_profissional_saude; } set { _id_exame_profissional_saude = value; } }
    public int nu_registro { get { return _nu_registro; } set { _nu_registro = value; } }
    public string ds_nome { get { return _ds_nome; } set { _ds_nome = value; } }
    public string id_estado { get { return _id_estado; } set { _id_estado = value; } }
    public string ds_tipo_conselho { get { return _ds_tipo_conselho; } set { _ds_tipo_conselho = value; } }

}
