package org.example.stukc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "xsxk")
public class xsxk {
    String stuid;
    String kcid;
    float grade;

}
