package AtvAvaliativaF;

import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Main {

	public static ArrayList<Marca> marcas = new ArrayList<>();
	public static ArrayList<Produto> produtos = new ArrayList<>();
	

	public static void main(String[] args) {
		
		ServicosMarca a = new ServicosMarca();
		Produto novoP = new Produto();
	
//Quando cadastrar um SAMSUNG, o produto terá desconto;Caso queira mudar para 30% de desconto passa para: 
//new Desconto30PorCento() que implementa os mesmos dados da interface de Desconto.
		ServicosProduto svc = new ServicosProduto(new Desconto10PorCento());
        svc.CalcularDescontoProduto("Samsung");
		int opcaoSelecionada = 0;
	
// Inicio do menu, vai selecionar em qual modalidade gostaria de mexer: marcas, produtos ou sair do sistema.
		do {
		   String menuMP = "1) Marcas:\n"; 
		   menuMP+= "2) Produtos:\n";
		   menuMP+= "3) Sair do sistema:\n";
		   opcaoSelecionada = Integer.parseInt(JOptionPane.showInputDialog("O que gostaria de visualizar?\n" + menuMP));
		   
// Selecionando a opção 1) Marcas, abre o menu da marca para suas ações.
		   if(opcaoSelecionada == 1) {
			   
			   do {
					
				   String menuM = "1) Cadastrar marca(s):\n"; 
				   menuM+= "2) Visualizar marca(s) cadastrada(s):\n"; 
				   menuM+= "3) Alterar marca(s):\n";	
				   menuM+= "4) Remover marca(s):\n";
				   menuM+= "5) Sair de marca(s).";
				   
				   int opcaoSelecionadaMarca = Integer.parseInt(JOptionPane.showInputDialog(menuM));
				   switch(opcaoSelecionadaMarca) {
				   
// Case 1 para cadastrar uma nova marca
				   case 1:
					   Marca m = new Marca();
					   m.setNome(JOptionPane.showInputDialog("Informe o nome da marca"));
					   
					   boolean retornoCadastroMarca = a.Inserir(m);
					   
					   JOptionPane.showMessageDialog(null, retornoCadastroMarca ? "Marca cadastrada com sucesso!" : "Falha ao cadastrar");
					   break;
					   
// Case 2 para listar as marcas cadastradas.		   
				   case 2:

					   JOptionPane.showMessageDialog(null,a.ListaM());
					   break;
					   
// Case 3 para alterar uma das marcas cadastradas.
				   case 3:
					   
					   String marca_existente, nova_marca;
					   
// Verificando se a marca que deseja ser alterada existe.
					   do {
						   marca_existente =  JOptionPane.showInputDialog("Informe o nome da marca que deseja alterar").toUpperCase();
	
						   if(!a.existeMarca(marca_existente)) {
							   JOptionPane.showMessageDialog(null, "A marca informada não foi encontrada, tente novamente!");
						   }else {
							   break;
						   }
					   }while(true);
					   

// Obtendo o novo nome da marca depois da validação de existência.
					   do {
						   nova_marca =  JOptionPane.showInputDialog("Informe o novo nome da marca").toUpperCase();
	
						   if(a.existeMarca(nova_marca)) {
							   JOptionPane.showMessageDialog(null, "Marca alterada com sucesso!");
						   }else {
							   break;
						   }
					   }while(true);
					   
// Atualizando a marca para o novo nome informado.
					   a.Atualizar(marca_existente, nova_marca);
					   break;
					   
// Case 4 para excluir uma marca existente.
				   case 4:

					   String marca_excluir;
					   String mensagem2 = "Não foi possível excluir";
					   String mensagem1 = "Marca excluída com sucesso";
					   
// Verificando se a marca que deseja ser excluida existe
				
						   marca_excluir =  JOptionPane.showInputDialog("Informe o nome da marca que deseja excluir").toUpperCase();
						   
						   boolean funcionou = a.Excluir(marca_excluir);
						   
						   if(funcionou) {
							   
							   JOptionPane.showMessageDialog(null, mensagem1);
							   
						   } else
							   
							   JOptionPane.showMessageDialog(null, mensagem2);
				   }
// Caso opte pela opção 5, irá sair do menu de marcas e retornar para o menu de seleção (marcas e produtos).				   
				   if(opcaoSelecionadaMarca == 5) {
					   break;
				   }
			   }while(true);
// Aqui inicia o menu de produtos   
		   } else if(opcaoSelecionada == 2){
			   
// Que irá executar o menu de opções, igual de marcas
			  do {
			   String menuP = "1) Cadastrar produto(s):\n"; 
			   menuP+= "2) Visualizar produto(s) cadastrados:\n"; 
			   menuP+= "3) Alterar produto(s):\n";	
			   menuP+= "4) Remover produto(s):\n";
			   menuP+= "5) Pesquisa de produto(s):\n";
			   menuP+= "6) Sair de produto(s)."; 
			   
			   int opcaoSelecionadaProduto = Integer.parseInt(JOptionPane.showInputDialog(menuP));
			   switch(opcaoSelecionadaProduto) {
			   
// Caso 1 cadastrando novos produtos
			   case 1:
				   Produto p = new Produto();
				   p.setNome(JOptionPane.showInputDialog("Informe o nome do produto").toUpperCase());
				   
				  boolean retornoCadastroProduto = svc.Inserir(p);
				  
// Validando o retorno				   			
				   JOptionPane.showMessageDialog(null, retornoCadastroProduto ? "Produto cadastrado com sucesso!" : "Falha ao cadastrar");
				   break;
//Case 2 para listar os produtos cadastrados			   
			   case 2:
				   
				   JOptionPane.showMessageDialog(null,svc.ListaP());
				   break;
				   
// Case 3 para atualizar o nome de um produto existente			   
			   case 3:
				  
				    String produto_existente, novo_produto;
				    		
// Verificando se o produto que deseja ser alterado existe
				   do {
					   produto_existente =  JOptionPane.showInputDialog("Informe o nome do produto que deseja alterar").toUpperCase();

					   if(!svc.existeProduto(produto_existente)) {
						   JOptionPane.showMessageDialog(null, "O produto informado não foi encontrada, tente novamente!");
					   }else {
						   break;
					   }
				   }while(true);
				   	
// Obtendo o novo nome do novo produto
				   do {
					   novo_produto =  JOptionPane.showInputDialog("Informe o novo nome do produto").toUpperCase();

					   if(svc.existeProduto(novo_produto)) {
						   JOptionPane.showMessageDialog(null, "Produto alterado com sucesso!");
					   }else {
						   break;
					   }
				   }while(true);
				  
// Atualizando o nome do novo produto
				   novoP.setNome(novo_produto); 
				   svc.Atualizar(produto_existente,novoP);
				  break;
				  
// Case 4 para excluir um produto existente	   
		   case 4:
			   
			   Produto excluiu = new Produto();
			   String produto_excluir;
			   String mensagem2 = "Não foi possível excluir";
			   String mensagem1 = "Produto excluído com sucesso";
			   
// Verificando se o produto que deseja ser excluido existe.

			   produto_excluir =  JOptionPane.showInputDialog("Informe o nome do produto que deseja excluir").toUpperCase();
				   
			   	excluiu.setNome(produto_excluir);
			   	 boolean funcionou = svc.Excluir(produto_excluir);
			   	 
// Validando as respostas (se foi possível excluir ou não).	   
				   if(funcionou) {
					   JOptionPane.showMessageDialog(null, mensagem1);
					   
				   } else					  
					   JOptionPane.showMessageDialog(null, mensagem2);
					   break;
					   
		   case 5: 
			   Produto p2 = new Produto();
			   p2.setNome(JOptionPane.showInputDialog("Informe o nome do produto").toUpperCase());
			   
			   JOptionPane.showMessageDialog(null, svc.ListaPesquisa(p2));
			   
			   }
//Caso opte pela opção 6, irá sair do menu de produtos e retornar para o menu de seleção (marcas e produtos).	
			   if(opcaoSelecionadaProduto == 6) {
				   break;
			   } 
			} while (true);
// Caso selecione a opção 3 no menu de seleção, irá sair do sistema 
		   } else if(opcaoSelecionada == 3){
			   break;
			   
// Caso selecione uma opção maior que 3 irá pedir para inserir uma opção válida
		   } else if (opcaoSelecionada > 3) {
			   
			 String mensagem = "Insira uma opção válida";
			 JOptionPane.showMessageDialog(null, mensagem);
			  break; 
		   }
		
		}while(true);
		
	}
}


