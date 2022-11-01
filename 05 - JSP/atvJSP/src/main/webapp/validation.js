function validaPostagem(){

	let titulo = document.getElementById("titulo").value;
	let subtitulo = document.getElementById("subtitulo").value;
	
	//Condicional
	if(titulo == ""){
		
		alert("Informe o título!")
		return false;
	
	}else if(subtitulo == ""){
		
		alert("Informe o subtitulo")
		return false;
		
	}else{
		
		return true;
	}
}

function validaComentario(){
	
	let nome = document.getElementById("nome").value;
	let mensagem = document.getElementById("mensagem").value;
	
	//Condicional
	if(nome == ""){
		
		alert("Informe o seu nome!")
		return false;
	
	}else if(mensagem == ""){
		
		alert("Informe a mensagem")
		return false;
		
	}else{
		
		return true;
	}
}

	
	
	
	
