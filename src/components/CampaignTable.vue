<template lang="pug">
  v-card
    div
      v-simple-table.campaign-table(fixed-header scrollable v-if="campaignsList[0]" height="25rem")
        template(slot="default")
          thead
            tr.thead-bg
              th(class="text-left") {{ $t('table.date')}}
              th(class="text-left") {{ $t('table.campaign')}}
              th(class="text-left") {{ $t('table.view')}}
              th(class="text-left") {{ $t('table.actions') }}
          tbody
            campaign-table-row.pa-3(v-for="campaign, index in campaignsList"
            :campaignRow="campaign"
            :key="index"
            @view-pricing="onViewPricing"
            @schedule-again="scheduleAgain")
      v-container(fill-height v-else)
        v-row(no-gutters align="center" justify="center")
          v-flex(xs6 md3 lg3 text-center)
            div {{$t('noData')}}

</template>

<script lang="coffee">
import CampaignTableRow from './CampaignTableRow.vue'

export default {
  props:
    campaignsList:
      type: Array

  components: { CampaignTableRow }
  methods:
    scheduleAgain: (campaign) ->
      @$emit('schedule-again-for-campaign', campaign)

    onViewPricing: (campaign) ->
      @$emit('open-view-pricing', campaign)
    closeCampaignDatePicker: -> @isCampaignDatePickerOpen = false
}
</script>

<style lang="stylus">
.campaign-table
  .thead-bg
    th.text-left
      background-color: #f1f1f3 !important
  overflow-x: scroll
</style>