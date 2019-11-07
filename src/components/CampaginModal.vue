<template lang="pug">
  v-dialog(persistent v-model="isOpen" :width="dialogWidth" v-if="campaign")
    v-card.pa-3
      v-row(no-gutters no-wrap justify="space-between")
        v-flex(xs5 md3 lg3)
          v-card(height="160" width="160" raised)
            v-img#campaign-image( v-if="img" :src="require(`../assets/${img}`)" height="160" width="160")
        v-flex(xs7 md9 lg9)
          v-col#image-text(no-wrap align="start" justify="end")
            div.main-text.font-weight-medium.text-truncate {{ campaign.name }}
            div.sub-text.text-truncate {{ campaign.region }}

        v-flex.py-2.pt-6(xs12 md12 lg12)
          h3.main-text {{ $t('headings.pricing')}}

        v-flex.py-2(xs6 md6 lg5)
          span.sub-text {{ oneMonthLabel }}
        v-flex.py-2(xs6 md6 lg7 text-right)
          span.price-text.font-weight-medium {{ monthlyPrice }}

        v-flex.py-2(xs6 md6 lg5)
          span.sub-text {{ sixMonthLabel }}
        v-flex.py-2(xs6 md6 lg7 text-right)
          span.price-text.font-weight-medium {{ halfYearlyPrice }}

        v-flex.py-2(xs6 md6 lg5)
          span.sub-text {{ oneYearLabel }}
        v-flex.py-2(xs6 md6 lg7 text-right)
          span.price-text.font-weight-medium {{ yearlyPrice }}
      v-row(no-gutters no-wrap justify="center" align="center")
        v-flex.pt-3(xs6 md4 lg4 text-center)
          v-btn.close-button(@click="closeDialog" medium text outlined) {{ $t('labels.close') }}
</template>

<script lang="coffee">
import { currencyConvertor } from '../helpers/currencyConvertor.coffee'

export default {
  props:
    campaign:
      type: Object
    isOpen:
      type: Boolean
      default: false
  computed:
    prices: -> @campaign.price || {}
    currency: -> if (@$i18n.locale == 'de') then "€" else "$"
    monthlyPrice: ->
      @currency + ' ' + currencyConvertor(@prices['1m'], @$i18n.locale).toFixed(2)
    halfYearlyPrice: -> @currency + ' ' + currencyConvertor(@prices['6m'], @$i18n.locale).toFixed(2)
    yearlyPrice: -> @currency + ' ' + currencyConvertor(@prices['1y'], @$i18n.locale).toFixed(2)
    oneMonthLabel: -> "1 " + @$t('labels.week') + " - " + "1 " + @$t('labels.month')
    sixMonthLabel: -> "6 " + @$t('labels.month')
    oneYearLabel: -> "1 " + @$t('labels.year')
    img: -> @campaign.img
    dialogWidth: ->
      if @$vuetify.breakpoint.xsOnly
        "100%"
      else if @$vuetify.breakpoint.smOnly
        "60%"
      else if @$vuetify.breakpoint.mdOnly
        "50%"
      else
        "40%"

  methods:
    closeDialog: -> @$emit('close-campaign-modal')
}
</script>

<style lang="stylus" scoped>
.main-text
  color: #34476f
.sub-text
  color: #8593aa
.price-text
  color: #566684
#image-text
  position: relative
  top: 6.5rem
.close-button
  border-color: #181b31 !important
</style>