package com.mediador.lib;

public class tipoDado {

	private type nomeTipoDado;
	
	
	public tipoDado() {
		// TODO Auto-generated constructor stub
	}
	
	public tipoDado(type nomeTipoDado) {
		this.nomeTipoDado = nomeTipoDado;
		
	}
	
	public type getNomeTipoDado(){
		return this.nomeTipoDado;
	}

	public void setNomeTipoDado(type nomeTipoDado){
		this.nomeTipoDado = nomeTipoDado;
		//in
	}	
}


