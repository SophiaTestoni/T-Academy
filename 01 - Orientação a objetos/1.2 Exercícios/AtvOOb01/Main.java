package AtvOOb01;

import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Main {

	public static ArrayList<Pessoa> dados = new ArrayList<>();

	public static void main(String[] args) {
		
		
		String menu = "1) Cadastrar\n";
			   menu+= "2) Listar\n"; // retornar dados
			   menu+= "3) Pesquisar\n";
			   menu+= "4) Alterar\n";
			   menu+= "5) Remover\n";
			   menu+= "6) Sair\n";
			   
		int opcaoSelecionada = 0;
		
		AcoesPessoa a = new AcoesPessoa();
		
		do {
			
			opcaoSelecionada = Integer.parseInt(JOptionPane.showInputDialog(menu));
			
			switch (opcaoSelecionada) {
			case 1: 
				a.obterDados();
			break;
			
			case 2: 
				a.retornarDados();
			break;
			
			case 3: 
				a.pesquisar();
			break;
			
			case 4:
				
				a.alterar();
			break;
			
			case 5:
				a.remover();
			break;
			
			default:
				JOptionPane.showMessageDialog(null, "Opção inválida");
			}
			
		}while(opcaoSelecionada != 6);
		
			
		
	}

	}