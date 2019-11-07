<template lang="pug">
  v-app-bar(app fixed color="#1f2441")
    v-container
      v-layout
        .d-flex.align-center
          v-img(alt="Logo"
            contain
            src="../assets/logo.png"
            transition="scale-transition"
            width="100"
          )
        v-spacer
        .d-flex.algin-center.lang-select
          v-select(
            :items="langs"
            v-model="$i18n.locale"
            light
          )
</template>

<script lang="coffee">
export default
  data: ->
    langs: ['en', 'de']

</script>
<style lang="stylus">
.theme--light.v-select
  .v-select__selections
    color: white !important
i.v-icon.notranslate.mdi.mdi-menu-down.theme--light
  color: white !important
.theme--light.v-text-field>.v-input__control>.v-input__slot:before
  border-color: white !important
.lang-select
  width: 4rem

</style>