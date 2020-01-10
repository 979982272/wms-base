package com.tudou.system.platform.dataBase.service.impl;

import com.tudou.system.platform.dataBase.mapper.DataBaseMapper;
import com.tudou.system.platform.dataBase.service.IDataBaseService;
import com.tudou.system.platform.dataBase.entity.DataBase;
import com.tudou.util.FreemakerUtil;
import com.tudou.util.PropertiesUtil;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/24 0024.
 */
@Service
public class DataBaseServiceImpl implements IDataBaseService {


    @Resource
    private DataBaseMapper dataBaseMapper;

    @Value("${generatorConfig.path}")
    private String generatorConfigPath;

    @Value("${java.path}")
    private String javaPath;

    @Value("${generatorConfig.ftl}")
    private String generatorConfigFtl;

    @Value("${controller.ftl}")
    private String controllerFtl;

    @Value("${service.ftl}")
    private String serviceFtl;

    @Value("${serviceImpl.ftl}")
    private String serviceImplFtl;

    @Override
    public List<DataBase> findDataBase() {
        return dataBaseMapper.showTables();
    }

    @Override
    public void createCode(String[] ids, String[] pack) throws Exception {
        for (int i = 0; i < ids.length; i++) {
            createJava(ids[i], pack[i]);
            createMybatis(ids[i], pack[i]);
        }
    }

    /**
     * 创建Mybatis
     *
     * @param table
     * @param pack
     * @throws Exception
     */
    private void createMybatis(String table, String pack) throws Exception {
        createMybatisConfig(table, pack);
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        // 设置读取的编码
        Reader reader = new BufferedReader(new InputStreamReader(new FileInputStream(generatorConfigPath), "utf-8"));
        ConfigurationParser cp = new ConfigurationParser(warnings);
        //加载配置文件
        org.mybatis.generator.config.Configuration config = cp.parseConfiguration(reader);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
                callback, warnings);
        myBatisGenerator.generate(null);
    }


    /**
     * 创建Mybatis配置文件
     *
     * @param table
     * @param pack
     * @throws Exception
     */
    private void createMybatisConfig(String table, String pack) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("table", table);
        map.put("path", javaPath);
        map.put("pack", transPack(pack));
        String jdbcUrl = PropertiesUtil.getValue("jdbc.url");
        jdbcUrl = jdbcUrl.replaceAll("\\&", "&amp;");
        map.put("jdbcDriver", PropertiesUtil.getValue("jdbc.driver"));
        map.put("jdbcUrl", jdbcUrl);
        map.put("jdbcUsername", PropertiesUtil.getValue("jdbc.username"));
        map.put("jdbcPassword", PropertiesUtil.getValue("jdbc.password"));
        FreemakerUtil.createFileByFreemaker(map, generatorConfigFtl, generatorConfigPath, null);
    }

    /**
     * 创建Java文件
     *
     * @param name
     * @param pack
     * @throws Exception
     */
    private void createJava(String name, String pack) throws Exception {
        createControllerJava(name, pack);
        createServiceJava(name, pack);
        createServiceImplJava(name, pack);
    }

    /**
     * 创建控制器文件
     *
     * @param name
     * @param pack
     * @throws Exception
     */
    private void createControllerJava(String name, String pack) throws Exception {
        String controllerPath = null;
        if (pack.indexOf(".") > 0) {
            controllerPath = "/" + pack.replaceAll("\\.", "/");
        } else {
            controllerPath = "/" + pack;
        }
        pack = transPack(pack);
        name = transFileName(name, pack);
        String folderPath = transFloderByPack(pack);
        folderPath += "\\controller";
        String filePath = folderPath + "\\" + name + "Controller.java";
        Map<String, String> map = new HashMap<>();
        map.put("classPack", pack);
        map.put("className", name);
        map.put("controllerPath", controllerPath);
        FreemakerUtil.createFileByFreemaker(map, controllerFtl, filePath, folderPath);
    }

    /**
     * 创建服务层文件
     *
     * @param name
     * @param pack
     */
    private void createServiceJava(String name, String pack) throws Exception {
        pack = transPack(pack);
        name = transFileName(name, pack);
        String folderPath = transFloderByPack(pack);
        folderPath += "\\service";
        String filePath = folderPath + "\\I" + name + "Service.java";
        Map<String, String> map = new HashMap<>();
        map.put("classPack", pack);
        map.put("className", name);
        FreemakerUtil.createFileByFreemaker(map, serviceFtl, filePath, folderPath);
    }

    private void createServiceImplJava(String name, String pack) throws Exception {
        pack = transPack(pack);
        name = transFileName(name, pack);
        String folderPath = transFloderByPack(pack);
        folderPath += "\\service\\impl";
        String filePath = folderPath + "\\" + name + "ServiceImpl.java";
        Map<String, String> map = new HashMap<>();
        map.put("classPack", pack);
        map.put("className", name);
        FreemakerUtil.createFileByFreemaker(map, serviceImplFtl, filePath, folderPath);
    }

    /**
     * 转换文件名称
     *
     * @param name
     * @param pack
     * @return
     */
    private String transFileName(String name, String pack) {
        //将第一个字母转换成大写
        String first = name.substring(0, 1);
        name = first.toUpperCase() + name.substring(1, name.length());
        int j = 0;
        String value = null;
        String temValue = null;
        for (int i = name.indexOf("_"); i > 0; i--) {
            if (name.indexOf("_") > 0) {
                value = name.substring(i + 1, i + 2);
                name = name.substring(0, i) + value.toUpperCase() + name.substring(i + 2, name.length());
                i = -1;
                name = transFileName(name, pack);
            }
        }
        return name;
    }

    /**
     * 将报名替换成文件夹路径
     *
     * @param pack
     * @return
     */
    private String transFloderByPack(String pack) {
        String folderPath = "";
        // 将包名替换成文件夹路径
        if (pack.indexOf(".") > 0) {
            folderPath = pack.replaceAll("\\.", "\\\\");
        }
        folderPath = javaPath + "\\" + folderPath;
        return folderPath;
    }

    /**
     * 转换包名
     *
     * @param pack
     * @return
     */
    private String transPack(String pack) {
        if (pack.indexOf("com.tudou") == -1) {
            pack = "com.tudou." + pack;
        }
        return pack;
    }

}
