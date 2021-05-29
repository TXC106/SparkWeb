package com.ssm.controller;

import com.ssm.model.NewStudent;
import com.ssm.model.SparkCCtg;
import com.ssm.model.SparkSalary;
import com.ssm.model.sorceResult;
import com.ssm.service.NewStudentInfoService;
import com.ssm.service.SparkCCtgService;
import com.ssm.service.SparkSalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EchartsController {
    @Autowired
    private NewStudentInfoService newStudentInfoService;
    @Autowired
    private SparkSalaryService sparkSalaryService;
    @Autowired
    private SparkCCtgService sparkCCtgService;

    //��ҳ��״ͼ
    @RequestMapping(value = "/hello")
    @ResponseBody
    public List<SparkCCtg> page() {
        //list��ȡsql����
//		List<NewStudent> newStudents = newStudentInfoService.getAllStudent();
//		System.out.println("helloҳ����������:" + newStudents.size());
//		System.out.println("��״ͼ��������:" +newStudents.toString());
        List<SparkCCtg> sparkCCtgs = sparkCCtgService.getAllSparkCCtg();
        System.out.println("helloҳ����������:" + sparkCCtgs.size());
        System.out.println("��״ͼ��������:" +sparkCCtgs.toString());

        return sparkCCtgs;
    }

    @RequestMapping(value = "/getScore")
    @ResponseBody
    public List<Integer> getScore() {
        List<NewStudent> newStudents = newStudentInfoService.getAllStudent();
        List<Integer> scores = null;
        for (NewStudent newStudent : newStudents) {
            scores.add(newStudent.getScore());
        }
        System.out.println("��ͼ��������:" +scores.toString());
        return scores;
    }

    @RequestMapping(value = "/myeCharts")
    public String myeCharts() {
        return "Hello";
    }

    @RequestMapping(value = "/getPieCharts")
    public String getPieCharts() {
        return "PieCharts";
    }

    @RequestMapping(value = "/getLineCharts")
    public String getLineCharts() {
        return "LineCharts";
    }

    @RequestMapping(value = "/getMapCharts")
    public String getMapCharts() {
        return "MapCharts";
    }



    @RequestMapping(value = "/getData")
    @ResponseBody
    public List<sorceResult> getData() {
        List<NewStudent> students = newStudentInfoService.getAllStudent();
        List<sorceResult> results = new ArrayList<sorceResult>();
        for (NewStudent newStudent : students) {
            // ��ѧ���ĳɼ���������װ��һ��result
            sorceResult result = new sorceResult(newStudent.getScore(), newStudent.getName());
            results.add(result);
        }
        System.out.println("json����:"+results);
        return results;
    }

    @RequestMapping(value = "/getSPieCharts")
    public String getSPieCharts() {
        return "SalaryPieCharts";
    }

    @RequestMapping(value = "/getSData")
    @ResponseBody
    public List<sorceResult> getSData() {
        List<SparkSalary> sparkSalaries = sparkSalaryService.getAllSparkSalary();
        List<sorceResult> results = new ArrayList<sorceResult>();
        for (SparkSalary sparkSalary : sparkSalaries) {
            sorceResult result = new sorceResult(sparkSalary.getSnum(), sparkSalary.getSalary());
            results.add(result);
        }
        System.out.println("json����:"+results);
        return results;
    }


    @RequestMapping(value = "/getSScore")
    @ResponseBody
    public List<Integer> getSScore() {
        List<SparkSalary> sparkSalaries = sparkSalaryService.getAllSparkSalary();
        List<Integer> scores = null;
        for (SparkSalary sparkSalary : sparkSalaries) {
            scores.add(sparkSalary.getSnum());
        }
        System.out.println("��ͼ��������:" +scores.toString());
        return scores;
    }

}
