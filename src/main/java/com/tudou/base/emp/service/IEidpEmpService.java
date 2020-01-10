package com.tudou.base.emp.service;

import com.tudou.system.platform.base.service.IBaseService;
import com.tudou.base.emp.entity.EidpEmp;

public interface IEidpEmpService extends IBaseService<EidpEmp, String> {

    String getCreateEidpEmpId();

    /**
     * 验证登录
     *
     * @param userName
     * @param password
     * @throws Exception
     */
    void valid(String userName, String password) throws Exception;
}
