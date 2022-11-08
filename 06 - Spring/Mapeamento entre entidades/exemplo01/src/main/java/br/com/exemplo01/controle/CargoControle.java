package br.com.exemplo01.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.exemplo01.modelo.CargoModelo;
import br.com.exemplo01.repositorio.CargoRepositorio;

@RestController
//Criando uma rota pois teremos mais de um restController
@RequestMapping("/cargos")
public class CargoControle {

    @Autowired
    private CargoRepositorio acao;

    @PostMapping("")
    public CargoModelo cadastrar(@RequestBody CargoModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<CargoModelo> selecionar(){
        return acao.findAll();
    }
    
}
