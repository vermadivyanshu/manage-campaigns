<template lang="pug">
  v-card.campaign-table
    v-simple-table
      template(slot="default")
        thead
          tr
            th(class="text-left") DATE
            th(class="text-left") CAMPAIGN
            th(class="text-left") VIEW
            th(class="text-left") ACTIONS
        tbody
          campaign-table-row.pa-3(v-for="campaign, index in campaignsList"
          :campaignRow="campaign"
          :key="index"
          @view-pricing="onViewPricing"
          @schedule-again="scheduleAgain")
    campaign-date-picker(
      :isOpen="isCampaignDatePickerOpen"
      :campaign="campaignDatePickerItem"
      @close-campaign-date-picker="closeCampaignDatePicker"
      @update:campaign-date="updateCampaignDate"
    )
</template>

<script lang="coffee">
import CampaignTableRow from './CampaignTableRow.vue'
import CampaignDatePicker from './CampaignDatePicker.vue'
export default {
  props:
    campaignsList:
      type: Array
  data: ->
    isCampaignDatePickerOpen: false
    campaignDatePickerItem: {}
  components: { CampaignTableRow, CampaignDatePicker }
  methods:
    scheduleAgain: (campaign) ->
      console.log "emit2"
      @campaignDatePickerItem = campaign
      @isCampaignDatePickerOpen = true

    updateCampaignDate: (date) ->
      console.log(date)
      @$emit('update-campaign-date-for-record', date, @campaignDatePickerItem)
      @isCampaignDatePickerOpen = false

    onViewPricing: (campaign) ->
      @$emit('open-view-pricing', campaign)
    closeCampaignDatePicker: -> @isCampaignDatePickerOpen = false
}
</script>

<style lang="stylus">
  .campaign-table
    thead
      background-color: #f1f1f3
</style>