package org.example.stukc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "teat")
public class teacher{
    String id;
    String name;
    String password;
    String address;
    String jobt;
    int age;
    String sex;
    String speid;
}
