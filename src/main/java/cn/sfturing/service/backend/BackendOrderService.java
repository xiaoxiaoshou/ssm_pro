package cn.sfturing.service.backend;

import cn.sfturing.entity.OrderRecords;
import cn.sfturing.utils.ResponseResult;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-10 15:49
 */
public interface BackendOrderService {
    /**
     * 查询所有预约订单
     * @return
     */
    List<OrderRecords> findAllOrder();

    List<OrderRecords> findsAlreadyTreated();

    List<OrderRecords> findsCancelled();

    List<OrderRecords> findsBreakAppointment();

    /**
     * 查询待就诊。。
     * @return
     */
    List<OrderRecords> selectWaitTreated();

    /**
     * 修改订单状态
     * @param id
     * @return
     */
    ResponseResult modifyOrderStatus(Integer id);

    /**
     * 查找对应医生的订单
     * @param userName
     * @return
     */
    List<OrderRecords> selectWaitTreatedByName(String userName);

    /**
     * 查找对应医生已经就诊的订单
     * @param userName
     * @return
     */
    List<OrderRecords> findsAlreadyTreatedByName(String userName);

    /**
     * 查找对应医生已取消的订单
     * @param userName
     * @return
     */
    List<OrderRecords> findsCancelledByName(String userName);

    /**
     * 查找爽约订单
     * @param userName
     * @return
     */
    List<OrderRecords> findsBreakAppointmentByName(String userName);

    List<OrderRecords> findAllOrderByName(String userName);
}
