package com.lst.config;

import com.google.common.collect.Maps;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class ApiContext {
    private static final String KEY_CURRENT_STORE_ID = "KEY_CURRENT_STORE_ID";
    private static final Map<String, Object> mContext = Maps.newConcurrentMap();

    public void setCurrentStoreId(String storeId) {
        if(storeId!=null){
            mContext.put(KEY_CURRENT_STORE_ID, storeId);
        }
    }

    public String getCurrentStoreId() {
        return (String) mContext.get(KEY_CURRENT_STORE_ID);
    }
}