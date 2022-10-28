package AtvAvaliativaF;

//Padrão para implementar no ServicosProduto

public interface PadraoProduto {
	        boolean Inserir(Produto m);
	        boolean Atualizar(String produtoAntigo, Produto produtoNovo);
	        boolean Excluir(String produto);
	        boolean EhUnica(String produto);
	        double CalcularDescontoProduto(String nome);
	        String ListaPesquisa(Produto b);
	}


