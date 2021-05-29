package com.ssm.service.lmpl;


import com.ssm.dao.sparkSalaryDao;
import com.ssm.model.SparkSalary;
import com.ssm.service.SparkSalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SparkSalaryImpl implements SparkSalaryService {
    @Autowired
    private sparkSalaryDao sparkSalaryDao;
    public List<SparkSalary> getAllSparkSalary() {
        return sparkSalaryDao.getAllSparkSalary();
    }
}
