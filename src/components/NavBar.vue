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
        .d-flex.algin-center
          v-select(
            :items="langs"
            v-model="$i18n.locale"
            color="#fff"
            light
            width="10"
          )
</template>

<script lang="coffee">
export default
  data: ->
    langs: ['en', 'de']

</script>