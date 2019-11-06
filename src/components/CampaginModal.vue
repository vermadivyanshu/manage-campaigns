<template lang="pug">
  v-dialog(persistent v-model="isOpen" max-width="30%" min-width="240px")
    v-card.pa-3
      v-row(no-gutters no-wrap justify="space-between")
        v-flex(xs6 md3 lg2)
          v-img(contain src="../assets/real-racing.png" height="100")
        v-flex.pl-3.pt-7(xs6 md9 lg10)
          div.main-text.font-weight-medium {{ campaign.name }}
          div.sub-text {{ campaign.region }}

        v-flex.py-2(xs12 md12 lg12)
          h3 Pricing

        v-flex.py-2(xs6 md6 lg5)
          span {{ oneMonthLabel }}
        v-flex.py-2(xs6 md6 lg7)
          span {{ monthlyPrice }}

        v-flex.py-2(xs6 md6 lg5)
          span {{ sixMonthLabel }}
        v-flex.py-2(xs6 md6 lg7)
          span {{ halfYearlyPrice }}

        v-flex.py-2(xs6 md6 lg5)
          span {{ oneYearLabel }}
        v-flex.py-2(xs6 md6 lg7)
          span {{ yearlyPrice }}
      v-row(no-gutters no-wrap justify="center" align="center")
        v-flex.pt-3(xs6 md3 lg2)
          v-btn( @click="closeDialog" medium text outlined) {{ $t('labels.close') }}
</template>

<script lang="coffee">
export default {
  props:
    campaign:
      type: Object
    isOpen:
      type: Boolean
      default: false
  computed:
    prices: -> @campaign.price || {}
    monthlyPrice: -> "$" + @prices['1m']
    halfYearlyPrice: -> "$" + @prices['6m']
    yearlyPrice: -> "$" + @prices['1y']
    oneMonthLabel: -> "1 " + @$t('labels.week') + " - " + "1 " + @$t('labels.month')
    sixMonthLabel: -> "6 " + @$t('labels.month')
    oneYearLabel: -> "1 " + @$t('labels.year')

  methods:
    closeDialog: -> @$emit('close-campaign-modal')
}
</script>

<style lang="stylus">
.main-text
  color: #34476f
.sub-text
  color: #8593aa
</style>