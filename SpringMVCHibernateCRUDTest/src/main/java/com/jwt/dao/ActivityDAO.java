package com.jwt.dao;

import java.util.List;

import com.jwt.model.Activity;

public interface ActivityDAO {

    public void insert(Activity ActivityVO);
    public void update(Activity ActivityVO);
    public void delete(Integer activity_ID);
    // 查詢單筆
    public Activity findByPrimaryKey(Integer activity_ID);
    // 查詢全部筆數
    public List<Activity> getAll();
	
}
