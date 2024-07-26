package org.example.stukc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
@Data
@TableName(value = "stut")
public class student {
    String id;
    String name;
    String password;
    String sex;
    int age;
    String address;
    String facid;
}
