package atvJSP;

public class Usuario {
   public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPermissao() {
		return permissao;
	}
	public void setPermissao(int permissao) {
		this.permissao = permissao;
	}
	
	public String getDadosParaSessao() {
		return this.getEmail() + "," + this.getPermissao();
	}
	
	private int codigo;
	private String email;
	private int permissao;
}
