package com.air.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class commonUitls {
    //获取当前时间 yyyy-MM-dd kk:mm:ss
    public static String getTime(){
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss ");
        return sdf.format(d);
    }


    //获取当前时间 yyyy-MM-dd
    public static String getDay(){
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return sdf.format(d);
    }

    //得到32位的uuid
    public static String getUUID32(){
        return UUID.randomUUID().toString().replace("-", "").toLowerCase();

    }



}
