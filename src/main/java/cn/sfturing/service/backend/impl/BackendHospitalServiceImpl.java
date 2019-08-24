package cn.sfturing.service.backend.impl;

import cn.sfturing.dao.backend.BackendHospitalDao;
import cn.sfturing.entity.Hospital;
import cn.sfturing.service.backend.BackendHospitalService;
import cn.sfturing.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:08
 */
@Service
public class BackendHospitalServiceImpl implements BackendHospitalService {

    @Autowired
    private BackendHospitalDao backendHospitalDao;

    @Override
    public List<Hospital> findAllHospital() {
        return backendHospitalDao.findAllHospital();
    }

    @Override
    public ResponseResult addHospital(Hospital hospital) {

        int status = backendHospitalDao.addHospital(hospital);

        if(status>0){
            System.out.println("添加医院成功");
         return  ResponseResult.success();
        }else{
            System.out.println("添加医院失败");
           return  ResponseResult.fail();
        }
    }

    @Override
    public ResponseResult findOfficesByHospitalName(String hospitalName) {

        List<String> list = backendHospitalDao.findOfficesByHospitalName(hospitalName);

        for (String officeName : list){
            System.out.println(officeName+"list------officeName");
        }

        if(list!=null){
            return ResponseResult.success(list);
        }else{
            return ResponseResult.fail();
        }
    }

    @Override
    public ResponseResult modifyHospital(Hospital hospital) {

        int status =  backendHospitalDao.modifyHospital(hospital);
        if(status>0){
            System.out.println("修改成功");
            return ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }
    }

    @Override
    public Hospital selectHospitalById(int id) {
        return backendHospitalDao.selectHospitalById(id);
    }

}
