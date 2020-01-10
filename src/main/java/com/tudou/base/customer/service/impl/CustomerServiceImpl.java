package com.tudou.base.customer.service.impl;

import com.tudou.extra.system.AuthInfo;
import com.tudou.extra.system.UserInfoUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.tudou.base.customer.service.ICustomerService;
import com.tudou.base.customer.mapper.CustomerMapper;
import com.tudou.system.platform.base.service.impl.BaseServiceImpl;
import com.tudou.base.customer.entity.Customer;
import org.springframework.transaction.annotation.Transactional;
import com.tudou.system.platform.base.annotation.BaseResource;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

@Transactional(rollbackFor = Exception.class)
@Service("customerService")
public class CustomerServiceImpl extends BaseServiceImpl<Customer, String> implements ICustomerService {

    @Resource
    @BaseResource
    private CustomerMapper customerMapper;

    @Override
    public Customer save(Customer t) throws Exception {
        valid(t);
        if (null != customerMapper.selectByPrimaryKey(t)) {
            throw new Exception("客户编码重复!");
        }
        if (CollectionUtils.isNotEmpty(customerMapper.findCustomerByName(t.getCustomerName()))) {
            throw new Exception("客户名称重复!");
        }
        AuthInfo authInfo = UserInfoUtil.getCurrentAuthInfo();
        t.setCreateTime(new Date());
        t.setCreateEmpId(authInfo.getEmpId());
        t.setCreateEmp(authInfo.getEmpName());
        customerMapper.insert(t);
        return t;
    }

    @Override
    public void update(Customer t) throws Exception {
        valid(t);
        if (CollectionUtils.isNotEmpty(customerMapper.findCustomerByNameNotId(t.getCustomerName(), t.getId()))) {
            throw new Exception("客户名称重复!");
        }
        AuthInfo authInfo = UserInfoUtil.getCurrentAuthInfo();
        t.setModifyTime(new Date());
        t.setModifyEmpId(authInfo.getEmpId());
        t.setModifyEmp(authInfo.getEmpName());
        customerMapper.updateByPrimaryKey(t);
    }

    private void valid(Customer t) throws Exception {
        if (null == t) {
            throw new Exception("客户信息不能为空!");
        }
        if (StringUtils.isEmpty(t.getId())) {
            throw new Exception("客户编码不能为空!");
        }
        if (StringUtils.isEmpty(t.getCustomerName())) {
            throw new Exception("客户名称不能为空!");
        }
        if (StringUtils.isEmpty(t.getCustomerType())) {
            throw new Exception("客户类型不能为空!");
        }
        if (StringUtils.isEmpty(t.getCustomerEmpId())) {
            throw new Exception("客户负责人不能为空!");
        }
    }

}