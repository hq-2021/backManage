package com.example.backmanage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.backmanage.common.Result;
import com.example.backmanage.controller.dto.UserDTO;
import com.example.backmanage.entity.User;
import com.example.backmanage.mapper.UserMapper;
import com.example.backmanage.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hq
 * @since 2022-03-19
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    @Resource
    private IUserService userService;
    @Override
    public Result login(UserDTO userDTO) {
        QueryWrapper<User> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("username",userDTO.getUsername());
        queryWrapper.eq("password",userDTO.getPassword());
        User user =userService.getOne(queryWrapper);
        System.out.println(user);
        return Result.success(user);

    }



}
