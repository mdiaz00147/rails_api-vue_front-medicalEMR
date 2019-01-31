<template>
  <div id="app">
    <div class="home">
      <router-view/>
    </div>
  </div>
</template>

<style>
  .container {
    max-width: 850px
  }
</style>

<script>

import Toasted from 'vue-toasted'
import Vue from 'vue'

Vue.use(Toasted)

export default {
  name: 'app'
}
</script>
