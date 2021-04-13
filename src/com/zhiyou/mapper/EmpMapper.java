package com.zhiyou.mapper;

import com.zhiyou.model.Emp;

import java.util.List;
import java.util.Map;

public interface EmpMapper {
    int insert(Emp record);

    int insertSelective(Emp record);

    List<Emp> findAll(Map<String,Object> map);

    void add(Emp emp);

    void delete(int empno);

    Emp findOne(int empno);

    void updateEmp(Emp emp);

    void batchDelete(int[] checkedIds);
}