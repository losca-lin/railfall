package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 * 车站信息表
 * </p>
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
  @ApiModel(value = "Station对象", description = "车站信息表")
public class Station implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("车站名称")
      private String name;

      @ApiModelProperty("车站位置")
      private String location;

      @ApiModelProperty("车站面积")
      private String area;

      @ApiModelProperty("车站详情")
      private String details;

      private String img;
  private String longitude;
  private String latitude;
  private Integer uid;

  private Integer gid;
  private String gname;

  @TableField(exist = false)
  private User user;
}
