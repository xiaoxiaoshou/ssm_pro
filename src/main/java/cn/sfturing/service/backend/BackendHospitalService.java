package cn.sfturing.service.backend;

import cn.sfturing.entity.Hospital;
import cn.sfturing.utils.ResponseResult;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:06
 */
public interface BackendHospitalService {
    List<Hospital> findAllHospital();

    /**
     * 添加医院
     * @param hospital
     * @return
     */
    ResponseResult addHospital(Hospital hospital);


    ResponseResult findOfficesByHospitalName(String hospitalName);

    /**
     * 修改医院信息
     * @param hospital
     * @return
     */
    ResponseResult modifyHospital(Hospital hospital);

    /**
     * 通过id查找医院信息并回显
     * @param id
     * @return
     */
    Hospital selectHospitalById(int id);
}
