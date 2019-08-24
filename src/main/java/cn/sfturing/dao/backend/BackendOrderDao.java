package cn.sfturing.dao.backend;

import cn.sfturing.entity.OrderRecords;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-10 15:54
 */
public interface BackendOrderDao {
    /**
     * 查询所有预约记录
     * @return
     */
    List<OrderRecords> findAllOrder();

    List<OrderRecords> findsAlreadyTreated();

    List<OrderRecords> findsCancelled();

    List<OrderRecords> findsBreakAppointment();

    List<OrderRecords> selectWaitTreated();

    int modifyOrderStatus(Integer id);

    List<OrderRecords> selectWaitTreatedByName(String userName);

    List<OrderRecords> findsBreakAppointmentByName();

    List<OrderRecords> findsCancelledByName(String userName);

    List<OrderRecords> findsAlreadyTreatedByName(String userName);

    List<OrderRecords> findAllOrderByName(String userName);
}
