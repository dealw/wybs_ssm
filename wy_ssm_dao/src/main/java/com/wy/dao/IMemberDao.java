package com.wy.dao;

import com.wy.entity.Member;
import com.wy.entity.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMemberDao {
    //根据id查询Member
    @Select("select * from member where id=#{id}")
    Member findById(String id);
    @Select("select NAME from member where nickname=#{username}")
    String findByUsername(String username);
    @Delete("delete from member where id=#{id}")
    void deleteUser(String id);
    @Select("select id from member where nickname like #{name} or NAME like #{name}")
    List<String> findByName(String name);
    @Update("update member set email=#{email},nickname=#{username},phoneNum=#{phoneNum} where id=#{id}")
    void updatemember(UserInfo userInfo);
}
