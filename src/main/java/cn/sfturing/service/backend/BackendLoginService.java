package cn.sfturing.service.backend;

import cn.sfturing.entity.Admininstrator;
import cn.sfturing.utils.ResponseResult;

/**
 * @author eRunn
 * @create 2019-03-13 14:00
 */
public interface BackendLoginService {

    /**
     * 登录
     * @param admininstrator
     * @return
     */
    ResponseResult login(Admininstrator admininstrator);

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     */
    ResponseResult selectAdminById(Integer id);
}
