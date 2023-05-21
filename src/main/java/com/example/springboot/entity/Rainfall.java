package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 雨量信息表
 * </p>
 */
@Getter
@Setter
@ApiModel(value = "Rainfall对象", description = "雨量信息表")
public class Rainfall implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("车站id")
    private Integer sid;
    @ApiModelProperty("用户id")
    private Integer uid;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    @ApiModelProperty("采集时间")
    private LocalDateTime time;

    @ApiModelProperty("累计雨量(mm)")
    private String rainfallTital;

    @ApiModelProperty("水位(m)")
    private String water;

    @ApiModelProperty("雨量级别")
    private String rainfallRank;

    @ApiModelProperty("气温度数（摄氏度）")
    private String temperature;

    @TableField(exist = false)
    private Station station;
    @TableField(exist = false)
    private User user;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public String getRainfallTital() {
        return rainfallTital;
    }

    public void setRainfallTital(String rainfallTital) {
        this.rainfallTital = rainfallTital;
    }

    public String getWater() {
        return water;
    }

    public void setWater(String water) {
        this.water = water;
    }

    public String getRainfallRank() {
        return rainfallRank;
    }

    public void setRainfallRank(String rainfallRank) {
        this.rainfallRank = rainfallRank;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
