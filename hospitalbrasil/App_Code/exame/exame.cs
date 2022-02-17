using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for exame
/// </summary>
public class exame
{
	public exame()
	{
		
	}

    private int _id_exame;
    private int? _id_exame_profissional_saude;
    private string _ds_laudo;
    private string _ds_evolutivo;
    private DateTime? _dt_exame;
    private string _ds_sigla_exame;
    private int? _id_exame_externo;
    private int? _id_exame_ficha;

    public int id_exames { get { return _id_exame; } set { _id_exame = value; } }
    public int? id_exame_profissional_saude { get { return _id_exame_profissional_saude; } set { _id_exame_profissional_saude = value; } }
    public int? id_exame_externo { get { return _id_exame_externo; } set { _id_exame_externo = value; } }
    public int? id_exame_ficha { get { return _id_exame_ficha; } set { _id_exame_ficha = value; } }
    public string ds_laudo { get { return _ds_laudo; } set { _ds_laudo = value; } }
    public string ds_evolutivo { get { return _ds_evolutivo; } set { _ds_evolutivo = value; } }
    public string ds_sigla_exame { get { return _ds_sigla_exame; } set { _ds_sigla_exame = value; } }
    public DateTime? dt_exame { get { return _dt_exame; } set { _dt_exame = value; } }
}
