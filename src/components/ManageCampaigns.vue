<template lang="pug">
  .manage-campaigns
    h1.manage-campaigns-heading.mb-3 {{ $t('headings.manageCampaigns')}}
    v-tabs(v-model="tab" color="#83a515")
      v-tab(href="#tab-1")
        span {{ $t('tabs.upcomingCampaigns')}}
      v-tab(href="#tab-2")
        span {{ $t('tabs.liveCampaigns')}}
      v-tab(href="#tab-3")
        span {{ $t('tabs.pastCampaigns')}}
    v-tabs-items(v-model="tab")
      v-tab-item.py-4.px-4(key="1" value="tab-1")
        campaign-table(:campaignsList="upcoming" @open-view-pricing="viewPricingModal" @schedule-again-for-campaign="rescheduleForCampaign")
      v-tab-item.py-4.px-4(key="2" value="tab-2")
        campaign-table(:campaignsList="live" @open-view-pricing="viewPricingModal" @schedule-again-for-campaign="rescheduleForCampaign")
      v-tab-item.py-4.px-4(key="3" value="tab-3")
        campaign-table(:campaignsList="past" @open-view-pricing="viewPricingModal" @schedule-again-for-campaign="rescheduleForCampaign")
    campaign-modal(:campaign="campaignForModal" :isOpen="isOpenPricingModal"
    @close-campaign-modal="closePricingModal")
    campaign-date-picker(
      :isOpen="isCampaignDatePickerOpen"
      :campaign="campaignDatePickerItem"
      @close-date-pciker="closeCampaignDatePicker"
      @update:campaign-date="updateCampaignDate"
    )

</template>

<script lang="coffee">
import CampaignTable from './CampaignTable.vue'
import CampaignModal from './CampaginModal.vue'
import CampaignDatePicker from './CampaignDatePicker.vue'
import campaigns from '../fixtures/campaigns.coffee'
import moment from 'moment'

export default {
  data: ->
    tab: 'tab-1'
    campaigns: campaigns
    isOpenPricingModal: false
    campaignForModal: {}
    isCampaignDatePickerOpen: false
    campaignDatePickerItem: {}
  components: { CampaignTable, CampaignModal, CampaignDatePicker }
  computed:
    upcoming: -> @campaigns.filter((campaign) -> moment(campaign.createdOn).startOf('day').isAfter(moment().endOf('day')))
    past: -> @campaigns.filter((campaign) -> moment(campaign.createdOn).startOf('day').isBefore(moment().startOf('day')))
    live: -> @campaigns.filter((campaign) ->
      moment(campaign.createdOn).startOf('day').isSame(moment().startOf('day'))
    )
  methods:
    viewPricingModal: (campaign)->
      @campaignForModal = campaign
      @isOpenPricingModal =  true

    closePricingModal: ->
      @isOpenPricingModal =  false

    updateCampaignDate: (date) ->
      @isCampaignDatePickerOpen = false
      @campaigns.forEach((c) =>
        if c.id == @campaignDatePickerItem.id
          c.createdOn = date
      )

    closeCampaignDatePicker: ->
      @isCampaignDatePickerOpen = false
    
    rescheduleForCampaign: (campaign)->
      @campaignDatePickerItem = campaign
      @isCampaignDatePickerOpen = true

}
</script>

<style lang="stylus">
.manage-campaigns
  .manage-campaigns-heading
    color: #2b416c
</style>