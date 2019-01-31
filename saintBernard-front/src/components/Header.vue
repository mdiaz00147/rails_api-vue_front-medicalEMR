<template>
   <div class="header clearfix">
      <nav>
        <ul class="nav nav-pills pull-right">
          <li v-if="!sessionActive" role="presentation" class="active">
            <router-link :to="'/register'">Register</router-link>
          </li>
          <li v-if="sessionActive" role="presentation" class="active">
            <router-link :to="'/patients'" >Patients</router-link>
          </li>
          <li v-if="sessionActive" role="presentation">
            <a @click="closeSession" href="javascript::void(0)" >Logout</a>
          </li>
        </ul>
      </nav>
      <h3 class="text-muted">Saint Bernard APP</h3>
    </div>
</template>

<script>
import router from '@/router'

export default {
  name:'Header',
  data(){
    return {
      sessionActive: false
    }
  },

  created(){
    let session = localStorage.getItem('user')
    if(session) this.sessionActive = true
  },

  methods:{
    closeSession(){
      let action
      action = async() => {
        await localStorage.removeItem('auth_token')
        await localStorage.removeItem('user')
        await router.push("/")
      }
      action()
    }
  }
}
</script>

