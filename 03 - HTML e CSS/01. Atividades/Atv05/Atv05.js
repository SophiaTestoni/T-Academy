function euroToReal(){
  let valor = document.getElementById("valor");
  valor = parseFloat(valor.value) * 5.23;
  alert(valor.toFixed(2));
}

function realToEuro(){
  let valor = document.getElementById("valor");
  valor = parseFloat(valor.value) / 5.23;
  alert(valor.toFixed(2));
}

function libraToReal(){
  let valor = document.getElementById("valor");
  valor = parseFloat(valor.value)* 5.97;
  alert(valor.toFixed(2));
}

function realToLibra(){
  let valor = document.getElementById("valor");
  valor = parseFloat(valor.value)/ 5.97;
  alert(valor.toFixed(2));
}

function dolarToReal(){
  let valor = document.getElementById("valor");
  valor = parseFloat(valor.value)* 5.30;
  alert(valor.toFixed(2));
}

function realtoDolar(){
  let valor = document.getElementById("valor");
  valor = parseFloat(valor.value) / 5.30;
  alert(valor.toFixed(2));
}