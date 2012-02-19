package lib.mediador.com;

import java.util.List;

public class ecl {

	private List<tabela> tabelas;
	private localDataSourceInformation localServer;
	
	
	public ecl(){
		
	}

	public List<tabela> getTabelas() {
		return tabelas;
	}

	public void setTabelas(List<tabela> tabelas) {
		this.tabelas = tabelas;
	}

	public localDataSourceInformation getLocalServer() {
		return localServer;
	}

	public void setLocalServer(localDataSourceInformation localServer) {
		this.localServer = localServer;
	}
	
	
	
	
}
