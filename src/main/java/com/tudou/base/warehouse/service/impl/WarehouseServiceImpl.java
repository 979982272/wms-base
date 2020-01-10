package com.tudou.base.warehouse.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.tudou.base.warehouse.service.IWarehouseService;
import com.tudou.base.warehouse.mapper.WarehouseMapper;
import com.tudou.system.platform.base.service.impl.BaseServiceImpl;
import com.tudou.base.warehouse.entity.Warehouse;
import org.springframework.transaction.annotation.Transactional;
import com.tudou.system.platform.base.annotation.BaseResource;

@Transactional(rollbackFor = Exception.class)
@Service("warehouseService")
public class WarehouseServiceImpl extends BaseServiceImpl<Warehouse,String> implements IWarehouseService{

    @Resource
    @BaseResource
    private WarehouseMapper warehouseMapper;

}