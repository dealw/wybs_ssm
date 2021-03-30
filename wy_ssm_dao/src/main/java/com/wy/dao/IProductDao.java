package com.wy.dao;

import com.wy.entity.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface IProductDao {
    @Select("select * from product where id=#{id}")
    public Product findById(String id) throws Exception;
    @Select("select * from product")
    public List<Product> findAll();//查询所有的产品信息
    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);
    @Delete("delete from product where id=#{id}")
    void deleteProduct(String id);
    @Select("select * from product where productNum like #{name} or productName like #{name} or cityName like #{name} or DepartureTime like #{name}  or productPrice like #{name} ")
    List<Product> searchByName(String name);
    @Select("select id from product where productName like #{name}")
    List<String> findByName(String name);
    @Update("update product set productNum=#{productNum},productName=#{productName},cityName=#{cityName},DepartureTime=#{departureTime},productPrice=#{productPrice},productDesc=#{productDesc},productStatus=#{productStatus} where id=#{id}")
    void update(Product product);
    @Select("select count(*) from product")
    Integer getCount();
}