package com.iftm.api.helloworld;

import java.util.ArrayList;
import java.util.List;

public class Client {
    private String name;
    private int age;
    private List<Product> products;

    public Client() {
        products = new ArrayList<>();
    }

    public Client(String name, int age) {
        this.name = name;
        this.age = age;
        this.products = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
