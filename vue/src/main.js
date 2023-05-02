import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './assets/gloable.css'
import request from "@/utils/request";

Vue.config.productionTip = false

Vue.use(ElementUI, { size: "mini" });

Vue.prototype.request=request

//配置安全密钥
window._AMapSecurityConfig = {
  securityJsCode: 'ec1e20985f99fc7d11a237acb43eee17' //*  安全密钥
}


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
