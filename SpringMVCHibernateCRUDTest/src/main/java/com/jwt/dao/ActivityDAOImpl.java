package com.jwt.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.jwt.model.Activity;

@Component
public class ActivityDAOImpl implements ActivityDAO {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Override
	public void insert(Activity ActivityVO) {
		hibernateTemplate.save(ActivityVO);
	}

	@Override
	public void update(Activity ActivityVO) {
		hibernateTemplate.update(ActivityVO);
	}

	@Override
	public void delete(Integer activity_ID) {
		hibernateTemplate.delete(hibernateTemplate.load(Activity.class, activity_ID));
	}

	@Override
	public Activity findByPrimaryKey(Integer activity_ID) {
		return hibernateTemplate.load(Activity.class, activity_ID);
	}

	@Override
	public List<Activity> getAll() {
		return hibernateTemplate.loadAll(Activity.class);
	}

}