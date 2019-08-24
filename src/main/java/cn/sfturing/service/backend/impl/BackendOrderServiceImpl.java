package cn.sfturing.service.backend.impl;

import cn.sfturing.dao.backend.BackendOrderDao;
import cn.sfturing.entity.OrderRecords;
import cn.sfturing.service.backend.BackendOrderService;
import cn.sfturing.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-10 15:51
 */
@Service
public class BackendOrderServiceImpl implements BackendOrderService {

    @Autowired
    private BackendOrderDao backendOrderDao;


    @Override
    public List<OrderRecords> findAllOrder() {
        return backendOrderDao.findAllOrder();
    }

    @Override
    public  List<OrderRecords> findsAlreadyTreated() {
        return backendOrderDao.findsAlreadyTreated();
    }

    @Override
    public  List<OrderRecords> findsCancelled() {
        return backendOrderDao.findsCancelled();
    }

    @Override
    public  List<OrderRecords> findsBreakAppointment() {
        return backendOrderDao.findsBreakAppointment();
    }

    @Override
    public List<OrderRecords> selectWaitTreated() {
        return backendOrderDao.selectWaitTreated();
    }

    @Override
    public ResponseResult modifyOrderStatus(Integer id) {

        int status = backendOrderDao.modifyOrderStatus(id);
        if(status>0){
            return  ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }

    }

    @Override
    public List<OrderRecords> selectWaitTreatedByName(String userName) {
        return backendOrderDao.selectWaitTreatedByName(userName);
    }

    @Override
    public List<OrderRecords> findsAlreadyTreatedByName(String userName) {
        return backendOrderDao.findsAlreadyTreatedByName(userName);
    }

    @Override
    public List<OrderRecords> findsCancelledByName(String userName) {
        return backendOrderDao.findsCancelledByName(userName);
    }

    @Override
    public List<OrderRecords> findsBreakAppointmentByName(String userName) {
        return backendOrderDao.findsBreakAppointmentByName();
    }

    @Override
    public List<OrderRecords> findAllOrderByName(String userName) {
        return backendOrderDao.findAllOrderByName(userName);
    }
}
