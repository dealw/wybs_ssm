package com.wy.dao;

import com.wy.entity.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysLogDao {

    @Insert(("insert into syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})"))
    void save(SysLog sysLog) throws Exception;
    @Select("select * from syslog ORDER BY visitTime")
    List<SysLog> findAll() throws Exception;
}
