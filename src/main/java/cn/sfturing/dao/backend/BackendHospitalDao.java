package cn.sfturing.dao.backend;

import cn.sfturing.entity.Hospital;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:10
 */
public interface BackendHospitalDao {
    List<Hospital> findAllHospital();

    int addHospital(Hospital hospital);

    List<String> findOfficesByHospitalName(String hospitalName);

    int modifyHospital(Hospital hospital);

    Hospital selectHospitalById(int id);
}
