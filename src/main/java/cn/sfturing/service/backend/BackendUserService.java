package cn.sfturing.service.backend;

import cn.sfturing.entity.CommonUser;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:02
 */
public interface BackendUserService {
    List<CommonUser> findAllUser(int start, int size);
}
