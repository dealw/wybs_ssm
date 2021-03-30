package com.wy.Controller;

import com.wy.entity.MainInfo;
import com.wy.service.IOrdersService;
import com.wy.service.IProductService;
import com.wy.service.ITravellerService;
import com.wy.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/maininfo")
public class MainController {
    @Autowired
    private IUserService userService;
    @Autowired
    private ITravellerService travellerService;
    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private IProductService productService;
    @RequestMapping("/getInfo.do")
    public @ResponseBody MainInfo getInfo(){
        Integer users = userService.getCount();
         Integer travllers = travellerService.getCount();
        Integer orders = ordersService.getCount();
        Integer products = productService.getCount();
        MainInfo mainInfo=new MainInfo();
        mainInfo.setUsers(users);
        mainInfo.setOrders(orders);
        mainInfo.setProducts(products);
        mainInfo.setTravllers(travllers);
        return mainInfo;
    }
}
