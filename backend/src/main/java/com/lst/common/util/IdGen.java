package com.lst.common.util;

import java.util.UUID;

/**
 * UUID 生成
 * @author lee
 */
public class IdGen {

    public static String uuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
