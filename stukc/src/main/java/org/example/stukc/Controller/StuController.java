package org.example.stukc.Controller;

import io.micrometer.common.util.StringUtils;
import org.example.stukc.dynamicCon.DS;
import org.example.stukc.entity.*;
import org.example.stukc.mapper.StuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/stu")

public class StuController {
    @Autowired
    StuMapper stuu;
    @DS(value="slave")
    @PostMapping("/login")
    public boolean login(@RequestBody student u){
        String id= u.getId();
        String pass=u.getPassword();
        if(StringUtils.isBlank(id)||StringUtils.isBlank(pass)){
            return false;
        }
        else{
            if(stuu.gt(id,pass)==0)return false;
            return true;
        }
    }
    @DS(value="slave")
    @GetMapping("/mes{id}")
    public student Mes(@RequestParam int id){
        return stuu.MesS(id);
    }
    @DS(value="slave")
    @GetMapping("/grade")
    public  Object grade(@RequestParam String sID,@RequestParam int yD,@RequestParam int yE){
        Map<String,Object> mm=new HashMap<String,Object>();
        mm.put("sId", sID);
        mm.put("yD", yD);
        mm.put("yE",yE);
        stuu.TUXF(mm);
        return mm.get("sumh");
    }
    @DS(value="slave")
    @GetMapping("/viewS")
    public List<viewStu> viewS(@RequestParam int id){
            return stuu.view1(id);
    }
    @DS(value="slave")
    @GetMapping("/viewF")
    public Map<String,Object> findP3(@RequestParam int pageNum,@RequestParam int pageSize,int id){
        pageNum=(pageNum-1)*pageSize;
        int num=stuu.count1(id);
        List<viewStu> data=stuu.findP(pageNum,pageSize,id);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @DS(value="slave")
    @GetMapping("/viewK")
    public Map<String,Object> findP1(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=stuu.count2();
        List<viewk> data=stuu.findPK(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @DS(value="slave")
    @PostMapping("/insrY")
    public boolean inse(@RequestBody  xsxk u){
        return stuu.inS(u);
    }
}
