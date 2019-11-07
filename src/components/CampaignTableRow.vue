<template lang="pug">
  tr.campaign-row
    td
      v-col.px-0#campaign-date(not-gutters)
        div.main-text.text-truncate {{ formattedCampaignDate }}
        div.sub-text.text-truncate {{ campaignDateDiff }}
    td
      v-row(no-gutters no-wrap justify="space-between" align="center")
        v-flex(xs3 md3 lg2)
          v-img( :src="require(`../assets/${campaignRow.img}`)" height="40" width="40")
        v-flex(xs9 md9 lg10)
          v-col.px-0#image-text(no-gutters no-wrap align="start")
            v-flex(xs6)
              div.main-text.text-truncate {{campaignRow.name}}
            v-flex(xs6)
              div.sub-text.caption {{ campaignRow.region}}
    td
      v-row(no-gutters no-wrap justify="space-between" align="center")
        v-flex(xs3 md3 lg2)
          v-img(src="../assets/Price.png" height="20" width="20" @click="viewPricing")
        v-flex(xs9 md9 lg10)
          span.sub-text {{ $t('table.viewPricing') }}
    td
      v-row(no-gutters no-wrap justify="space-between" align="center")
        v-flex(xs3)
          v-row(no-gutters justify="space-between" align="center")
            v-flex(xs3 md3 lg3)
              v-img( src="../assets/file.png" height="20" width="15")
            v-flex(xs9 md9 lg9)
              span.sub-text CSV
        v-flex(xs3)
          v-row( no-gutters no-wrap justify="space-between" align="center")
            v-flex(xs3 md3 lg3)
              v-img( src="../assets/statistics-report.png" height="20" width="15")
            v-flex(xs9 md9 lg9)
              span.sub-text.text-truncate {{ $t('table.report') }}
        v-flex(xs6)
          v-row(no-gutters no-wrap justify="space-between" align="center" height="20" @click="scheduleAgain")
            v-flex(xs3 md2 lg2)
              v-img( src="../assets/calendar.png" height="20" width="20")
            v-flex(xs9 md10 lg10)
              span.sub-text.text-truncate {{ $t('table.scheduleAgain') }}

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
tr.campaign-row
  .main-text
    color: #34476f
  .sub-text
    color: #8593aa
#image-text
  .main-text, .sub-text
    position: relative
    top: -0.2rem
#campaign-date
  .sub-text
    font-size: 0.6rem
</style>