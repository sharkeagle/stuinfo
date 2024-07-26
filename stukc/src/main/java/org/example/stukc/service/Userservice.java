package org.example.stukc.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.stukc.entity.User;
import org.example.stukc.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class Userservice extends ServiceImpl<UserMapper,User> {
    private UserMapper User;
    public int saveU(User user){
        if(User.getId(user)==0){
            return User.insert(user);
        }
        else
            return User.update(user);
    }

}
