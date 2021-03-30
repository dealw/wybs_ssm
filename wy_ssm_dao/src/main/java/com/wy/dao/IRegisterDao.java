package com.wy.dao;

import com.wy.entity.Register;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface IRegisterDao {
    @Insert("insert into users(email,username,password,phoneNum,status) value(#{email},#{username},#{password},#{phoneNum},1)")
    void saveUser(Register regist);
    @Insert("insert into member (id,NAME,nickname,phoneNum,email) values(#{id},#{realName},#{username},#{phoneNum},#{email})")
    void saveMember(Register regist);
    @Update("update users set phoneNum=#{phoneNum},username=#{username},email=#{email} where id=#{id}")
    void update(Register regist);
    @Update("update member set phoneNum=#{phoneNum},nickname=#{username},email=#{email} where id=#{id}")
    void updateMem(Register regist);
}
