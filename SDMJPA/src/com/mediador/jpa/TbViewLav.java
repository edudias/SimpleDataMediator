package com.mediador.jpa;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tb_view_lav database table.
 * 
 */
@Entity
@Table(name="tb_view_lav")
public class TbViewLav implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="TB_VIEW_LAV_IDVIEWLAV_GENERATOR", sequenceName="TB_VIEW_LAV")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TB_VIEW_LAV_IDVIEWLAV_GENERATOR")
	@Column(name="id_view_lav")
	private long idViewLav;

	@Column(name="sql_view")
	private String sqlView;

	//bi-directional many-to-one association to TbEntidadeLocal
    @ManyToOne
	@JoinColumn(name="id_entidade_local")
	private TbEntidadeLocal tbEntidadeLocal;

    public TbViewLav() {
    }

	public long getIdViewLav() {
		return this.idViewLav;
	}

	public void setIdViewLav(long idViewLav) {
		this.idViewLav = idViewLav;
	}

	public String getSqlView() {
		return this.sqlView;
	}

	public void setSqlView(String sqlView) {
		this.sqlView = sqlView;
	}

	public TbEntidadeLocal getTbEntidadeLocal() {
		return this.tbEntidadeLocal;
	}

	public void setTbEntidadeLocal(TbEntidadeLocal tbEntidadeLocal) {
		this.tbEntidadeLocal = tbEntidadeLocal;
	}
	
}