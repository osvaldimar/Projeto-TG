package br.com.vemev.modelo;


public class MembroUserWeb {

	private Membro membro;	
	private TipoAcessoLogin acesso;
	public final static String MEMBRO_SESSION = "membroSession";
	
	public enum TipoAcessoLogin{
		LIDER_ACESSO, MEMBRO_ACESSO;
	}
	    
	public MembroUserWeb(){
		
	}

	public Membro getMembro() {
		return membro;
	}

	public void setMembro(Membro membro) {
		this.membro = membro;
	}

	public TipoAcessoLogin getAcesso() {
		return acesso;
	}

	public void setAcesso(TipoAcessoLogin acesso) {
		this.acesso = acesso;
	}
	
}
