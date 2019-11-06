<template lang="pug">
  v-dialog(persistent v-model="isOpen")
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

  methods:
    closeDatePicker: -> @$emit('close-date-pciker')
    updateDateAndCloseDatePicker: -> @$emit('update:campaign-date', moment(@datePickerModel).toISOString())
}
</script>