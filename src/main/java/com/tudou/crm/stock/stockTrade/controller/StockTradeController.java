package com.tudou.crm.stock.stockTrade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import com.tudou.crm.stock.stockTrade.service.IStockTradeService;
import org.springframework.web.bind.annotation.RequestMethod;
import com.tudou.system.platform.base.controller.BaseCurdController;
import com.tudou.crm.stock.stockTrade.entity.StockTrade;
import com.tudou.system.platform.base.annotation.BaseResource;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tudou.system.platform.base.model.StatusModel;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/crm/stock/stockTrade")
public class StockTradeController extends BaseCurdController<StockTrade>{

    @Resource
    @BaseResource
    private IStockTradeService stockTradeLogService;

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
