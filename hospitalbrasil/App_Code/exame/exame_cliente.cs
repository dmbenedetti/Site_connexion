using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for exame_cliente
/// </summary>
public class exame_cliente
{
	public exame_cliente()
	{
	}

    private int _id_exame_cliente;
    private string _ds_nome;
    private DateTime? _dt_nascimento;
    private int? _id_identificacao;

    public int id_exame_cliente { get { return _id_exame_cliente; } set { _id_exame_cliente = value; } }
    public string ds_nome { get { return _ds_nome; } set { _ds_nome = value; } }
    public DateTime? dt_nascimento { get { return _dt_nascimento; } set { _dt_nascimento = value; } }
    public int? id_identificacao { get { return _id_identificacao; } set { _id_identificacao = value; } }

}
