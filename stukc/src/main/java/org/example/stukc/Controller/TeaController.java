package org.example.stukc.Controller;

import io.micrometer.common.util.StringUtils;
import jakarta.annotation.Resource;
import org.example.stukc.dynamicCon.DS;
import org.example.stukc.entity.*;
import org.example.stukc.mapper.TeaMapper;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/tea")
public class TeaController {
    @Resource
    TeaMapper stuu;
    @DS(value="tea")
    @PostMapping("/login")
    public boolean login(@RequestBody teacher u){
        String id= String.valueOf(u.getId());
        String pass=u.getPassword();
        if(StringUtils.isBlank(id)||StringUtils.isBlank(pass)){
            return false;
        }
        else{
            if(stuu.gt(id,pass)==0)return false;
            return true;
        }
    }
    @DS(value="tea")
    @GetMapping("/mes{id}")
    public viewtea Mes(@RequestParam int id){
        return stuu.MesStea(id);
    }
    @DS(value="tea")
    @GetMapping("/page")
    public Map<String,Object> findP1(@RequestParam int pageNum,@RequestParam int pageSize,@RequestParam int id){
        pageNum=(pageNum-1)*pageSize;
        int num=stuu.countvkc(id);
        List<viewteakc> data=stuu.MeStea(pageNum,pageSize,id);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @DS(value="tea")
    @GetMapping("/viewF")
    public Map<String,Object> findP3(@RequestParam int pageNum,@RequestParam int pageSize,int kid){
        pageNum=(pageNum-1)*pageSize;
        int num=stuu.countks(kid);
        List<viewStu> data=stuu.findP(pageNum,pageSize,kid);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }

}
