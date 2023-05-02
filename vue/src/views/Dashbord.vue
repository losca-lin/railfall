<template>
  <div>
    <el-row :gutter="10" style="margin-bottom: 60px">
      <el-col :span="6">
        <el-card style="color: #409EFF">
          <div><i class="el-icon-user-solid" /> 车站数量</div>
          <div style="padding: 10px 0; text-align: center; font-weight: bold">
            {{statio}}
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card style="color: #F56C6C">
          <div><i class="el-icon-money" /> 铁路点管理员数量</div>
          <div style="padding: 10px 0; text-align: center; font-weight: bold">
            {{user}}
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row>
      <el-col :span="24">
        <div id="main1" style="width: 1000px; height: 450px"></div>
      </el-col>
      <el-select v-model="name" placeholder="请选择" style="padding: 10px;">
            <el-option
              v-for="item in listdata"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>


          <el-date-picker v-model="time" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker>

      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>

      <el-col :span="24">
        <div id="main" style="width: 1000px; height: 450px"></div>
      </el-col>


    </el-row>

  </div>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: "Home",
  data() {
    return {
      listdata:[],
      name:'123',
      statio:'',
      user:'',
      time: ''
    }
  },
  mounted() {  // 页面元素渲染之后再触发
    
    this.list()
    
  },
  methods: {
    // 获取所有的数据 
    list() {
      this.request.get("/station").then(res => {
        this.listdata = res.data
        this.name=res.data[0].id
        this.load();
      })
    },
    load(){
      // if(!this.time){
      //   this.$message.error("请输入时间")
      //   return;
      // }
      var option = {
      title: {
        text: '车站雨量信息统计图',
        subtext: '折线图',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'right'
      },
      xAxis: {
        type: 'category',
        data: []
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          name: "降雨量",
          data: [],
          type: 'line'
        },
        {
          name: "湿度",
          data: [],
          type: 'line'
        },
        {
          name: "温度",
          data: [],
          type: 'line'
        }
      ]
    };
    var option1 = {
      title: {
        text: '近30天车站雨量信息统计图',
        subtext: '折线图',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'right'
      },
      xAxis: {
        type: 'category',
        data: []
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          name: "降雨量",
          data: [],
          type: 'line',

        },
        {
          name: "湿度",
          data: [],
          type: 'line'
        },
        {
          name: "温度",
          data: [],
          type: 'line'
        }
      ]
    };
    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);

    var chartDom1 = document.getElementById('main1');
    var myChart1 = echarts.init(chartDom1);
    this.request.get("/echarts/members1", {
        params: {
          name: this.name,
          time: this.time,
        }
      }).then(res => {
      console.log(res);
      this.statio=res.statio
      this.user=res.user
      // 填空
      option.xAxis.data = res.time
      option.series[0].data = res.rainfallTital
      option.series[1].data = res.water
      option.series[2].data = res.temperature
      
      // 数据准备完毕之后再set
      myChart.setOption(option);

      option1.xAxis.data = res.time1
      option1.series[0].data = res.rainfallTital1
      option1.series[1].data = res.water1
      option1.series[2].data = res.temperature1
      
      // 数据准备完毕之后再set
      myChart1.setOption(option1);

    })
    }
  }
}
</script>

<style scoped>

</style>
