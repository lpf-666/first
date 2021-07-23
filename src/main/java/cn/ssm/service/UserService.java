package cn.ssm.service;

import cn.ssm.entity.User;

import java.util.List;

public interface UserService {
    List<User> findAll() throws Exception;
    User query(int id);
    int addUser(User user);
    List<User> selectAllUser() throws Exception;
    int updateUser(User user);
    int deleteUser(int id);

}
