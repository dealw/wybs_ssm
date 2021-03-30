package com.wy.DateUtil;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    //日期转字符串
    public static String dateToString(Date date, String patt){
        SimpleDateFormat sdf=new SimpleDateFormat(patt);
        String res = sdf.format(date);
        return res;
    }
}
