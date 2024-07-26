package org.example.stukc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "kc")
public class kc {
    String id;
    String name;
    int yearD;
    int yearE;
    String teaId;
    float xuef;
    String  speid;
}
