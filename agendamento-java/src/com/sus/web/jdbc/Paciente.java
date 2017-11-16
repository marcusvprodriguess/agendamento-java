package com.sus.web.jdbc;

public class Paciente {

	/*cd_Paciente INT NOT NULL auto_increment,
    sg_Estado CHAR(2),
    nm_Paciente VARCHAR(50),
    cd_CPF INT(11),
    cd_RG INT(11),
    ds_Endereco VARCHAR(50),
    nm_Cidade VARCHAR(20),
    nm_Bairro VARCHAR(20),
    cd_Telefone VARCHAR(20),
    ds_Email VARCHAR(50),
    dt_Nascimento DATE,
    PRIMARY KEY (cd_Paciente),
	FOREIGN KEY (sg_Estado) REFERENCES Estado(sg_Estado)
	*/
	
	private int codPaciente;
	private String nomePaciente;
	private int rgPaciente;
	private int cpfPaciente;
	private String enderecoPaciente;
	private int cidadePaciente;
	private String bairroPaciente;
	private String estadoPaciente;
	private String emailPaciente;
	private String telefonePaciente;
	private String datanascPaciente;	
	
	
	public Paciente(int codPaciente, String nomePaciente, int rgPaciente, int cpfPaciente, 
			String enderecoPaciente, int cidadePaciente, String bairroPaciente, String estadoPaciente,
			String emailPaciente, String telefonePaciente, String  datanascPaciente) {
		this.codPaciente = codPaciente;
		this.nomePaciente = nomePaciente;
		this.rgPaciente = rgPaciente;
		this.cpfPaciente = cpfPaciente;
		this.enderecoPaciente = enderecoPaciente;
		this.cidadePaciente = cidadePaciente;
		this.bairroPaciente = bairroPaciente;
		this.estadoPaciente = estadoPaciente;
		this.emailPaciente = emailPaciente;
		this.telefonePaciente = telefonePaciente;
		this.datanascPaciente = datanascPaciente;
	}
	
	public Paciente(String nomePaciente, int rgPaciente, int cpfPaciente, 
			String enderecoPaciente, int cidadePaciente, String bairroPaciente, String estadoPaciente,
			String emailPaciente, String telefonePaciente, String  datanascPaciente) {

		this.nomePaciente = nomePaciente;
		this.rgPaciente = rgPaciente;
		this.cpfPaciente = cpfPaciente;
		this.enderecoPaciente = enderecoPaciente;
		this.cidadePaciente = cidadePaciente;
		this.bairroPaciente = bairroPaciente;
		this.estadoPaciente = estadoPaciente;
		this.emailPaciente = emailPaciente;
		this.telefonePaciente = telefonePaciente;
		this.datanascPaciente = datanascPaciente;
	}

	/*public Paciente(int id, int codPaciente, String nomePaciente) {
		this.id = id;
		this.codPaciente = codPaciente;
		this.nomePaciente = nomePaciente;
	}*/

	
	
	
	public int getCodPaciente() {
		return codPaciente;
	}

	public void setCodPaciente(int codPaciente) {
		this.codPaciente = codPaciente;
	}

	public String getNomePaciente() {
		return nomePaciente;
	}

	public void setNomePaciente(String nomePaciente) {
		this.nomePaciente = nomePaciente;
	}

	public int getRgPaciente() {
		return rgPaciente;
	}

	public void setRgPaciente(int rgPaciente) {
		this.rgPaciente = rgPaciente;
	}

	public int getCpfPaciente() {
		return cpfPaciente;
	}

	public void setCpfPaciente(int cpfPaciente) {
		this.cpfPaciente = cpfPaciente;
	}

	public String getEnderecoPaciente() {
		return enderecoPaciente;
	}

	public void setEnderecoPaciente(String enderecoPaciente) {
		this.enderecoPaciente = enderecoPaciente;
	}

	public int getCidadePaciente() {
		return cidadePaciente;
	}

	public void setCidadePaciente(int cidadePaciente) {
		this.cidadePaciente = cidadePaciente;
	}

	public String getBairroPaciente() {
		return bairroPaciente;
	}

	public void setBairroPaciente(String bairroPaciente) {
		this.bairroPaciente = bairroPaciente;
	}

	public String getEstadoPaciente() {
		return estadoPaciente;
	}

	public void setEstadoPaciente(String estadoPaciente) {
		this.estadoPaciente = estadoPaciente;
	}

	public String getEmailPaciente() {
		return emailPaciente;
	}

	public void setEmailPaciente(String emailPaciente) {
		this.emailPaciente = emailPaciente;
	}

	public String getTelefonePaciente() {
		return telefonePaciente;
	}

	public void setTelefonePaciente(String telefonePaciente) {
		this.telefonePaciente = telefonePaciente;
	}

	public String getDatanascPaciente() {
		return datanascPaciente;
	}

	public void setDatanascPaciente(String datanascPaciente) {
		this.datanascPaciente = datanascPaciente;
	}

	@Override
	public String toString() {
		return "Paciente [codPaciente=" + codPaciente + ", nomePaciente=" + nomePaciente + ", rgPaciente=" + rgPaciente
				+ ", cpfPaciente=" + cpfPaciente + ", enderecoPaciente=" + enderecoPaciente + ", cidadePaciente="
				+ cidadePaciente + ", bairroPaciente=" + bairroPaciente + ", estadoPaciente=" + estadoPaciente
				+ ", emailPaciente=" + emailPaciente + ", telefonePaciente=" + telefonePaciente + ", datanascPaciente="
				+ datanascPaciente + "]";
	}	
}
