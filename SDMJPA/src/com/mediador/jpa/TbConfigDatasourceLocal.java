package com.mediador.jpa;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tb_config_datasource_local database table.
 * 
 */
@Entity
@Table(name="tb_config_datasource_local")
public class TbConfigDatasourceLocal implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="TB_CONFIG_DATASOURCE_LOCAL_IDCONFIGDATASOURCELOCAL_GENERATOR", sequenceName="TB_CONFIG_DATASOURCE_LOCAL")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TB_CONFIG_DATASOURCE_LOCAL_IDCONFIGDATASOURCELOCAL_GENERATOR")
	@Column(name="id_config_datasource_local")
	private long idConfigDatasourceLocal;

	private String connectionstring;

	private String password;

	private String server;

	private int timeout;

	private String username;

    public TbConfigDatasourceLocal() {
    }

	public long getIdConfigDatasourceLocal() {
		return this.idConfigDatasourceLocal;
	}

	public void setIdConfigDatasourceLocal(long idConfigDatasourceLocal) {
		this.idConfigDatasourceLocal = idConfigDatasourceLocal;
	}

	public String getConnectionstring() {
		return this.connectionstring;
	}

	public void setConnectionstring(String connectionstring) {
		this.connectionstring = connectionstring;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getServer() {
		return this.server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public int getTimeout() {
		return this.timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}