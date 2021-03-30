package com.wy.dao;

import com.wy.entity.Member;
import com.wy.entity.Orders;
import com.wy.entity.Product;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
@Repository
public interface IOrdersDao {
    @Select("select * from orders")
    @Results(
            {
                    @Result(id = true,property = "id",column ="id" ),
                    @Result(property = "orderNum",column ="orderNum" ),
                    @Result(property = "orderTime",column ="orderTime" ),
                    @Result(property = "orderStatus",column ="orderStatus" ),
                    @Result(property = "peopleCount",column ="peopleCount" ),
                    @Result(property = "payType",column ="payType" ),
                    @Result(property = "orderDesc",column ="orderDesc" ),
                    @Result(property = "product",column ="productId",javaType = Product.class,one=@One(select = "com.wy.dao.IProductDao.findById")),
                    @Result(property = "member",column ="memberId",javaType = Member.class,one=@One(select = "com.wy.dao.IMemberDao.findById"))
            }
    )
    List<Orders> findAll() throws Exception;//查询所有订单
    @Select("select * from orders where id=#{id}")
    @Results(
            {
                    @Result(id = true,property = "id",column ="id" ),
                    @Result(property = "orderNum",column ="orderNum" ),
                    @Result(property = "orderTime",column ="orderTime" ),
                    @Result(property = "orderStatus",column ="orderStatus" ),
                    @Result(property = "peopleCount",column ="peopleCount" ),
                    @Result(property = "payType",column ="payType" ),
                    @Result(property = "orderDesc",column ="orderDesc" ),
                    @Result(property = "product",column ="productId",javaType = Product.class,one=@One(select = "com.wy.dao.IProductDao.findById")),
                    @Result(property = "member",column ="memberId",javaType = Member.class,one=@One(select = "com.wy.dao.IMemberDao.findById")),
                    @Result(property = "travellers",column ="id",javaType = java.util.List.class,many=@Many(select = "com.wy.dao.ITravellerDao.findByOrderId"))
            }
    )
    Orders findById(String id);
    @Delete("delete from orders where id=#{id}")
    void deleteOrder(String id);
    @Insert("insert into orders (peopleCount,orderTime,orderDesc,payType,orderStatus,productId,memberId) values(#{pnum},#{date},#{desc},#{payType},1,#{pId},#{mId})")
    void addOrder(@Param("mId") String memberId, @Param("pId") String productId,@Param("pnum") Integer pnum,@Param("desc")String desc,@Param("date") Date date,@Param("payType") Integer payType);
    @Select("select id from orders where peopleCount=#{pnum} and orderTime=#{date} and orderDesc=#{desc} and productId=#{pId} and memberId=#{mId}")
    String findIdByAllInf(@Param("mId") String memberId, @Param("pId") String productId,@Param("pnum") Integer pnum,@Param("desc")String desc,@Param("date") Date date);
    @Insert("insert into order_traveller (orderId,travellerId) values(#{oid},#{tid})")
    void addTravellerToOrder(@Param("oid") String oid,@Param("tid") String tid);
    @Select("select * from orders where memberId=#{id}")
    @Results(
            {
                    @Result(id = true,property = "id",column ="id" ),
                    @Result(property = "orderNum",column ="orderNum" ),
                    @Result(property = "orderTime",column ="orderTime" ),
                    @Result(property = "orderStatus",column ="orderStatus" ),
                    @Result(property = "peopleCount",column ="peopleCount" ),
                    @Result(property = "payType",column ="payType" ),
                    @Result(property = "orderDesc",column ="orderDesc" ),
                    @Result(property = "product",column ="productId",javaType = Product.class,one=@One(select = "com.wy.dao.IProductDao.findById")),
                    @Result(property = "member",column ="memberId",javaType = Member.class,one=@One(select = "com.wy.dao.IMemberDao.findById"))
            }
    )
    List<Orders> findAllByMemberId(String id);
    @Update("UPDATE orders SET peopleCount=peopleCount+#{pnum},orderTime=orderTime WHERE id=#{oid}")
    void updatePeopleCount(@Param("pnum") int pnum,@Param("oid") String oid);
    @Select("select * from orders where orderNum like #{name} or orderTime like #{name} or peopleCount like #{name} or payType like #{name}")
    @Results(
            {
                    @Result(id = true,property = "id",column ="id" ),
                    @Result(property = "orderNum",column ="orderNum" ),
                    @Result(property = "orderTime",column ="orderTime" ),
                    @Result(property = "orderStatus",column ="orderStatus" ),
                    @Result(property = "peopleCount",column ="peopleCount" ),
                    @Result(property = "payType",column ="payType" ),
                    @Result(property = "orderDesc",column ="orderDesc" ),
                    @Result(property = "product",column ="productId",javaType = Product.class,one=@One(select = "com.wy.dao.IProductDao.findById")),
                    @Result(property = "member",column ="memberId",javaType = Member.class,one=@One(select = "com.wy.dao.IMemberDao.findById"))
            }
    )
    List<Orders> searchByName(String name);

    @Select("select * from orders where productId=#{pid}")
    @Results(
            {
                    @Result(id = true,property = "id",column ="id" ),
                    @Result(property = "orderNum",column ="orderNum" ),
                    @Result(property = "orderTime",column ="orderTime" ),
                    @Result(property = "orderStatus",column ="orderStatus" ),
                    @Result(property = "peopleCount",column ="peopleCount" ),
                    @Result(property = "payType",column ="payType" ),
                    @Result(property = "orderDesc",column ="orderDesc" ),
                    @Result(property = "product",column ="productId",javaType = Product.class,one=@One(select = "com.wy.dao.IProductDao.findById")),
                    @Result(property = "member",column ="memberId",javaType = Member.class,one=@One(select = "com.wy.dao.IMemberDao.findById"))
            }
    )
    List<Orders> findByProductId(String pid);
    @Update("UPDATE orders SET peopleCount=peopleCount-1 where id=#{oid}")
    void updatePeopleCountReduceByid(String oid);
    @Delete("delete from order_traveller where orderId=#{oid} and travellerId=#{tid}")
    void deleteTravellerInOrder(@Param("oid") String orderId,@Param("tid") String id);
    @Select("select orderId from order_traveller where orderId=#{oid} and travellerId=#{tid}")
    String issaved(@Param("oid") String oid,@Param("tid") String tid);
    @Delete("delete from order_traveller where orderId=#{id}")
    void deleteTravllerAndOrderRecord(String id);
    @Select("select count(*) from orders")
    Integer getCount();
}
