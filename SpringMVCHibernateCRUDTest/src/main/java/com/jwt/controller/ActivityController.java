package com.jwt.controller;

import com.jwt.model.Activity;
import com.jwt.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;


@Controller
public class ActivityController {


    public ActivityController() {
        System.out.println("ActivityController()");
    }

    @Autowired
    ActivityService activityService;

    @RequestMapping(value = {"/", "/listAllActivity"}, method = RequestMethod.GET)
    public ModelAndView homePage(ModelAndView model) {
        model.addObject("activity", activityService.getAll());
        model.setViewName("listAllActivity");
        return model;
    }

    @RequestMapping("/addActivity")
    @Transactional
    public ModelAndView addOrEditActivity(@RequestParam(required = false) Integer activity_ID, ModelAndView model) {
        if (activity_ID == null) {
            model.addObject("isUpdate", false);
            model.addObject("activity_ID", 0);
        } else {
            Activity activity = activityService.findByPrimaryKey(activity_ID);
            model.addObject("isUpdate", true);
            model.addObject("activity_ID", activity.getActivity_ID());
            model.addObject("activity_name", activity.getActivity_name());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addObject("activity_start", sdf.format(activity.getActivity_start()));
            model.addObject("activity_end", sdf.format(activity.getActivity_end()));
            model.addObject("activity_content", activity.getActivity_content());
        }
        model.setViewName("addActivity");
        return model;
    }


    @RequestMapping(value = "/insertActivity", method = RequestMethod.POST)
    public ModelAndView addActivity(@ModelAttribute Activity activity) {
        if (activity.getActivity_ID() == 0) { // if activity_id is 0 then creating,other updating the employee
            activityService.insert(activity);
        } else {
            activityService.update(activity);
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/deleteActivity", method = RequestMethod.POST)
    public ModelAndView deleteActivity(Integer activity_ID, ModelAndView model) {
        activityService.delete(activity_ID);
        model.setViewName("redirect:/");
        return model;
    }
}