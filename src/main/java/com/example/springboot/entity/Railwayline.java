package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 铁路线管理
 * </p>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "Railwayline对象", description = "铁路线管理")
public class Railwayline implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("负责人")
    private Integer uid;

    @ApiModelProperty("铁路线名称")
    private String name;

    @ApiModelProperty("铁路线等级")
    private String grade;

    private Integer tid;

    private String tname;

    @TableField(exist = false)
    private User user;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


}
