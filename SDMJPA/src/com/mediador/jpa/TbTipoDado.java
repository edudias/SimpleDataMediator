package com.mediador.jpa;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tb_tipo_dado database table.
 * 
 */
@Entity
@Table(name="tb_tipo_dado")
public class TbTipoDado implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="TB_TIPO_DADO_IDTIPODADO_GENERATOR", sequenceName="TB_TIPO_DADO")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TB_TIPO_DADO_IDTIPODADO_GENERATOR")
	@Column(name="id_tipo_dado")
	private long idTipoDado;

	@Column(name="nome_tipo_dado")
	private String nomeTipoDado;

    public TbTipoDado() {
    }

	public long getIdTipoDado() {
		return this.idTipoDado;
	}

	public void setIdTipoDado(long idTipoDado) {
		this.idTipoDado = idTipoDado;
	}

	public String getNomeTipoDado() {
		return this.nomeTipoDado;
	}

	public void setNomeTipoDado(String nomeTipoDado) {
		this.nomeTipoDado = nomeTipoDado;
	}

}