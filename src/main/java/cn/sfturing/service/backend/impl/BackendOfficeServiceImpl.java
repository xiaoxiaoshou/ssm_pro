package cn.sfturing.service.backend.impl;

import cn.sfturing.dao.backend.BackendOfficeDao;
import cn.sfturing.entity.Hospital;
import cn.sfturing.entity.Office;
import cn.sfturing.service.backend.BackendOfficeService;
import cn.sfturing.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:08
 */
@Service
public class BackendOfficeServiceImpl implements BackendOfficeService {

    @Autowired
    private BackendOfficeDao backendOfficeDao;

    /**
     * 查询科室
     * @return
     */
    @Override
    public List<Office> findAllOffice() {
        return backendOfficeDao.findAllOffice();
    }

    /**
     * 添加科室
     * @param office
     * @return
     */
    @Override
    public ResponseResult addOffice(Office office) {

        int status = backendOfficeDao.addOffice(office);

        if(status>0){
            return  ResponseResult.success("添加成功");
        }else{
            return ResponseResult.fail("添加失败");
        }
    }

    /**
     * 修改科室信息
     * @param office
     * @return
     */
    @Override
    public ResponseResult modifyOffice(Office office) {
        backendOfficeDao.modifyOffice(office);
        return ResponseResult.success();
    }

    /**
     * 科室信息回显
     * @param id
     * @return
     */
    @Override
    public Office officeInfoReturn(Integer id) {
        return backendOfficeDao.officeInfoReturn(id);
    }

    @Override
    public ResponseResult deleteOfficeById(Integer id) {

       int status =  backendOfficeDao.deleteOfficeById(id);

       if(status>0){
        return  ResponseResult.success();
       }else{
          return ResponseResult.fail();
       }

    }

    @Override
    public ResponseResult findHospitalByOffice(String officeName) {

        String hospitalName = backendOfficeDao.findHospitalByOffice(officeName);

        Hospital hospital = new Hospital();
        hospital.setHospitalName(hospitalName);

        System.out.println(hospitalName+"****级联医院名字****"+hospitalName);

        if(hospitalName!=null){
            return  ResponseResult.success(hospital);
        }else{
           return ResponseResult.fail();
        }


    }
}
