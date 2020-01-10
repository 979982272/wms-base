package com.tudou.common.controller;

import com.tudou.base.emp.service.IEidpEmpService;
import com.tudou.system.platform.base.annotation.BaseResource;
import com.tudou.system.platform.base.controller.BaseController;
import com.tudou.system.platform.base.model.DataSourceRequest;
import com.tudou.system.platform.base.model.DataSourceResult;
import com.tudou.system.platform.base.model.StatusModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tudou.system.platform.base.controller.BaseCurdController;

import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Resource
    private IEidpEmpService eidpEmpService;

    @RequestMapping(value = "valid", method = RequestMethod.POST)
    @ResponseBody
    public StatusModel valid(@RequestParam(value = "userName", required = true) String userName,
                             @RequestParam(value = "password", required = true) String password) {
        StatusModel statusModel = null;
        try {
            eidpEmpService.valid(userName, password);
            statusModel = new StatusModel(true, "登录成功!");
        } catch (Exception e) {
            statusModel = new StatusModel(false, e.getMessage());
        }
        return statusModel;
    }

}
