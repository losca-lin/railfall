package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 铁路线管理
 * </p>
 */
@Getter
@Setter
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

  @TableField(exist = false)
  private User user;
  @TableField(exist = false)
  private List<Station> stationList;
  @TableField(exist = false)
  private List<Integer> stationListid;

  public static long getSerialVersionUID() {
    return serialVersionUID;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getUid() {
    return uid;
  }

  public void setUid(Integer uid) {
    this.uid = uid;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getGrade() {
    return grade;
  }

  public void setGrade(String grade) {
    this.grade = grade;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public List<Station> getStationList() {
    return stationList;
  }

  public void setStationList(List<Station> stationList) {
    this.stationList = stationList;
  }

  public List<Integer> getStationListid() {
    return stationListid;
  }

  public void setStationListid(List<Integer> stationListid) {
    this.stationListid = stationListid;
  }
}
