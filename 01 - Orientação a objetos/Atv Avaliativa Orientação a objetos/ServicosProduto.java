package AtvAvaliativaF;

import javax.swing.JOptionPane;

// Classe ServicoProduto implementando a interface de PadraoProduto
public class ServicosProduto implements PadraoProduto {

// Validação para verificar se um produto existe dentro da lista
public boolean existeProduto(String produto) {
		
		for(int i=0; i<Main.produtos.size(); i++) {
			if(Main.produtos.get(i).getNome().equals(produto)) {
				return true;
			}
		}
		return false;
	}

// Estrutura para atualizar o nome de um produto na lista 
    public boolean Atualizar(String produtoAntigo, Produto produtoNovo){
    	System.out.println(produtoAntigo);
    	System.out.println(produtoNovo.getNome());
    	for(int i=0; i<Main.produtos.size(); i++) {
			if(Main.produtos.get(i).getNome().equals(produtoAntigo)) {
				
				Produto p = new Produto();
				p.setNome(produtoNovo.getNome());
				
				Main.produtos.set(i, p);
			}
		}
		
		return true;
    }
 // Estrutura de verificação se o produto é unico na lista
    public boolean EhUnica(String Produto){
        for (int i = 0; i < Main.produtos.size(); i++){
            if (Main.produtos.get(i).getNome().equals(Produto)){
                return true;
            }
        }
        return false;
    }

// Estrutura para excluir produtos numa lista
    public boolean Excluir(String Produto)  {
        boolean excluiu = false;
        for (int i = 0; i < Main.produtos.size(); i++) {
            if (Main.produtos.get(i).getNome().equals(Produto)) {
                Main.produtos.remove(i);
                excluiu = true;
                break;
            }
        }
        return excluiu;
    }

 // Incluindo um produto na lista
    public boolean Inserir(Produto p) {
        if (this.EhUnica(p.getNome())){
            return false;
        }
        p.setNome(p.getNome().toUpperCase()); 
        
        Main.produtos.add(p);
        return true;
    }
 //Estrutura para chamar a lista de produtos
    	public String ListaP() {
    	String msg = "";
		for(int i = 0; i < Main.produtos.size(); i++) {
			
			msg+=Main.produtos.get(i).getNome() + "\n";
		}
    
		return msg;
    	}
    	
// Estrutura para calcular o desconto de um produto chamado as camadas do polimorfismo    
  public double CalcularDescontoProduto(String nome) {
	  for (int i = 0; i < Main.produtos.size(); i++){
	  	if (Main.produtos.get(i).getNome().equals(nome)){
            double preco = Main.produtos.get(i).getPreco();
            return _desconto.CalcularDesconto(preco);
        }
  }
    		return 0;
    	}
  
//Estrutura do Desconto (o polimorfismo)
  private Desconto _desconto;
  public ServicosProduto(Desconto desconto) {
	  this._desconto = desconto;
}
 // Estrutura que pesquisa os produtos
    public String ListaPesquisa(Produto pesquisa) {
    
    	String estrutura = "";
    	
    for(int i = 0; i < Main.produtos.size(); i++) {
		if(Main.produtos.get(i).getNome().contains(pesquisa.getNome())){
		estrutura+="\n" + Main.produtos.get(i).getNome();
	}
   }
	return estrutura == "" ? "Produto não encontrado" : estrutura;
	
    }
}

