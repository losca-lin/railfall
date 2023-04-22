package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 * 铁路线与铁路点
 * </p>
 */
@Getter
@Setter
  @TableName("railwayline_station")
@ApiModel(value = "RailwaylineStation对象", description = "铁路线与铁路点")
public class RailwaylineStation implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("铁路线id")
      private Integer rid;

      @ApiModelProperty("铁路点id")
      private Integer sid;


  public RailwaylineStation(Integer rid, Integer sid) {
    this.rid = rid;
    this.sid = sid;
  }

  public static long getSerialVersionUID() {
    return serialVersionUID;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getRid() {
    return rid;
  }

  public void setRid(Integer rid) {
    this.rid = rid;
  }

  public Integer getSid() {
    return sid;
  }

  public void setSid(Integer sid) {
    this.sid = sid;
  }
}
