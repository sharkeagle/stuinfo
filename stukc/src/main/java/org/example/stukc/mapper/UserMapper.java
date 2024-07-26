package org.example.stukc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;
import org.example.stukc.entity.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper extends BaseMapper<User> {
    @Select("select * from admin")
    List<User> findAll();
    @Select("select * from stut where id=#{id}")
    student MesSt(String id);
    @Select("select * from teat where id=#{id}")
    teacher MesStt(String id);
    @Select("select * from kc where id=#{id}")
    kc MesSttk(String id);
    @Select("select * from kc2006 ")
    List<kc>VW();
    @Insert("INSERT INTO admin VALUES(#{id},#{name},#{password});")
    int insert(User user);
    @Insert("INSERT INTO stut(id, name, password,address,age,sex,facid) VALUES(#{id},#{name},#{password},#{address},#{age},#{sex},#{facid});")
    int insertstu(student user);
    @Insert("INSERT INTO stut(id, name, password,address,age,sex,facid) VALUES(#{id},#{name},#{password},#{address},#{age},#{sex},NULL);")
    int insertstunull(student user);
    @Insert("INSERT INTO teat(id,name,password,address,age,sex,jobt,speid) VALUES(#{id},#{name},#{password},#{address},#{age},#{sex},#{jobt},#{speid});")
    int inserttea(teacher user);
    @Insert("INSERT INTO xsxk(stuid,kcid,grade) VALUES(#{stuid},#{kcid},#{grade});")
    int insertxsxk(xsxk user);
    int update(User user);
    int updatestu(student stu);
    int delestu(String stuid);
    int updatetea(teacher tea);
    int deletea(String teaid);
   @Select("select count(id) from admin where id=#{id}")//getid
    Integer getId(User user);
   @Select("select count(id) from admin where id=#{id} and password=#{password}")
   int gt(String id,String password);
    @Delete("delete  from admin where id=#{id}")//删除
    int deletebyid(@Param("id") int id);
    @Select("select * from admin limit #{pageNum},#{pageSize}")
    List<User> findP(int pageNum, int pageSize);
    @Select("select * from stut limit #{pageNum},#{pageSize}")
    List<student> findPstu(int pageNum, int pageSize);
    @Select("select * from teat limit #{pageNum},#{pageSize}")
    List<teacher> findPtea(int pageNum, int pageSize);
    @Select("select count(id) from admin")
    int countSize();
    void numB1(Map<String,Object> a);
    void numB2(Map<String,Object> a);
    @Select("select count(id) from stut")
    int countSizestu();
    @Select("select count(id) from teat")
    int countSizetea();
    @Select("select count(stuId) from xsxk")
    int countSizexsxk();
    @Select("select count(stuid) from xsxk where stuId=#{id} ")
    int countSizestuid(String id);
    @Select("select count(stuid) from xsxk where xsxk.kcId=#{id} ")
    int countSizekcid(String id);
    @Select("select count(stuid) from xsxk where stuId=#{stuid} and kcId=#{kcid}")
    int countSizexsxkid(String stuid,String kcid);
    @Select("select * from admin where id=#{id}")
    User MesS(String id);
    @Select("select count(id) from stut where id=#{id}")
    int getstuID(String id);
    @Select("select count(id) from kc where id=#{id}")
    int getkcID(String id);
    @Select("select count(id) from teat where id=#{id}")
    int getteaID(String id);
    @Select("select * from xsxk limit #{pageNum},#{pageSize}")
    List<xsxk> findPxsxk(int pageNum, int pageSize);
    @Select("select * from kc limit #{pageNum},#{pageSize}")
    List<kc> findPkc(int pageNum, int pageSize);
    @Select("select * from spe limit #{pageNum},#{pageSize}")
    List<spe> findPspe(int pageNum, int pageSize);
    @Select("select * from fac limit #{pageNum},#{pageSize}")
    List<fac> findPfac(int pageNum, int pageSize);
    @Select("select * from xsxk where kcId=#{id}")
    List<xsxk> MesSx1(String id);
    @Select("select * from xsxk where stuId=#{id}")
    List<xsxk> MesSx2(String id);
    @Select("select * from xsxk where stuId=#{stuid} and kcId=#{kcid}")
    xsxk MesSx3(String stuid,String kcid);

    int updatexsxk(xsxk tea);
    @Delete("delete from xsxk where kcId=#{kcid} and stuId=#{stuid}")
    int delexsxk(String stuid, String kcid);
    int delekc(String kcid);
    @Select("select count(id) from kc")
    int countSizekc();
    @Insert("insert into kc(id,name,yearD,teaId,yearE,xuef,speid)values(#{id},#{name},#{yearD},#{teaId},#{yearE},#{xuef},#{speid})")
    int insertkc(kc tea);

    int updatekc(kc tea);
    @Delete("delete  from spe where id=#{id}")
    int delespe(String id);
    @Insert("insert into spe(id,name) values (#{id},#{name})")
    int insertspe(spe tea);

    int updatespe(spe tea);
    @Select("select count(id) from spe")
    int countSizespe();
    @Select("select * from spe where id=#{id}")
    spe MesSttkspe(String id);
    @Select("select count(id) from spe where id=#{id}")
    int getspeID(String id);
    @Delete("delete  from fac where id=#{id}")
    int delefac(String id);
    @Insert("insert into fac(id,name,speid) values (#{id},#{name},#{speid})")
    int insertfac(fac tea);

    int updatefac(fac tea);
    @Select("select count(id) from fac")
    int countSizefac();
    @Select("select * from fac where id=#{id}")
    fac MesSttkfac(String id);
    @Select("select count(id) from fac where id=#{id}")
    int getfacID(String id);

}
