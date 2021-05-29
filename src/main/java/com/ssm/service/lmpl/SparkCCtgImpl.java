package com.ssm.service.lmpl;


import com.ssm.dao.sparkCCtgDao;
import com.ssm.dao.sparkSalaryDao;
import com.ssm.model.SparkCCtg;
import com.ssm.model.SparkSalary;
import com.ssm.service.SparkCCtgService;
import com.ssm.service.SparkSalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SparkCCtgImpl implements SparkCCtgService {
    @Autowired
    private sparkCCtgDao sparkCCtgDao;
    public List<SparkCCtg> getAllSparkCCtg() {
        return sparkCCtgDao.getAllSparkCCtg();
    }
}
