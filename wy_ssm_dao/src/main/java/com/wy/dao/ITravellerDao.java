package com.wy.dao;

import com.wy.entity.Traveller;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ITravellerDao {
    @Select("SELECT * FROM traveller WHERE id IN (SELECT travellerId FROM order_traveller WHERE orderId=#{id})")
    List<Traveller> findByOrderId(String id) throws Exception;
    @Insert("insert into traveller (NAME,sex,phoneNum,credentialsType,credentialsNum,travellerType) values(#{name},#{sex},#{phoneNum},#{credentialsType},#{credentialsNum},#{travellerType})")
    void saveTravellers(Traveller traveller);
    @Select("select id from traveller where credentialsNum=#{credentialsNum}")
    String findIdByCredentialsNum(String credentialsNum);
    @Select("select * from traveller")
    List<Traveller> findAll();
    @Select("select * from traveller where id=#{id}")
    Traveller findById(String id);
    @Update("update traveller set NAME=#{name},sex=#{sex},phoneNum=#{phoneNum},credentialsType=#{credentialsType},credentialsNum=#{credentialsNum},travellerType=#{travellerType} where id=#{id}")
    void update(Traveller traveller);
    @Delete("delete from traveller where id=#{id}")
    void deleteByIds(String id);
    @Select("select * from traveller where  NAME=#{name} and sex=#{sex} and phoneNum=#{phoneNum} and credentialsType=#{credentialsType} and credentialsNum=#{credentialsNum} and travellerType=#{travellerType}")
    Traveller issaved(Traveller traveller);
    @Select("select * from traveller where NAME like #{name} or sex like #{name} or phoneNum like #{name} or credentialsType like #{name} or credentialsNum like #{name} or travellerType like #{name}")
    List<Traveller> searchByName(String name);
    @Delete("delete from order_traveller where travellerId=#{id}")
    void deleteTravellerInorder(String id);
    @Select("select orderId from order_traveller where travellerId=#{id}")
    List<String> findAllOidByTid(String id);
    @Select("select count(*) from traveller")
    Integer getCount();
}
