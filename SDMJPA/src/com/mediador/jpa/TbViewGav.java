package com.mediador.jpa;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tb_view_gav database table.
 * 
 */
@Entity
@Table(name="tb_view_gav")
public class TbViewGav implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="TB_VIEW_GAV_IDVIEWGAV_GENERATOR", sequenceName="TB_VIEW_GAV")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TB_VIEW_GAV_IDVIEWGAV_GENERATOR")
	@Column(name="id_view_gav")
	private long idViewGav;

	@Column(name="sql_view")
	private String sqlView;

	//bi-directional many-to-one association to TbEntidadeGlobal
    @ManyToOne
	@JoinColumn(name="id_entidade_global")
	private TbEntidadeGlobal tbEntidadeGlobal;

    public TbViewGav() {
    }

	public long getIdViewGav() {
		return this.idViewGav;
	}

	public void setIdViewGav(long idViewGav) {
		this.idViewGav = idViewGav;
	}

	public String getSqlView() {
		return this.sqlView;
	}

	public void setSqlView(String sqlView) {
		this.sqlView = sqlView;
	}

	public TbEntidadeGlobal getTbEntidadeGlobal() {
		return this.tbEntidadeGlobal;
	}

	public void setTbEntidadeGlobal(TbEntidadeGlobal tbEntidadeGlobal) {
		this.tbEntidadeGlobal = tbEntidadeGlobal;
	}
	
}