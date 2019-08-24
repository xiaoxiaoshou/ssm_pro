package cn.sfturing.service.backend.impl;

import cn.sfturing.dao.backend.BackendUserDao;
import cn.sfturing.entity.CommonUser;
import cn.sfturing.service.backend.BackendUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:03
 */
@Service
public class BackendUserServiceImpl implements BackendUserService {

    @Autowired
    private BackendUserDao backendUserDao;

    @Override
    public List<CommonUser> findAllUser(int start, int size) {

        return backendUserDao.findAllUser(start,size);
    }
}
