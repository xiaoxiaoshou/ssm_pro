package cn.sfturing.service.backend.impl;

import cn.sfturing.dao.backend.BackendLoginDao;
import cn.sfturing.entity.Admininstrator;
import cn.sfturing.service.backend.BackendLoginService;
import cn.sfturing.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

/**
 * @author eRunn
 * @create 2019-03-13 14:01
 */
@Service
public class BackendLoginServiceImpl implements BackendLoginService {

    @Autowired
    private BackendLoginDao backendLoginDao;

    @Override
    public ResponseResult login(Admininstrator admininstrator) {

        Admininstrator admininstrator1 = backendLoginDao.login(admininstrator);


        if(admininstrator1!=null){
            return   ResponseResult.success(admininstrator1);
        }else{
            return  ResponseResult.fail("用户名或密码错误");
        }
    }

    @Override
    public ResponseResult selectAdminById(Integer id) {
        return ResponseResult.success(backendLoginDao.selectAdminById(id));
    }
}
