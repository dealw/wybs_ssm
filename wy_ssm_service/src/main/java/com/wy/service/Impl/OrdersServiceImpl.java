package com.wy.service.Impl;

import com.github.pagehelper.PageHelper;
import com.wy.dao.IMemberDao;
import com.wy.dao.IOrdersDao;
import com.wy.dao.IProductDao;
import com.wy.entity.Orders;
import com.wy.service.IOrdersService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    private IOrdersDao ordersDao;
    @Autowired
    private IProductDao productDao;
    @Autowired
    private IMemberDao memberDao;
    @Override
    public List<Orders> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String id) throws Exception {
       return ordersDao.findById(id);
    }

    @Override
    public void deleteOrder(String[] ids) throws Exception {
        for (String id : ids) {
            ordersDao.deleteOrder(id);
            ordersDao.deleteTravllerAndOrderRecord(id);
        }
    }

    @Override
    public String addOrder(String memberId, String productId,Integer pnum,String desc,Integer payType) {
        Date date=new Date();
        ordersDao.addOrder(memberId,productId,pnum,desc,date,payType);
        return ordersDao.findIdByAllInf(memberId,productId,pnum,desc,date);
    }

    @Override
    public Integer addTravellerToOrder(String oid, List<String> tids) {
        int i=0;
        for (String tid : tids) {
            String res = ordersDao.issaved(oid, tid);
            if (res!=null){
                continue;
            }
            ordersDao.addTravellerToOrder(oid,tid);
            i++;
        }
        return i;
    }

    @Override
    public List<Orders> findAllByMemberId(Integer page, Integer size, String id) {
        PageHelper.startPage(page,size);
        return ordersDao.findAllByMemberId(id);
    }

    @Override
    public void updatePeopleCount(int pnum,String oid) {
        ordersDao.updatePeopleCount(pnum,oid);
    }

    @Override
    public List<Orders> searchByName(String name, Integer page, Integer size) {
        name="%"+name+"%";
        List<String> pids = productDao.findByName(name);
        List<String> mids = memberDao.findByName(name);
        List<Orders> res=new ArrayList<>();
        if (pids!=null&&pids.size()!=0){
            for (String pid : pids) {
                res.addAll(ordersDao.findByProductId(pid));
            }
        }
        if (mids!=null&&mids.size()!=0){
            for (String mid : mids) {
                res.addAll(ordersDao.findAllByMemberId(mid));
            }
        }
        List<Orders> list = ordersDao.searchByName(name);
        res.addAll(list);
        return res;
    }

    @Override
    public void deleteTravellerInOrder(String orderId, String[] ids) {
        for (String id : ids) {
            ordersDao.deleteTravellerInOrder(orderId,id);
            ordersDao.updatePeopleCountReduceByid(orderId);
        }
    }

    @Override
    public Integer getCount() {
        return ordersDao.getCount();
    }
}
