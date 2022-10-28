package AtvAvaliativaF;


// Padrão para implementar no ServicosMarca

public interface PadraoMarca { 
	

	 boolean Inserir(Marca m);
     boolean Atualizar(String marcaAntiga, String marcaNova);
     boolean Excluir(String marca);
     boolean EhUnica(String marca);

}
