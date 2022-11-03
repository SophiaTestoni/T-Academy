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
	
	
	let mensagem = document.getElementById("mensagem").value;
	
	//Condicional
	
	if(mensagem == ""){
		
		alert("Informe a mensagem")
		return false;
		
	}
		return true;
}

	
	
	
	
