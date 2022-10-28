package AtvAvaliativaF;

//Classe ServicosMarca implementando a interface de PadraoMarca
public class ServicosMarca implements PadraoMarca {

// Validação para verificar se uma marca existe dentro da lista
	public boolean existeMarca(String marca) {
		for(int i=0; i<Main.marcas.size(); i++) {
			if(Main.marcas.get(i).getNome().equals(marca)) {
				return true;
			}
		}
		
		return false;
	}
// Estrutura para atualizar o nome de uma marca na lista 
	public boolean Atualizar(String marcaAntiga, String marcaNova){
		
		for(int i=0; i<Main.marcas.size(); i++) {
			if(Main.marcas.get(i).getNome().equals(marcaAntiga)) {
				Marca m = new Marca();
				m.setNome(marcaNova);
				
				Main.marcas.set(i, m);
			}
		}
		
		return true;
    }
// Validação se a marca é única na lista
    public boolean EhUnica(String marca) {
        marca = marca.toUpperCase(); 
        for (int i = 0; i < Main.marcas.size(); i++) {
            if (Main.marcas.get(i).getNome().equals(marca)){
                return true;
            }
        }
        return false;
    }
    
// Inicio da estrutura de exclusão de marca
    
    public boolean Excluir(String marca) {
//Não permite excluir uma marca que está vinculada a um produto
    	for (int i = 0; i < Main.produtos.size(); i++) {
            if (Main.produtos.get(i).getMarca().getNome().equals(marca)){
                return false;
            }
        }
    	        
 //Verificando se encontrou a marca a ser excluída 
        boolean excluiu = false;
        
        for (int i = 0; i < Main.marcas.size(); i++) {
            if (Main.marcas.get(i).getNome().equals(marca)){
            	Main.marcas.remove(i);
                excluiu = true;
                break;
            }
        }
        return excluiu;
    }
  
// Criando uma marca:
    public boolean Inserir(Marca m) {
        if (this.EhUnica(m.getNome())) {
            return false;
        }
// Aplicando a validação de carcacteres Validate:   
        if (!Validation.ValidateNomeMarca(m.getNome())){
            return false;
        }
        
//passando tudo para uppercase para não criar uma marca repetida. Ex: SAMSUNG, samsung.
        m.setNome(m.getNome().toUpperCase()); 
        
// Incluindo a marca na lista
        Main.marcas.add(m);
        return true;
    }
    
 //Estrutura para chamar a lista de produtos
    public String ListaM() {
    	String msg = "";
		for(int i = 0; i < Main.marcas.size(); i++) {
			msg+=Main.marcas.get(i).getNome() + "\n";
		}
		return msg;
    }
}
