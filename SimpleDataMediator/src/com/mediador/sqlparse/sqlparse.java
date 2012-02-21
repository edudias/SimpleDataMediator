package com.mediador.sqlparse;

import java.util.ArrayList;
import java.util.List;
import gudusoft.gsqlparser.EDbVendor;
import gudusoft.gsqlparser.TGSqlParser;
import gudusoft.gsqlparser.nodes.TResultColumnList;
import gudusoft.gsqlparser.stmt.TSelectSqlStatement;


public class sqlparse {

	public static String sqlStatement;
	public static String error;	
	private static TGSqlParser parser = new TGSqlParser(EDbVendor.dbvmssql);
	private static TSelectSqlStatement select;
	private static TResultColumnList columns;
	
	static public boolean checkSQL(){
		parser.sqltext = sqlStatement;
		int i = parser.parse();
		if (i != 0){			
			error = parser.getErrormessage().toString();
			return false;
		}
		return true;
	}
	
	static public List<String> getColumns(){
		if (checkSQL() == false){
			return null;	
		}
		
		try{ 
			select = (TSelectSqlStatement)parser.sqlstatements.get(0);
			columns = select.getResultColumnList();
			
			List<String> listColumns = new  ArrayList<String>();
			for(int i = 0; i < columns.size();i++){
				listColumns.add(columns.getResultColumn(i).toString()); // pode-se usar também getExpr ou getAliasClause
	        }
			
			return listColumns;
		}
		catch (Exception e) {
			error = e.getMessage().toString();
			return null;
		}				
	}
	
	static public List<String> getTables(){
		if (checkSQL() == false){
			return null;	
		}
		
		try{
			select = (TSelectSqlStatement)parser.sqlstatements.get(0);
			List<String> listTables = new  ArrayList<String>();
			
			for(int i=0; i < select.tables.size();i++){
				listTables.add(select.tables.getTable(i).getTableName().toString());
			}
			
			return listTables;
			
		}
		catch (Exception e) {
			error = e.getMessage().toString();
			return null;
		}
				
	}

	

}
