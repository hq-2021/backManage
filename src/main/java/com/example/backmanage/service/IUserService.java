package com.example.backmanage.service;

import com.example.backmanage.common.Result;
import com.example.backmanage.controller.dto.UserDTO;
import com.example.backmanage.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hq
 * @since 2022-03-19
 */
public interface IUserService extends IService<User> {

   public Result login(UserDTO userDTO) ;
}
