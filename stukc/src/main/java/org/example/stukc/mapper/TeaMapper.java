package org.example.stukc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.stukc.entity.viewStu;
import org.example.stukc.entity.viewtea;
import org.example.stukc.entity.viewteakc;

import java.util.List;
import java.util.Map;

@Mapper
public interface TeaMapper {
    void numB1(Map<String,Object> a);
    void numB2(Map<String,Object> a);
    @Select("select count(id) from teat where id=#{id} and password=#{password}")
    int gt(String id,String password);
    @Select("select * from viewtea where id=#{id}")
    viewtea MesStea(int id);
    @Select("select * from viewteakc where id=#{id} limit #{pageNum},#{pageSize}")
    List<viewteakc> MeStea(int pageNum,int pageSize,int id);
    @Select("select count(kcid) from viewteakc where id=#{id}")
    int countvkc(int id);

    @Select("select * from stuinf where Kid=#{kid} limit #{pageNum},#{pageSize}")
    List<viewStu> findP(int pageNum, int pageSize, int kid);
    @Select("select count(id) from stuinf where Kid=#{kid}")
    int countks(int kid);
}
