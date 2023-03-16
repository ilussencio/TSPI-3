package com.iftm.api.helloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@SpringBootApplication
@RestController
@RequestMapping("/")
public class HelloworldApplication {

    List<Aluno> list = new ArrayList<>();

    private Logger logger = Logger.getLogger(HelloworldApplication.class.getName());
    public static void main(String[] args) {
        SpringApplication.run(HelloworldApplication.class, args);
    }

    @GetMapping
    public String helloWorld(){
        return "Olá, mundo!";
    }

    @GetMapping("/horas")
    public String data(){
        return new Date().toString();
    }

    @GetMapping("/aluno")
    public List<Aluno> getAluno(){
        logger.info("Retorna Aluno!");
        return list;
    }

    @PostMapping("/aluno")
    public Aluno saveAluno(@RequestBody Aluno aluno){
        System.out.println(aluno);
        list.add(aluno);
        return aluno;
    }
    @PutMapping("/aluno/{pos}")
    public Aluno updateAluno(@RequestBody Aluno aluno, @PathVariable("pos") int pos){
        System.out.println(1);
        list.get(pos).setName(aluno.getName());
        list.get(pos).setAge(aluno.getAge());
        list.get(pos).setDate(aluno.getDate());
        return aluno;
    }

    @GetMapping("/product")
    public Product getProduct(){
        logger.info("Retorna produto!");
        return new Product("Sabão cracra",12.5,new Date("2023/03/14"));
    }

    @GetMapping("/client")
    public Client getClient(){
        logger.info("Retorna Cliente!");
        Client client = new Client();
        client.setName("Lucas Ilussencio");
        client.setAge(25);

        Product p1 = new Product("Sabão cracra", 12.5, new Date("2023/03/14"));
        Product p2 = new Product("Sabão cricri", 16.5, new Date("2023/03/13"));
        Product p3 = new Product("Sabão de barra", 12.5, new Date("2023/03/12"));

        client.getProducts().add(p1);
        client.getProducts().add(p2);
        client.getProducts().add(p3);

        return client;
    }
}
