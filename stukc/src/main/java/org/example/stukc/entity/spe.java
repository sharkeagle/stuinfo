package org.example.stukc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "spe")
public class spe {
    String id;
    String name;
}
