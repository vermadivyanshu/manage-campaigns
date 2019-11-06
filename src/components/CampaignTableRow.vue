<template lang="pug">
  tr
    td
      div.main-text.font-weight-medium {{ formattedCampaignDate }}
      div.sub-text {{ campaignDateDiff }}
    td
      v-row(no-gutters justify="space-between" align="start")
        v-flex(xs6)
          v-img(contain src="../assets/real-racing.png" height="40")
        v-flex(xs6)
          div.main-text.font-weight-medium {{campaignRow.name}}
          div.sub-text {{ campaignRow.region}}
    td
      v-row(no-gutters justify="space-around" align="start")
        v-flex(xs6)
          v-img(contain src="../assets/Price.png" height="20" @click="viewPricing")
        v-flex(xs6)
          span.sub-text {{ $t('table.viewPricing') }}
    td
      v-row(no-gutters justify="space-between" align="start")
        v-flex(xs3)
          v-row(no-gutters justify="space-around" align="start")
            v-flex
              v-img(contain src="../assets/file.png" height="20")
            v-flex
              span.sub-text CSV
        v-flex(xs3)
          v-row(no-gutters justify="space-around" align="start")
            v-flex
              v-img(contain src="../assets/statistics-report.png" height="20")
            v-flex
              span.sub-text {{ $t('table.report') }}
        v-flex(xs6)
          v-row(no-gutters justify="space-around" align="start" height="20" @click="scheduleAgain")
            v-flex
              v-img(contain src="../assets/calendar.png" height="20")
            v-flex
              span.sub-text {{ $t('table.scheduleAgain') }}

</template>

<script lang="coffee">
import moment from 'moment'

export default {
  props:
    campaignRow:
      type: Object
  computed:
    formattedCampaignDate: -> @momentCampaignDate.format("MMM YYYY, DD")
    momentCampaignDate: ->
      moment.locale(@$i18n.locale)
      moment(@campaignRow.createdOn).startOf('day')
    campaignDateDiff: ->
      diff = 0
      postfix = @$t('table.ahead')
      if @momentCampaignDate.isAfter(moment().endOf('day'))
        diff = @momentCampaignDate.diff(moment().startOf('day'), 'days')
      else if @momentCampaignDate.isBefore(moment().startOf('day'))
        diff = moment().startOf('day').diff(@momentCampaignDate, 'days')
        postfix = @$t('table.ago')
      daysText = if diff > 1 then @$t('table.days') else @$t('table.day')
      "#{diff} #{daysText} #{postfix}"
    imgUrl: -> "../assets/#{@campaignRow.img}"
  methods:
    viewPricing: ->
      @$emit('view-pricing', @campaignRow)
    scheduleAgain: ->
      @$emit('schedule-again', @campaignRow)

}
</script>

<style lang="stylus">
tr
  .main-text
    color: #34476f
  .sub-text
    color: #8593aa
</style>