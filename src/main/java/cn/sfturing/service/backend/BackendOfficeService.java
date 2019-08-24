package cn.sfturing.service.backend;

import cn.sfturing.entity.Office;
import cn.sfturing.utils.ResponseResult;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:06
 */
public interface BackendOfficeService {

    List<Office> findAllOffice();

    ResponseResult addOffice(Office office);

    ResponseResult modifyOffice(Office office);

    Office officeInfoReturn(Integer id);

    ResponseResult deleteOfficeById(Integer id);

    /**
     * 通过科室查找医院
     * @param officeName
     * @return
     */
    ResponseResult findHospitalByOffice(String officeName);
}
