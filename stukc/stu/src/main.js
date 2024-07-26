import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import CollapseTransition from 'element-ui/lib/transitions/collapse-transition';
import 'element-ui/lib/theme-chalk/index.css';
import "./assets/global.css";
import request from "@/utils/request";
Vue.use(ElementUI,{size:"small"});
Vue.config.productionTip = false;
Vue.prototype.request=request;
Vue.component(CollapseTransition.name, CollapseTransition)
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
