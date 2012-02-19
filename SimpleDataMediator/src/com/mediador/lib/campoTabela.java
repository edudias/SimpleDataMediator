package com.mediador.lib;

public class campoTabela {
	private String nomeCampoTabela;
	private tipoDado tipoCampoTabela;
	private Integer tamanhoCampo;
	private Boolean pk;
	private Boolean fk;
	
	public campoTabela(){
		
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
