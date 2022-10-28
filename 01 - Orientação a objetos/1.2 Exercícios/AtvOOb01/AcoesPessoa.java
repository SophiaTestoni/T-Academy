package AtvOOb01;

import javax.swing.JOptionPane;

import Atv02Math.Atv02;

	public class AcoesPessoa implements Padrao{
	
	
	//obter os dados
	public void obterDados() {
		
		Pessoa p = new Pessoa();
		p.setNome(JOptionPane.showInputDialog("Infome o nome:"));
		p.setEmail(JOptionPane.showInputDialog("Infome o email:"));
		p.setTelefone(JOptionPane.showInputDialog("Infome o telefone:"));
		
		Main.dados.add(p);
		
	}
	
	// metodo para retornar os dados
	public void retornarDados() {	
		for(int i = 0; i < Main.dados.size(); i++) {
			
				System.out.println("Nome: " + Main.dados.get(i).getNome());
				System.out.println("E-mail: " + Main.dados.get(i).getEmail());
				System.out.println("Telefone: " + Main.dados.get(i).getTelefone());
				System.out.println("-------------------");
			
		}
	}
	
	public void pesquisar() {
		String nomePesquisado = JOptionPane.showInputDialog("Informe o nome que deseja pesquisar");
		
		for(int i = 0; i < Main.dados.size(); i++) {
			if(nomePesquisado.equals(Main.dados.get(i).getNome())) {
				System.out.println("Nome: " + Main.dados.get(i).getNome());
				System.out.println("E-mail: " + Main.dados.get(i).getEmail());
				System.out.println("Telefone: " + Main.dados.get(i).getTelefone());
			}
		}
		
	}

	@Override
	public void alterar() {
		String menuAlterar = "1) Nome\n";
		menuAlterar+= "2) Email\n";
		menuAlterar+= "3) Telefone\n";
		menuAlterar+= "4) Retonar\n";
		   
		int opcaoAlterar = 0;
	
		String nomeLista = JOptionPane.showInputDialog("Informe o nome que deseja alterar");
		for(int i = 0; i < Main.dados.size(); i++) {
		 if (nomeLista.equals(Main.dados.get(i).getNome())){
			 	
		opcaoAlterar = Integer.parseInt(JOptionPane.showInputDialog(menuAlterar));
		
		switch (opcaoAlterar) {
		case 1: 
			AtvOOb01.Main.dados.get(i).setNome(JOptionPane.showInputDialog("Qual o novo nome?"));
		break;
		
		case 2: 
			AtvOOb01.Main.dados.get(i).setEmail(JOptionPane.showInputDialog("Qual o novo email?"));
		break;
		
		case 3: 
			AtvOOb01.Main.dados.get(i).setTelefone(JOptionPane.showInputDialog("Qual o novo telefone?"));
		break;
		
		case 4: 
			JOptionPane.showMessageDialog(null, "Alteração(ões) concluída(s).");
		break;
		
		default:
			JOptionPane.showMessageDialog(null, "Opção inválida");
		}
		
		
		 }	else {
			 
			 JOptionPane.showMessageDialog(null, "Nome não cadastrado");
		 } 
		 	
		}
	}
	
	@Override
	public void remover() {
		
		String nomeRemover = JOptionPane.showInputDialog("Informe o nome que deseja remover");
		for(int i = 0; i < Main.dados.size(); i++) {
		if (nomeRemover.equals(Main.dados.get(i).getNome())){
			
		AtvOOb01.Main.dados.remove(i);
		 
		}
		else {
			 
			 JOptionPane.showMessageDialog(null, "Nome não cadastrado");
		}
	}
	}
	}
	
	
	
	
	
	
	
	