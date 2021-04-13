package com.zhiyou.service.impl;

import com.zhiyou.mapper.EmpMapper;
import com.zhiyou.model.Emp;
import com.zhiyou.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Emp> findAll(Map<String,Object> map) {



        return empMapper.findAll(map);
    }

    @Override
    public void add(Emp emp) {
        empMapper.add(emp);
    }

    @Override
    public void delete(int empno) {
        empMapper.delete(empno);
    }

    @Override
    public Emp findOne(int empno) {
        return empMapper.findOne(empno);
    }

    @Override
    public void updateEmp(Emp emp) {
        empMapper.updateEmp(emp);
    }

    @Override
    public void batchDelete(int[] checkedIds) {
        empMapper.batchDelete(checkedIds);
    }
}
