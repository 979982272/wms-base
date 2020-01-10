package com.tudou.crm.stock.stockPart.controller;

import com.tudou.base.goods.entity.Goods;
import com.tudou.system.platform.base.model.DataSourceRequest;
import com.tudou.system.platform.base.model.DataSourceResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tudou.crm.stock.stockPart.service.IStockPartService;
import com.tudou.system.platform.base.controller.BaseCurdController;
import com.tudou.crm.stock.stockPart.entity.StockPart;
import com.tudou.system.platform.base.annotation.BaseResource;
import com.tudou.system.platform.base.model.StatusModel;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/crm/stock/stockPart")
public class StockPartController extends BaseCurdController<StockPart> {

    @Resource
    @BaseResource
    private IStockPartService stockPartService;

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

    @RequestMapping(value = "loadSelectGoodsData")
    @ResponseBody
    public DataSourceResult loadSelectGoodsData(@RequestBody DataSourceRequest dataSourceRequest, HttpServletRequest request) {
        DataSourceResult dataSourceResult = new DataSourceResult();
        String warehouseId = request.getParameter("warehouseId");
        try {
            dataSourceResult = stockPartService.loadSelectGoodsData(dataSourceRequest,warehouseId);
        } catch (Exception e) {
            logger.error(e.getLocalizedMessage(),e);
            e.printStackTrace();
        }
        return dataSourceResult;
    }
}
