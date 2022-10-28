function valida(){
	//obter nome e idade
	let nome = document.getElementById("nome").value;
	let idade = parseInt(document.getElementById("idade").value);
	
	//Condicional
	if(nome = ""){
		
		alert("Informe o nome!")
		return false;
	
	}else if(idade <0 || idade >115){
		
		alert("Idade inválida")
		return false;
		
	}else{
		
		return true;
	}
}