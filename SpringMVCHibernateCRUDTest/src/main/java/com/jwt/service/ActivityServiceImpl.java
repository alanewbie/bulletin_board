package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.ActivityDAO;
import com.jwt.model.Activity;


@Service
@Component
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDAO activityDao;

	@Override
	@Transactional
	public void insert(Activity ActivityVO) {
		activityDao.insert(ActivityVO);
	}

	@Override
	@Transactional
	public void update(Activity ActivityVO) {
		activityDao.update(ActivityVO);
	}

	@Override
	@Transactional
	public void delete(Integer activity_ID) {
		activityDao.delete(activity_ID);
	}

	@Override
	public Activity findByPrimaryKey(Integer activity_ID) {
		return activityDao.findByPrimaryKey(activity_ID);
	}

	@Override
	public List<Activity> getAll() {
		return activityDao.getAll();
	}

	
}
