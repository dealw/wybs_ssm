package com.wy.Controller;

import com.github.pagehelper.PageInfo;
import com.wy.entity.Permission;
import com.wy.entity.Role;
import com.wy.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Role> roleList=roleService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(roleList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("role-list");
        return mv;
    }
    @RequestMapping("/save.do")
    public String save(Role role) throws Exception {
        roleService.save(role);
        return "redirect:findAll.do";
    }
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true)String roleId) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Permission> permissions = roleService.findRoleByIdAndAllPermission(roleId);
        mv.addObject("roleId",roleId);
        mv.addObject("permissions",permissions);
        mv.setViewName("role-permission-add");
        return mv;
    }
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true)String roleId,@RequestParam(name = "ids",required = true)String[] ids) throws Exception{
        roleService.addPermissionToRole(roleId,ids);
        return "redirect:findAll.do";
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true) String id,@RequestParam("name") String name){
        ModelAndView mv=new ModelAndView();
        List<Permission> permissions=roleService.findById(id);
        mv.addObject("permissions",permissions);
        mv.addObject("roleName",name);
        mv.setViewName("role-show");
        return mv;
    }
}
