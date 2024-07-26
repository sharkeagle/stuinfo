package org.example.stukc.Controller;
//
//import cn.hutool.poi.excel.ExcelReader;
//import cn.hutool.poi.excel.ExcelUtil;
//import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.micrometer.common.util.StringUtils;
import jakarta.annotation.Resource;
import org.apache.ibatis.type.NStringTypeHandler;
import org.example.stukc.dynamicCon.DS;
import org.example.stukc.entity.*;
import org.example.stukc.mapper.UserMapper;
import org.example.stukc.service.BackupService;
import org.example.stukc.service.Recovery;
import org.example.stukc.service.Userservice;
import org.example.stukc.service.newBackup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")

public class UserController {
    @Autowired
    private UserMapper User;
    @Autowired
   private Userservice userv;
    @Resource
    private Recovery re;
    @Autowired
    newBackup a;
    @Autowired
    private BackupService backupService;
    @PostMapping("/backup")
    @DS(value = "slave")
    public boolean backA(){
        try {

            a.backDatabase();
            return  true;

        } catch (Exception e) {
            return false;
        }
    }
    @PostMapping("/reco")
    public boolean reco(){
        try {

           return re.recoverDatabase();

        } catch (Exception e) {
            return false;
        }
    }
    @PostMapping
   public int save(@RequestBody User user){//增加修改
       return userv.saveU(user);
   }
    @GetMapping()
    public List<User> index(){
        return User.findAll();
    }//获取数据库所有数据
//    @DeleteMapping("/{id}")
//    public  int delete(@PathVariable String id){//删除
//        return User.deletebyid(id);
//    }
    @DeleteMapping("/stu/{id}")
    public  int delete1(@PathVariable String id){//删除学生信息
        return User.delestu(id);
    }
    @DeleteMapping("/tea/{id}")
    public  int delete2(@PathVariable String id){//删除学生信息
        return User.deletea(id);
    }
    @DeleteMapping("/kc/{id}")
    public  int delete4(@PathVariable String id){//删除学生信息
        return User.delekc(id);
    }
    @DeleteMapping("/spe/{id}")
    public  int delete5(@PathVariable String id){//删除学生信息
        return User.delespe(id);
    }
    @DeleteMapping("/fac/{id}")
    public  int delete6(@PathVariable String id){//删除学生信息
        return User.delefac(id);
    }
    @DeleteMapping("/xsxk/del")
    public  int delete3(@RequestParam String stuid,@RequestParam String kcid){//删除学生信息
        return User.delexsxk(stuid,kcid);
    }
    @PostMapping("/stu/ins")
    public  int saves(@RequestBody student stu){
        int fl=User.getstuID(stu.getId());
        System.out.println(fl);
        String f1=stu.getFacid();
        System.out.println(f1);
        if(fl!=0){
            return User.updatestu(stu);
        }
        else{
            return User.insertstu(stu);
        }
    }
    @PostMapping("/tea/ins")
    public  int saves2(@RequestBody teacher tea){
        int fl=User.getteaID(tea.getId());
        if(StringUtils.isBlank(tea.getSpeid())){
            tea.setSpeid(null);
        }
        if(fl!=0){
            return User.updatetea(tea);
        }
        else{
            return User.inserttea(tea);
        }
    }
    @PostMapping("/xsxk/ins")
    public  int saves3(@RequestBody xsxk tea){
        int fl=User.countSizexsxkid(tea.getStuid(),tea.getKcid());
        if(StringUtils.isBlank(tea.getKcid())){
            tea.setKcid(null);
        }
        if(StringUtils.isBlank(tea.getStuid())){
            tea.setStuid(null);
        }
        if(fl!=0){
            return User.updatexsxk(tea);
        }
        else{
            return User.insertxsxk(tea);
        }
    }
    @PostMapping("/kc/ins")
    public  int saves99(@RequestBody kc tea){
        int fl=User.getkcID(tea.getId());
        String f1=tea.getSpeid();
        if(StringUtils.isBlank(f1)){
            tea.setSpeid(null);
        }
        if(fl!=0){
            return User.updatekc(tea);
        }
        else{
            return User.insertkc(tea);
        }
    }
    @PostMapping("/spe/ins")
    public  int saves4(@RequestBody spe tea){
        int fl=User.getspeID(tea.getId());
        if(fl!=0){
            return User.updatespe(tea);
        }
        else{
            return User.insertspe(tea);
        }
    }
    @PostMapping("/fac/ins")
    public  int saves5(@RequestBody fac tea){
        int fl=User.getfacID(tea.getId());
        if(StringUtils.isBlank(tea.getSpeid())){
            tea.setSpeid(null);
        }
        if(fl!=0){
            return User.updatefac(tea);
        }
        else{
            return User.insertfac(tea);
        }
    }
    @PostMapping("/login")
    public boolean login(@RequestBody User u){
        String id= String.valueOf(u.getId());
        String pass=u.getPassword();
        if(StringUtils.isBlank(id)||StringUtils.isBlank(pass)){
            return false;
        }
        else{
            if(User.gt(id,pass)==0)return false;
            return true;
        }
    }
    @GetMapping("/view2006")
    public  Object view2(){
        return User.VW();
    }
    @GetMapping("/page")
    public Map<String,Object> findP2(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSize();
        List<User> data=User.findP(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagestu")
    public Map<String,Object> findP3(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSizestu();
        List<student> data=User.findPstu(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagestuid")
    public Map<String,Object> findP3s(@RequestParam String id){
        int num=0;
        List<student> data=new ArrayList<>();
        if(!StringUtils.isBlank(id)){
            num=User.getstuID(id);
            data.add(User.MesSt(id));
        }
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagexsxkid")
    public Map<String,Object> findP3x(@RequestParam String stuid,@RequestParam String kcid){
        int num=0;
        List<xsxk> data=new ArrayList<>();
        if(StringUtils.isBlank(kcid)&&!StringUtils.isBlank(stuid)){
            ;
            num=User.countSizestuid(stuid);
            data.addAll(User.MesSx2(stuid));
        }
        else if(StringUtils.isBlank(stuid)&&!StringUtils.isBlank(kcid)){
            int kcid1=Integer.parseInt(kcid);
            num=User.countSizekcid(kcid);
            data.addAll(User.MesSx1(kcid));
        }
        else if(!StringUtils.isBlank(stuid)&&!StringUtils.isBlank(kcid)){
            int kcid1=Integer.parseInt(kcid);
            int stuid1=Integer.parseInt(stuid);
            num=User.countSizexsxkid(stuid,kcid);
            data.add(User.MesSx3(stuid,kcid));
        }
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
//    @DS("slave")//权限
    @GetMapping("/pageteaid")
    public Map<String,Object> findP3t(@RequestParam String id){
        int num=0;
        List<teacher> data=new ArrayList<>();
        if(!StringUtils.isBlank(id)){
            num=User.getteaID(id);
            data.add(User.MesStt(id));
        }
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagekcid")
    public Map<String,Object> findP3k(@RequestParam String id){
        int num=0;
        List<kc> data=new ArrayList<>();
        if(!StringUtils.isBlank(id)){
            num=User.getteaID(id);
            data.add(User.MesSttk(id));
        }
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagetea")
    public Map<String,Object> findP4(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSizetea();
        List<teacher> data=User.findPtea(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagexsxk")
    public Map<String,Object> findP5(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSizexsxk();
        List<xsxk> data=User.findPxsxk(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagekc")
    public Map<String,Object> findP6(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSizekc();
        List<kc> data=User.findPkc(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagespe")
    public Map<String,Object> findP9(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSizespe();
        List<spe> data=User.findPspe(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagespeid")
    public Map<String,Object> findP4k(@RequestParam String id){
        int num=0;
        List<spe> data=new ArrayList<>();
        if(!StringUtils.isBlank(id)){
            num=User.getteaID(id);
            data.add(User.MesSttkspe(id));
        }
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }
    @GetMapping("/pagefacid")
    public Map<String,Object> findP5k(@RequestParam String id){
        int num=0;
        List<fac> data=new ArrayList<>();
        if(!StringUtils.isBlank(id)){
            num=User.getteaID(id);
            data.add(User.MesSttkfac(id));
        }
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }

//    @GetMapping("/pagespe")
//    public Map<String,Object> findP7(@RequestParam int pageNum,@RequestParam int pageSize){
//        pageNum=(pageNum-1)*pageSize;
//        int num=User.countSizetea();
//        List<spe> data=User.findPspe(pageNum,pageSize);
//        Map<String, Object> res=new HashMap<>();
//        res.put("data",data);
//        res.put("total",num);
//        return res;
//    }
    @GetMapping("/pagefac")
    public Map<String,Object> findP8(@RequestParam int pageNum,@RequestParam int pageSize){
        pageNum=(pageNum-1)*pageSize;
        int num=User.countSizefac();
        List<fac> data=User.findPfac(pageNum,pageSize);
        Map<String, Object> res=new HashMap<>();
        res.put("data",data);
        res.put("total",num);
        return res;
    }


    @GetMapping("/page1")
    public IPage<User> findP(@RequestParam int pageNum,@RequestParam int pageSize,@RequestParam String name){
        IPage<User> p=new Page<>(pageNum,pageSize);
        QueryWrapper<User> q=new QueryWrapper<>();
        q.like("name",name);
        return userv.page(p,q);
    }
//    @GetMapping("/export")
//    public  void export() throws Exception{
//        List<User> p1=userv.list();
//        ExcelWriter writer = ExcelUtil.getWriter("E:/stuinfo/studentx/stu/src/datatwo/hei.xlsx");
//        writer.write(p1);
//        writer.close();
//    }
    @GetMapping("/mes{id}")
    public User Mes(@RequestParam String id){
        return User.MesS(id);
    }
//    @PostMapping("/import")
//    public  void import1(){
//        ExcelReader p1=ExcelUtil.getReader("E:/stuinfo/studentx/stu/src/datatwo/hei.xlsx");
//        List<User>l1=p1.readAll(User.class);
//        p1.close();
//
//    }
}
