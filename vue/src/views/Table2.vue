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
          text: '日雨量信息统计图'
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
          data: ['0点到1点雨量',
            '1点到2点雨量',
            '2点到3点雨量',
            '3点到4点雨量',
            '4点到5点雨量',
            '5点到6点雨量',
            '6点到7点雨量',
            '7点到8点雨量',
            '8点到9点雨量',
            '9点到10点雨量',
            '10点到11点雨量',
            '11点到12点雨量',
            '12点到13点雨量',
            '13点到14点雨量',
            '14点到15点雨量',
            '15点到16点雨量',
            '16点到17点雨量',
            '17点到18点雨量',
            '18点到19点雨量',
            '19点到20点雨量',
            '20点到21点雨量',
            '21点到22点雨量',
            '22点到23点雨量',
            '23点到24点雨量'
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
      this.request.get("/rainDay").then(res => {
        this.listdata = res.data
        // this.name = res.data[0].sname
        res.data.forEach(item => {
          this.legendData.push(item.sname)
          this.seriesData.push({
            name: item.sname,
            type: 'line',
            data: [
              item.r1hour,
              item.r2hour,
              item.r3hour,
              item.r4hour,
              item.r5hour,
              item.r6hour,
              item.r7hour,
              item.r8hour,
              item.r9hour,
              item.r10hour,
              item.r11hour,
              item.r12hour,
              item.r13hour,
              item.r14hour,
              item.r15hour,
              item.r16hour,
              item.r17hour,
              item.r18hour,
              item.r19hour,
              item.r20hour,
              item.r21hour,
              item.r22hour,
              item.r23hour,
              item.r24hour,
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
              item.r1hour,
              item.r2hour,
              item.r3hour,
              item.r4hour,
              item.r5hour,
              item.r6hour,
              item.r7hour,
              item.r8hour,
              item.r9hour,
              item.r10hour,
              item.r11hour,
              item.r12hour,
              item.r13hour,
              item.r14hour,
              item.r15hour,
              item.r16hour,
              item.r17hour,
              item.r18hour,
              item.r19hour,
              item.r20hour,
              item.r21hour,
              item.r22hour,
              item.r23hour,
              item.r24hour,
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
      myChart.setOption(this.option,true,true);
    }
  }
}
</script>

<style scoped>

</style>
