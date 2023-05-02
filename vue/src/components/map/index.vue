<template>
  <div class="content">
    <!-- 用来显示地图 -->
    <!-- 可以不写宽度，但一定要有高度 -->
    <div id="container" style="height: 100vh;">
    </div>
    <div class="input-card" v-if="flag">
      <h4>地图自适应</h4>
      <el-button id="setFitView" class="btn">地图自适应显示</el-button>
    </div>
    <div id="myPageTop" v-if="flag">
      <table>
        <tr>
          <td>
            <label>请输入关键字：</label>
          </td>
        </tr>
        <tr>
          <td>
            <input id="tipinput"/>
          </td>
        </tr>
      </table>
    </div>

    <div class="info">
      <div id="centerCoord"></div>
      <div id="tips"></div>
    </div>
  </div>

</template>

<script>

//引入高德地图
import AMapLoader from '@amap/amap-jsapi-loader'

export default {
  name: 'IndexMap',
  data() {
    return {
      map: null, //地图实例
      flag: false,
      center: [],
      name: "",
      AllPoint: []
    }
  },
  mounted() {
    this.getInfo()
    this.getAdminInfo()
    this.initMap()
  },
  methods: {
    getInfo() {
      var uid = JSON.parse(localStorage.getItem("user")).id;
      this.request.get("/station/getInfoByUid", {
        params: {
          uid: uid
        }
      }).then(res => {
        console.log(res.data)
        this.center[0] = Number.parseFloat(res.data.latitude);
        this.center[1] = Number.parseFloat(res.data.longitude);
        this.name = res.data.name;

      })
    },
    getAdminInfo() {
      this.request.get("/station/", {
        params: {}
      }).then(res => {
        res.data.forEach(item => {
          this.AllPoint.push(
              {
                latitude: Number.parseFloat(item.latitude),
                longitude: Number.parseFloat(item.longitude),
                name: item.name
              }
          )
        })

      })
    },
    initMap() {
      var role = JSON.parse(localStorage.getItem("user")).role;
      //工务段用户
      if (role == "ROLE_USER") {
        AMapLoader.load({
          key: "bd3ecbef651c79a5a37dbeaf0a46bb25", // 申请好的Web端开发者Key，首次调用 load 时必填
          //2.0版本太卡了 ，所以使用的1.4.0版本  其插件也有不同  如：ToolBar
          version: "1.4.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
          resizeEnable: true,
          plugins: [
            "AMap.ToolBar", //工具条
            "AMap.Scale", // 比例尺
            "AMap.Geolocation", //定位
          ], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
        }).then((AMap) => {
          var map = new AMap.Map('container', {
            resizeEnable: true,
            // center: [116.486409, 39.921489],
            center: this.center,
            zoom: 12
          });
          map.clearMap();
          var marker = new AMap.Marker({
            map: map,
            icon: '//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png',
            position: this.center,
          })
          var _this = this;
          marker.on('click', function () {
            _this.$router.push("/dashbord")
          })
          //鼠标点击marker弹出自定义的信息窗体
          marker.on('mouseover', function () {
            marker.setLabel({
              direction: 'right',
              offset: new AMap.Pixel(10, 0),  //设置文本标注偏移量
              content: `<div class='info'>站点名称:${_this.name}</div>`, //设置文本标注内容
            });
          });
          //鼠标移出 marker 时关闭信息窗体
          marker.on('mouseout', function () {
            marker.setLabel({
              content: null
            })

          })
          this.map = map
        })

      }
      else {
        AMapLoader.load({
          key: "bd3ecbef651c79a5a37dbeaf0a46bb25", // 申请好的Web端开发者Key，首次调用 load 时必填
          //2.0版本太卡了 ，所以使用的1.4.0版本  其插件也有不同  如：ToolBar
          version: "2.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
          resizeEnable: true,
          plugins: [
            "AMap.ToolBar", //工具条
            "AMap.Scale", // 比例尺
            "AMap.Geolocation", //定位
            "AMap.PlaceSearch",
            "AMap.AutoComplete"
          ], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
        }).then((AMap) => {
          var point = Object.values(this.AllPoint[0])
          var map = new AMap.Map('container', {
            resizeEnable: true,
            center: point,
            zoom: 13
          });
          map.clearMap();
          var markers = []
          this.AllPoint.forEach(item => {
            markers.push(
                {
                  icon: '//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png',
                  position: [item.latitude, item.longitude],
                  name:item.name
                }
            )
          })
          var _this = this;
          // 添加一些分布不均的点到地图上,地图上添加三个点标记，作为参照
          markers.forEach(function (marker) {
            var marker2 = new AMap.Marker({
              map: map,
              icon: marker.icon,
              position: marker.position
            });
            marker2.on('click',function (){
              _this.$router.push("/dashbord")
            })
            //鼠标点击marker弹出自定义的信息窗体
            marker2.on('mouseover', function () {
              marker2.setLabel({
                direction: 'right',
                offset: new AMap.Pixel(10, 0),  //设置文本标注偏移量
                content: `<div class='info'>站点名称:${marker.name}</div>`, //设置文本标注内容
              });
            });
            //鼠标移出 marker 时关闭信息窗体
            marker2.on('mouseout', function () {
              marker2.setLabel({
                content: null
              })
            });
          });


          var center = map.getCenter();

          var centerText = '当前中心点坐标：' + center.getLng() + ',' + center.getLat();
          document.getElementById('centerCoord').innerHTML = centerText;
          document.getElementById('tips').innerHTML = '成功添加点标记，其中有坐标在当前地图视野外！';

          var setFitViewBtn = document.getElementById('setFitView');
          // 添加事件监听, 使地图自适应显示到合适的范围
          setFitViewBtn.onclick = function () {
            // 第一个参数为空，表明用图上所有覆盖物 setFitview
            // 第二个参数为false, 非立即执行
            // 第三个参数设置上左下右的空白
            map.setFitView(null, false, [150, 60, 100, 60]);
            var newCenter = map.getCenter();
            document.getElementById('centerCoord').innerHTML = '当前中心点坐标：' + newCenter.toString();
            document.getElementById('tips').innerHTML = '通过setFitView，地图自适应显示到合适的范围内,点标记已全部显示在视野中！';
          };

          //输入提示
          var autoOptions = {
            input: "tipinput"
          };
          AMap.plugin(['AMap.PlaceSearch', 'AMap.AutoComplete'], function () {
            var auto = new AMap.AutoComplete(autoOptions);
            var placeSearch = new AMap.PlaceSearch({
              map: map
            });  //构造地点查询类
            auto.on("select", select);//注册监听，当选中某条记录时会触发
            function select(e) {
              placeSearch.setCity(e.poi.adcode);
              placeSearch.search(e.poi.name);  //关键字查询查询
            }
          });
          // map.on('click', e => {
          //   var text = '您在 [ ' + e.lnglat.getLng() + ',' + e.lnglat.getLat() + ' ] 的位置单击了地图！'
          //   this.$router.push("/dashbord")
          // });
          this.map = map;
        })
        this.flag = true

      }
    },
  }
}

</script>

<style scoped>
#myPageTop {
  position: absolute;
  background-color: white;
  max-height: 90%;
  overflow-y: auto;
  top: 100px;
  right: 10px;
  width: 280px;
  z-index: 999;
}
</style>
