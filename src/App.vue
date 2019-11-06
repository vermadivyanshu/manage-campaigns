<template lang="pug">
  v-app
    nav-bar
    v-content
      main-layout
  </v-app>
</template>

<script lang="coffee">
import MainLayout from './components/MainLayout.vue'
import NavBar from './components/NavBar.vue'

export default {
  name: 'App',
  components: { MainLayout, NavBar }
}
</script>
