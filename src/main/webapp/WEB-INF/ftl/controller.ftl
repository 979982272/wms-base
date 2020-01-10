package ${classPack}.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import ${classPack}.service.I${className}Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import com.tudou.system.platform.base.controller.BaseCurdController;
import ${classPack}.entity.${className};
import com.tudou.system.platform.base.annotation.BaseResource;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tudou.system.platform.base.model.StatusModel;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("${controllerPath}")
public class ${className}Controller extends BaseCurdController<${className}>{

    @Resource
    @BaseResource
    private I${className}Service ${className?uncap_first}Service;

    /**
    * 初始化
    *
    * @return
    */
    @RequestMapping(value = "/getDefaultInfo", method = RequestMethod.POST)
    @ResponseBody
    public StatusModel getDefaultInfo() {
        Map<String, Object> info = new HashMap<>();
        StatusModel statusModel = new StatusModel(true, info);
        return statusModel;
    }
}
