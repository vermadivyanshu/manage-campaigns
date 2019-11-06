<template lang="pug">
  v-dialog(persistent v-model="isOpen")
    v-card
      v-row(no-gutters justify="space-between")
        v-flex(xs6)
          v-img(contain src="../assets/real-racing.png")
        v-flex(xs6)
          p {{ campaign.name }}
          p {{ campaign.region }}
      v-row(no-gutters justify="space-between")
        v-flex(xs6)
          span 1 week - 1 month
        v-flex(xs6)
          span {{ monthlyPrice }}
      v-row(no-gutters justify="space-between")
        v-flex(xs6)
          span 6 months
        v-flex(xs6)
          span {{ halfYearlyPrice }}
      v-row(no-gutters justify="space-between")
        v-flex(xs6)
          span 1 year
        v-flex(xs6)
          span {{ yearlyPrice }}
      v-row(no-gutters justify="center" align="center")
        v-flex(xs6)
          v-btn(outine @click="closeDialog") close
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
    monthlyPrice: -> @prices['1m']
    halfYearlyPrice: -> @prices['6m']
    yearlyPrice: -> @prices['1y']
  methods:
    closeDialog: -> @$emit('close-campaign-modal')
}
</script>