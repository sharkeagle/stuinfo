package org.example.stukc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.stukc.entity.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface StuMapper {
    void TUXF(Map<String,Object> a);
    @Select("select count(id) from stut where id=#{id} and password=#{password}")
    int gt(String id,String password);
    @Select("select * from stut where id=#{id}")
    student MesS(int id);

    @Select("select * from stuinf where id= #{id}")
    List<viewStu> view1(int id);
    @Select("select count(Kid) from stuinf where id= #{id}")
    int count1(int id);
    @Select("select count(id) from kcinf")
    int count2();
    @Select("select * from stuinf where id =#{id} limit #{pageNum},#{pageSize} ")
    List<viewStu> findP(int pageNum, int pageSize,int id);
    @Select("select * from kcinf limit #{pageNum},#{pageSize} ")
    List<viewk> findPK(int pageNum, int pageSize);
    @Insert("INSERT INTO xsxk VALUES(#{stuid},#{kcid},#{grade})")
    boolean inS(xsxk u);

}
