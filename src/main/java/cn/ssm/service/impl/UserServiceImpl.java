package cn.ssm.service.impl;

import cn.ssm.dao.UserDao;
import cn.ssm.entity.User;
import cn.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> findAll() throws Exception {
        return userDao.findAll();
    }

    @Override
    public User query(int id) {
        return userDao.query(id);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }


    @Override
    public List<User> selectAllUser() throws Exception {
        return userDao.selectAllUser();
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }
}
