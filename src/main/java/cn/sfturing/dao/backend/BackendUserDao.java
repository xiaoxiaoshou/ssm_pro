package cn.sfturing.dao.backend;

import cn.sfturing.entity.CommonUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:04
 */
public interface BackendUserDao {

    List<CommonUser> findAllUser(@Param("start") int start, @Param("size") int size);
}
