import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import '@babel/polyfill'
import i18n from './plugins/vueI18n.coffee'

Vue.config.productionTip = false

new Vue({
  vuetify,
  i18n,
  render: h => h(App)
}).$mount('#app')
