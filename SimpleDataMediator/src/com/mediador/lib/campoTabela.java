package com.mediador.lib;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class campoTabela {
	
	private Integer campoTabelaID;
	private String nomeCampoTabela;
	private tipoDado tipoCampoTabela;
	private Integer tamanhoCampo;
	private Boolean pk;
	private Boolean fk;
	
	@Id
	public Integer getCampoTabelaID() {
		return campoTabelaID;
	}
	public void setCampoTabelaID(Integer campoTabelaID) {
		this.campoTabelaID = campoTabelaID;
	}
	public String getNomeCampoTabela() {
		return nomeCampoTabela;
	}
	public void setNomeCampoTabela(String nomeCampoTabela) {
		this.nomeCampoTabela = nomeCampoTabela;
	}

	public tipoDado getTipoCampoTabela() {
		return tipoCampoTabela;
	}
	public void setTipoCampoTabela(tipoDado tipoCampoTabela) {
		this.tipoCampoTabela = tipoCampoTabela;
	}
	
	public Integer getTamanhoCampo() {
		return tamanhoCampo;
	}
	public void setTamanhoCampo(Integer tamanhoCampo) {
		this.tamanhoCampo = tamanhoCampo;
	}
	public Boolean getPk() {
		return pk;
	}
	public void setPk(Boolean pk) {
		this.pk = pk;
	}
	public Boolean getFk() {
		return fk;
	}
	public void setFk(Boolean fk) {
		this.fk = fk;
	}
	
	
	
}
