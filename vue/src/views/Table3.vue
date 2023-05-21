<template>
  <div>
    <!--    <el-row :gutter="10" style="margin-bottom: 60px">-->
    <!--      <el-col :span="6">-->
    <!--&lt;!&ndash;        <el-card style="color: #409EFF">&ndash;&gt;-->
    <!--&lt;!&ndash;          <div><i class="el-icon-user-solid"/> 车站数量</div>&ndash;&gt;-->
    <!--&lt;!&ndash;          <div style="padding: 10px 0; text-align: center; font-weight: bold">&ndash;&gt;-->
    <!--&lt;!&ndash;            {{ statio }}&ndash;&gt;-->
    <!--&lt;!&ndash;          </div>&ndash;&gt;-->
    <!--&lt;!&ndash;        </el-card>&ndash;&gt;-->
    <!--      </el-col>-->

    <!--      <el-col :span="6">-->
    <!--        <el-card style="color: #F56C6C">-->
    <!--          <div><i class="el-icon-money"/> 铁路点管理员数量</div>-->
    <!--          <div style="padding: 10px 0; text-align: center; font-weight: bold">-->
    <!--            {{ user }}-->
    <!--          </div>-->
    <!--        </el-card>-->
    <!--      </el-col>-->
    <!--    </el-row>-->

    <el-row>
      <el-select v-model="name" placeholder="请选择站点" style="padding: 10px;">
        <el-option
            v-for="item in listdata"
            :key="item.id"
            :label="item.sname"
            :value="item.sname">
        </el-option>
      </el-select>

      <!--      <el-date-picker v-model="time" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker>-->

      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>

      <el-col :span="24">
        <div id="main3" style="margin-left:20px;width: 1200px; height: 450px"></div>
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
      listdata: [],
      name: '',
      statio: '',
      user: '',
      time: '',
      legendData: [],
      seriesData: [],
      option: {},
    }
  },
  mounted() {  // 页面元素渲染之后再触发

    this.list()

  },
  methods: {
    init() {
      // console.log(this.legendData)
      var chartDom = document.getElementById('main3');
      var myChart = echarts.init(chartDom);
      this.option = {
        title: {
          text: '月雨量信息统计图'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: this.legendData
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: [
            '1号总雨量',
            '2号总雨量',
            '3号总雨量',
            '4号总雨量',
            '5号总雨量',
            '6号总雨量',
            '7号总雨量',
            '8号总雨量',
            '9号总雨量',
            '10号总雨量',
            '11号总雨量',
            '12号总雨量',
            '13号总雨量',
            '14号总雨量',
            '15号总雨量',
            '16号总雨量',
            '17号总雨量',
            '18号总雨量',
            '19号总雨量',
            '20号总雨量',
            '21号总雨量',
            '22号总雨量',
            '23号总雨量',
            '24号总雨量',
            '25号总雨量',
            '26号总雨量',
            '27号总雨量',
            '28号总雨量',
            '29号总雨量',
            '30号总雨量',
            '31号总雨量'
          ]
        },
        yAxis: {
          type: 'value'
        },
        series: this.seriesData
      };
      this.option && myChart.setOption(this.option);
    },
    // 获取所有的数据
    list() {
      this.request.get("/rainMon").then(res => {
        this.listdata = res.data
        // this.name = res.data[0].sname
        res.data.forEach(item => {
          this.legendData.push(item.sname)
          this.seriesData.push({
            name: item.sname,
            type: 'line',
            data: [
              item.r1day,
              item.r2day,
              item.r3day,
              item.r4day,
              item.r5day,
              item.r6day,
              item.r7day,
              item.r8day,
              item.r9day,
              item.r10day,
              item.r11day,
              item.r12day,
              item.r13day,
              item.r14day,
              item.r15day,
              item.r16day,
              item.r17day,
              item.r18day,
              item.r19day,
              item.r20day,
              item.r21day,
              item.r22day,
              item.r23day,
              item.r24day,
              item.r25day,
              item.r26day,
              item.r27day,
              item.r28day,
              item.r29day,
              item.r30day,
              item.r31day,
            ]
          })
        })
        this.init()
      })

    },

    load() {
      // if(!this.time){
      //   this.$message.error("请输入时间")
      //   return;
      // }
      let arr = []
      this.listdata.forEach(item => {
        if (item.sname == this.name) {
          arr.push({
            name: item.sname,
            type: 'line',
            data: [
              item.r1day,
              item.r2day,
              item.r3day,
              item.r4day,
              item.r5day,
              item.r6day,
              item.r7day,
              item.r8day,
              item.r9day,
              item.r10day,
              item.r11day,
              item.r12day,
              item.r13day,
              item.r14day,
              item.r15day,
              item.r16day,
              item.r17day,
              item.r18day,
              item.r19day,
              item.r20day,
              item.r21day,
              item.r22day,
              item.r23day,
              item.r24day,
              item.r25day,
              item.r26day,
              item.r27day,
              item.r28day,
              item.r29day,
              item.r30day,
              item.r31day,
            ]
          });
          return;
        }
      });
      console.log(arr)

      this.option.legend.data = [this.name];
      this.option.series = arr;
      var chartDom = document.getElementById('main3');
      var myChart = echarts.init(chartDom);
      myChart.setOption(this.option, true, true);
    }
  }
}
</script>

<style scoped>

</style>
