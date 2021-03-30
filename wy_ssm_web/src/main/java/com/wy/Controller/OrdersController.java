package com.wy.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wy.entity.Orders;
import com.wy.entity.Product;
import com.wy.entity.Traveller;
import com.wy.entity.TravellerModel;
import com.wy.service.IOrdersService;
import com.wy.service.ITravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private ITravellerService travellerService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Orders> fa = ordersService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(fa);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",1);
        mv.setViewName("orders-list");
        return mv;
    }
    @RequestMapping("/searchByName.do")
    public ModelAndView searchByName(String name,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        if (name =="") {
            List<Orders> fa = ordersService.findAll(page,size);
            PageInfo pageInfo=new PageInfo(fa);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("flag",1);
            mv.setViewName("orders-list");
            return mv;
        }
        String names = java.net.URLDecoder.decode(name, "utf-8");
        List<Orders> res =ordersService.searchByName(names,page,size);
        PageInfo pageInfo=new PageInfo(res);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",0);
        mv.addObject("name",name);
        mv.setViewName("orders-list");
        return mv;
    }
    @RequestMapping("/findAllByMemberId.do")
    public ModelAndView findAllByMemberId(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size,@RequestParam(name = "id",required = true)String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Orders> fa = ordersService.findAllByMemberId(page,size,id);
        PageInfo pageInfo=new PageInfo(fa);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("members-orders-list");
        return mv;
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true)String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        Orders order = ordersService.findById(id);
        mv.addObject("orders",order);
        mv.setViewName("orders-show");
        return mv;
    }
    @RequestMapping("/deleteOrder.do")
    public String deleteOrder(String[] ids) throws Exception {
       ordersService.deleteOrder(ids);
       return "redirect:findAll.do";
    }
    @RequestMapping("/addTraveller.do")
    public ModelAndView addTraveller(String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        Orders order=ordersService.findById(id);
        List<Traveller> travellers = order.getTravellers();
        mv.addObject("travellers",travellers);
        mv.addObject("orderId",id);
        mv.setViewName("order-traveller-add");
        return mv;
    }
    @RequestMapping("/addTravellerToOrder.do")
    public String addTravellerToOrder(TravellerModel travellerModel){
        List<Traveller> travellers = travellerModel.getTravellers();
        List<Traveller> list=new ArrayList<>();
        for (Traveller traveller : travellers) {
            if (traveller.getName()==""||traveller.getPhoneNum()==""||traveller.getCredentialsNum()==""){
                continue;
            }
            list.add(traveller);
        }
        if(list.size()==0){
            return "redirect:findAll.do";
        }
        String oid=travellerModel.getOrderId();
        List<String> tids = travellerService.saveTravellers(list);
        //返回有多少旅客添加成功
        Integer pnum=ordersService.addTravellerToOrder(oid,tids);
        //更新订单人数
        ordersService.updatePeopleCount(pnum,oid);
        return "redirect:findAll.do";
    }
    @RequestMapping("/deleteTravellerInOrder.do")
    public String deleteTravellerInOrder(String orderId,String[] ids){
        ordersService.deleteTravellerInOrder(orderId,ids);
        return "redirect:findAll.do";
    }
}
