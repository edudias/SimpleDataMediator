package com.mediador.lib;

import java.util.List;

public class tabela {

	private String nomeTabela;
	private List<campoTabela> camposTabela;
	private String viewGAV;
	private String viewLAV;
	
	public tabela(){
		
	}
	
	public String getNomeTabela() {
		return nomeTabela;
	}
	
	public void setNomeTabela(String nomeTabela) {
		this.nomeTabela = nomeTabela;
	}
	
	public List<campoTabela> getCamposTabela() {
		return camposTabela;
	}
	
	public void setCamposTabela(List<campoTabela> camposTabela) {
		this.camposTabela = camposTabela;
	}

	public String getViewGAV() {
		return viewGAV;
	}

	public void setViewGAV(String viewGAV) {
		this.viewGAV = viewGAV;
	}

	public String getViewLAV() {
		return viewLAV;
	}

	public void setViewLAV(String viewLAV) {
		this.viewLAV = viewLAV;
	}
	
	
	
}