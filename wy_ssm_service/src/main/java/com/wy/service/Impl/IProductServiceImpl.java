package com.wy.service.Impl;

import com.github.pagehelper.PageHelper;
import com.wy.dao.IProductDao;
import com.wy.entity.Product;
import com.wy.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class IProductServiceImpl implements IProductService {
    @Autowired
    private IProductDao productDao;
    @Override
    public List<Product> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return productDao.findAll();
    }

    @Override
    public void save(Product product) throws Exception {
        productDao.save(product);
    }

    @Override
    public void deleteProduct(String[] ids) {
        for (String id : ids) {
            productDao.deleteProduct(id);
        }
    }

    @Override
    public List<Product> searchByName(String name, Integer page, Integer size) {
        PageHelper.startPage(page,size);
        name="%"+name+"%";
        return productDao.searchByName(name);
    }

    @Override
    public Product findById(String id) throws Exception {
        return productDao.findById(id);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public Integer getCount() {
        return productDao.getCount();
    }
}
