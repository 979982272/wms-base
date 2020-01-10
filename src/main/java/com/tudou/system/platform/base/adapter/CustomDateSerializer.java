package com.tudou.system.platform.base.adapter;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期格式化
 *
 * @author weihua
 * @create 2017-05-10下午 4:01
 */
public class CustomDateSerializer extends JsonSerializer<Date> {

    // 使用方法:@JsonSerialize(using = CustomDateSerializer.class) 在Date类型的get方法上
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    @JsonSerialize(using = CustomDateSerializer.class)
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") yyyy-MM-dd HH:mm:ss
    @Override
    public void serialize(Date value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonProcessingException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//只能转换为yyyy-MM-dd 如果转换成yyyy-MM-dd hh:ss:xx这种时分秒格式保存会报错
        jgen.writeString(sdf.format(value));
    }
}
