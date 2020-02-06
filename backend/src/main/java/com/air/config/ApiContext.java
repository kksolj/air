package com.air.config;

import com.google.common.collect.Maps;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class ApiContext {
    private static final String KEY_CURRENT_UID = "KEY_CURRENT_UID";
    private static final Map<String, Object> mContext = Maps.newConcurrentMap();

//    上下文設置一下UID
    public void setCurrentUID(String uid) {
        if(uid!=null){
            mContext.put(KEY_CURRENT_UID, uid);
        }
    }
    //從上下文獲取UID
    public String getCurrentUID() {
        return (String) mContext.get(KEY_CURRENT_UID);
    }
}
