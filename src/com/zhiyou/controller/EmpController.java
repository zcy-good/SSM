package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Emp;
import com.zhiyou.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.xml.transform.Source;
import java.util.List;
import java.util.Map;

@Controller
public class EmpController {
    @Autowired
    private EmpService empService;

    @RequestMapping("/list.do")
    public String findAll(Model model,@RequestParam Map<String,Object> map){
        System.out.println("EmpController map" +map);
        if("".equals(map.get("keywoard"))){
            map.put("keyword",null);
        }
        if("".equals(map.get("keytype"))){
            map.put("keytype",null);
        }
        if (map.get("pageNum")==null){
            map.put("pageNum","1");
        }
        PageHelper.startPage(Integer.parseInt((String) map.get("pageNum")) ,3);
        System.out.println("++++++++++++++++++++++++++++++");

        List<Emp> list = empService.findAll(map);
        PageInfo<Emp> pageInfo = new PageInfo<>(list);

        System.out.println(list);
        model.addAttribute("list",list);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("map",map);
        return "ok";
    }

    @RequestMapping("/add")
    public String add(Emp emp){
        System.out.println(emp);
        empService.add(emp);
        return "redirect:/list.do";
    }


    @RequestMapping("/delete")
    public String delete(int empno){

        empService.delete(empno);
        return "redirect:/list.do";
    }
    @RequestMapping("/batchDelete")
    public String batchdelete(String[] empnos){
        for (String s:empnos) {
            empService.delete(Integer.parseInt(s));
        }

        return "redirect:/list.do";
    }

    @RequestMapping("/findOne")
    public String findOne(Model model, int empno){
        Emp emp = empService.findOne(empno);
        System.out.println("EmpController findOne emp" +emp);
        model.addAttribute("emp" ,emp);
        return "update";
    }

    @RequestMapping("/updateEmp")
    public String updateEmp(Emp emp){
        System.out.println("EmpController update emp" +emp);
        empService.updateEmp(emp);
        return "forward:/list.do";

    }

//    @RequestMapping("/batchDelete")
//    public String batchDelete(int[] checkedIds){
//        empService.batchDelete(checkedIds);
//        return null;
//    }


}
