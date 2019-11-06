import Vue from 'vue'
import VueI18n from 'vue-i18n'
import { translations } from './translations.coffee'

Vue.use(VueI18n)

i18n = new VueI18n({
  locale: 'en',
  messages: translations,
})

export default i18n