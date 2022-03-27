import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import './assets/gloable.css'
import request from '@/utils/request.js'
import store from './store'

Vue.prototype.request = request      //把axios挂载到vue上
import router from './router'
Vue.config.productionTip = false

Vue.use(ElementUI, {size: "mini"})
new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
