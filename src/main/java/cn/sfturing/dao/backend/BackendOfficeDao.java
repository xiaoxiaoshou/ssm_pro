package cn.sfturing.dao.backend;

import cn.sfturing.entity.Office;
import cn.sfturing.utils.ResponseResult;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:11
 */
public interface BackendOfficeDao {
    List<Office> findAllOffice();

    int addOffice(Office office);

    void modifyOffice(Office office);

    Office officeInfoReturn(Integer id);

    int  deleteOfficeById(Integer id);

    String findHospitalByOffice(String officeName);
}
