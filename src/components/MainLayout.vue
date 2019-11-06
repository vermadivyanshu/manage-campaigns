<template lang="pug">
  v-container.main-layout
    manage-campaigns
</template>

<script lang="coffee">
import ManageCampaigns from './ManageCampaigns.vue'

export default {
  components: { ManageCampaigns }
}
</script>