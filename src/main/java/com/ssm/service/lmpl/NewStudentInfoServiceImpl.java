package com.ssm.service.lmpl;

import com.ssm.dao.newStudentInfoDao;
import com.ssm.model.NewStudent;
import com.ssm.service.NewStudentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NewStudentInfoServiceImpl implements NewStudentInfoService {
    @Autowired
    private newStudentInfoDao studentInfoDao;
    public List<NewStudent> getAllStudent() {
        return studentInfoDao.getAllStudent();
    }
}
