package com.wy.service;

import com.wy.entity.Product;

import java.util.List;

public interface IProductService {
    public List<Product> findAll(int page,int size) throws Exception;

    void save(Product product) throws Exception;

    void deleteProduct(String[] ids);

    List<Product> searchByName(String names, Integer page, Integer size);

    Product findById(String id) throws Exception;

    void update(Product product);

    Integer getCount();
}
