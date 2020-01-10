package com.tudou.base.goods.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.tudou.system.platform.base.model.DataSourceRequest;
import com.tudou.system.platform.base.model.DataSourceResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tudou.base.goods.service.IGoodsTypeService;
import com.tudou.base.goods.mapper.GoodsTypeMapper;
import com.tudou.system.platform.base.service.impl.BaseServiceImpl;
import com.tudou.base.goods.entity.GoodsType;
import org.springframework.transaction.annotation.Transactional;
import com.tudou.system.platform.base.annotation.BaseResource;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Transactional(rollbackFor = Exception.class)
@Service("baseGoodsTypeService")
public class GoodsTypeServiceImpl extends BaseServiceImpl<GoodsType, String> implements IGoodsTypeService {

    @Resource
    @BaseResource
    private GoodsTypeMapper baseGoodsTypeMapper;

    @Override
    public List<GoodsType> loadGoodsTypeDate(String id) {
        return null;
    }

    @Override
    public DataSourceResult loadData(Class c, DataSourceRequest dataSourceRequest, HttpServletRequest request) {
        List<GoodsType> goodsTypes = baseGoodsTypeMapper.findAllGoodsTypeByIdIsNull();
        DataSourceResult dataSourceResult = new DataSourceResult();
        dataSourceResult.setData(goodsTypes);
        dataSourceResult.setTotal(goodsTypes.size());
        return dataSourceResult;
    }
}