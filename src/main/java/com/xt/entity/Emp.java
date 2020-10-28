package com.xt.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.util.Date;

@Data
//@TableName("tbl_emp")
public class Emp {
//    @TableId(type = IdType.AUTO)
    @TableId
    private Integer empno;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String eName;
    private String job;
    private Integer mgr;
    private Date hiredate;
    private Double sal;
    private Double comm;
    private Integer deptno;
    @Version
    private Integer version;
}
