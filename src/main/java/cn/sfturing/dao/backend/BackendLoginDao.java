package cn.sfturing.dao.backend;

import cn.sfturing.entity.Admininstrator;

/**
 * @author eRunn
 * @create 2019-03-13 14:16
 */
public interface BackendLoginDao {

    Admininstrator login(Admininstrator admininstrator);

    /**
     * 添加医生同时添加医生管理用户
     * 医生管理密码默认为123456
     * @param userName
     * @return
     */
    int addAdminisator(String userName);

    Object selectAdminById(Integer id);
}
