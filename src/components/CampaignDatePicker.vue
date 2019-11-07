<template lang="pug">
  v-dialog(persistent v-model="isOpen" :width="dialogWidth")
    v-date-picker(v-model="datePickerModel" scrollable :locale="$i18n.locale")
      v-spacer
      v-btn(text @click="closeDatePicker") {{ $t('labels.cancel')}}
      v-btn(text @click="updateDateAndCloseDatePicker") {{ $t('labels.okay')}}
</template>

<script lang="coffee">
import moment from 'moment'
export default {
  props:
    isOpen:
      type: Boolean
      default: false
    campaign:
      type: Object
  data: ->
    datePickerModel: moment(@campaign?.createdOn).format("YYYY-MM-DD")
  watch:
    campaign: (newVal, oldVal) -> @datePickerModel = moment(newVal?.createdOn).format("YYYY-MM-DD")
  computed:
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
    closeDatePicker: -> @$emit('close-date-pciker')
    updateDateAndCloseDatePicker: -> @$emit('update:campaign-date', moment(@datePickerModel).toISOString())
}
</script>