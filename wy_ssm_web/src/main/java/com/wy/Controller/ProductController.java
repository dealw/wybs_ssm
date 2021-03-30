package com.wy.Controller;

import com.github.pagehelper.PageInfo;
import com.wy.entity.Product;
import com.wy.entity.UserInfo;
import com.wy.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> ps = productService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(ps);
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("flag",1);
        mv.setViewName("product-list");
        return mv;
    }
    @RequestMapping("/save.do")
    public String save(Product product) throws Exception {
        productService.save(product);
        return "redirect:findAll.do";
    }
    @RequestMapping("/travelleradd.do")
    public ModelAndView travelleradd(@RequestParam(name = "id",required = true) String id){
        ModelAndView mv=new ModelAndView();
        mv.addObject("productId",id);
        mv.setViewName("traveller-add");
        return mv;
    }
    @RequestMapping("/deleteProduct.do")
    public String deleteProduct(String[] ids){
        productService.deleteProduct(ids);
        return "redirect:findAll.do";
    }
    @RequestMapping("/searchByName.do")
    public ModelAndView searchByName(String name,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        if (name =="") {
            List<Product> ps = productService.findAll(page,size);
            PageInfo pageInfo=new PageInfo(ps);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("flag",1);
            mv.setViewName("product-list");
            return mv;
        }
        String names = java.net.URLDecoder.decode(name, "utf-8");
        List<Product> res =productService.searchByName(names,page,size);
        PageInfo pageInfo=new PageInfo(res);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",0);
        mv.addObject("name",name);
        mv.setViewName("product-list");
        return mv;
    }
    @RequestMapping("/revise.do")
    public ModelAndView revise(String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        Product product = productService.findById(id);
        mv.addObject("product",product);
        mv.setViewName("product-revise");
        return mv;
    }
    @RequestMapping("/update.do")
    public String update(Product product){
        productService.update(product);
        return "redirect:findAll.do";
    }
}
