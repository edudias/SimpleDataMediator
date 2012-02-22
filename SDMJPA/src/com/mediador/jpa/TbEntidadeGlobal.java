package com.mediador.jpa;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the tb_entidade_global database table.
 * 
 */
@Entity
@Table(name="tb_entidade_global")
public class TbEntidadeGlobal implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="TB_ENTIDADE_GLOBAL_IDENTIDADEGLOBAL_GENERATOR", sequenceName="TB_ENTIDADE_GLOBAL")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TB_ENTIDADE_GLOBAL_IDENTIDADEGLOBAL_GENERATOR")
	@Column(name="id_entidade_global")
	private long idEntidadeGlobal;

	@Column(name="nome_entidade_global")
	private String nomeEntidadeGlobal;

	//bi-directional many-to-one association to TbViewGav
	@OneToMany(mappedBy="tbEntidadeGlobal")
	private Set<TbViewGav> tbViewGavs;

    public TbEntidadeGlobal() {
    }

	public long getIdEntidadeGlobal() {
		return this.idEntidadeGlobal;
	}

	public void setIdEntidadeGlobal(long idEntidadeGlobal) {
		this.idEntidadeGlobal = idEntidadeGlobal;
	}

	public String getNomeEntidadeGlobal() {
		return this.nomeEntidadeGlobal;
	}

	public void setNomeEntidadeGlobal(String nomeEntidadeGlobal) {
		this.nomeEntidadeGlobal = nomeEntidadeGlobal;
	}

	public Set<TbViewGav> getTbViewGavs() {
		return this.tbViewGavs;
	}

	public void setTbViewGavs(Set<TbViewGav> tbViewGavs) {
		this.tbViewGavs = tbViewGavs;
	}
	
}