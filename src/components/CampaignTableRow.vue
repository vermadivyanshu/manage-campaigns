<template lang="pug">
  tr.campaign-row
    td.date-col
      v-col.px-0#campaign-date(not-gutters)
        div.main-text.text-truncate {{ formattedCampaignDate }}
        div.sub-text.text-truncate {{ campaignDateDiff }}
    td.campaign-col
      v-row(no-gutters no-wrap justify="space-between" align="center")
        v-flex(xs5 md3 lg2)
          v-img( :src="require(`../assets/${campaignRow.img}`)" height="40" max-width="40")
        v-flex(xs7 md9 lg10)
          v-col.px-0#image-text(no-gutters no-wrap align="start")
            v-flex(xs12)
              div.main-text.text-truncate {{campaignRow.name}}
            v-flex(xs12)
              div.sub-text.caption.text-truncate {{ campaignRow.region}}
    td.campaign-view-col
      v-row(no-gutters no-wrap justify="space-between" align="center" @click="viewPricing")
        v-flex(xs12 md3 lg2)
          v-img(src="../assets/Price.png" height="20" width="20")
        v-flex(xs12 md9 lg10)
          span.sub-text.text-truncate {{ $t('table.viewPricing') }}
    td.actions-col
      v-row(no-gutters no-wrap justify="space-between" align="center")
        v-flex(xs3)
          v-row(no-gutters justify="space-between" align="center")
            v-flex(xs12 md3 lg3)
              v-img( src="../assets/file.png" height="20" width="15")
            v-flex(xs12 md9 lg9)
              span.sub-text.truncated-text-icons CSV
        v-flex(xs3)
          v-row( no-gutters no-wrap justify="space-between" align="center")
            v-flex(xs12 md3 lg3)
              v-img( src="../assets/statistics-report.png" height="20" width="15")
            v-flex(xs12 md9 lg9)
              span.sub-text.truncated-text-icons {{ $t('table.report') }}
        v-flex(xs6)
          v-row(no-gutters no-wrap justify="space-between" align="center" height="20" @click="scheduleAgain")
            v-flex(xs12 md2 lg2)
              v-img( src="../assets/calendar.png" height="20" width="20")
            v-flex(xs12 md10 lg10)
              span.sub-text.truncated-text-icons {{ $t('table.scheduleAgain') }}

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
  .date-col
    width: 15%
  .campaign-view-col
    width: 20%
  .actions-col
    width: 40%
  .campaign-col
    width: 30%
#image-text
  .main-text, .sub-text
    position: relative
    top: -0.2rem

.truncated-text-icons
  white-space: nowrap
  overflow: hidden
  text-overflow: ellipsis
  display: inherit

</style>