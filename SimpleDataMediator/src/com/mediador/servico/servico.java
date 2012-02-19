package com.mediador.servico;

import com.mediador.sqlparse.*;

public class servico {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		String sqlstatement = "Select nome, endereco, idade from clientes, pessoa where nome = 'eduardo'";
		
		sqlparse.sqlStatement = sqlstatement;
		System.out.println(sqlparse.checkSQL());
		
		
		for (String coluna : sqlparse.getColumns()) {
			System.out.println(coluna);
		}
		
		for (String tabela : sqlparse.getTables()) {
			System.out.println(tabela);
		}

	}

}
