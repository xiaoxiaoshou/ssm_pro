package cn.sfturing.dao.backend;

import cn.sfturing.entity.Doctor;
import cn.sfturing.entity.Office;
import cn.sfturing.utils.ResponseResult;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:10
 */
public interface BackendDoctorDao {
    List<Doctor> findAllDoctor(@Param("start") int start,@Param("size") int size);

    int addDoctor(Doctor doctor);

    Doctor findDoctorById(Integer id);

    int modifyDoctor(Doctor doctor);

    /**
     * 分页pageHelp
     * @return
     */
    List<Doctor> findAllDoctor1();
}
