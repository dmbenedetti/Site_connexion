using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for exame_ficha
/// </summary>
public class exame_ficha
{
	public exame_ficha()
	{
	}
    private int _id_exame_ficha;
    private int? _nu_cliente;
    private int? _nu_internacao;
    private int? _nu_requisicao;
    private int? _nu_unidade;
    private int? _id_exame_cliente;
    private int? _nu_ficha;
    private int? _nu_prontuario;


    public int id_exame_ficha { get { return _id_exame_ficha; } set { _id_exame_ficha = value; } }
    public int? nu_cliente { get { return _nu_cliente; } set { _nu_cliente = value; } }
    public int? nu_internacao { get { return _nu_internacao; } set { _nu_internacao = value; } }
    public int? nu_requisicao { get { return _nu_requisicao; } set { _nu_requisicao = value; } }
    public int? nu_unidade { get { return _nu_unidade; } set { _nu_unidade = value; } }
    public int? id_exame_cliente { get { return _id_exame_cliente; } set { _id_exame_cliente = value; } }
    public int? nu_ficha { get { return _nu_ficha; } set { _nu_ficha = value; } }
    public int? nu_prontuario { get { return _nu_prontuario; } set { _nu_prontuario = value; } }
}
