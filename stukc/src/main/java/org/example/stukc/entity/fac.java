package org.example.stukc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "fac")
public class fac {
    String id;
    String name;
    String speid;
}
