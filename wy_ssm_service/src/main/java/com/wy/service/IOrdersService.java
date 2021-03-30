package com.wy.service;

import com.wy.entity.Orders;

import java.util.List;

public interface IOrdersService {
    //查询所有订单
    List<Orders> findAll(int page,int size) throws Exception;
    //根据id查询订单
    Orders findById(String id) throws Exception;
    //删除订单
    void deleteOrder(String[] ids) throws Exception;
    //生成订单
    String addOrder(String memberId, String productId,Integer pnum,String desc,Integer payType);
    //将订单和游客联系起来
    Integer addTravellerToOrder(String oid, List<String> tids);
    //查找会员的所有订单
    List<Orders> findAllByMemberId(Integer page, Integer size, String id);

    void updatePeopleCount(int pnum,String oid);

    List<Orders> searchByName(String names, Integer page, Integer size);

    void deleteTravellerInOrder(String orderId, String[] ids);

    Integer getCount();
}
