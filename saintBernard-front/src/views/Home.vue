<template>
  <div class="container">
    <header-component/>
    
    <div class="jumbotron">
      <h1>Members Log In</h1>
      <br>

      <form  class="text-left row" @submit="onSubmit">
        <div class="form-group">
          <label for="exampleInputEmail1">Email address</label>
          <input v-model="form.email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Password</label>
          <input v-model="form.password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
        </div>

        <div class="checkbox">
          <label>
            <input type="checkbox"> Remember
          </label>
        </div>
        <button v-if="!loading" type="submit" class="btn btn-success col-md-6">Sign In</button>
        <button v-if="loading" type="submit" class="btn btn-success col-md-6" disabled>Loading <i class="fa fa-spinner fa-spin"></i></button>
        <router-link to="/register" class="btn btn-primary col-md-6">Register</router-link>
      </form>
    </div>

    <footer-component/>
  </div>
</template>

<script>
// @ is an alias to /src

import * as config from '@/config/settings'
import router from '@/router'
import axios from 'axios'

import HeaderComponent from '@/components/Header'
import FooterComponent from '@/components/Footer'

export default {
  name: 'Login',
  data(){
    return {
      loading: false,
      form: {}
    }
  },
  
  components: {
    'header-component': HeaderComponent,
    'footer-component': FooterComponent
  },
  
  methods: {
    onSubmit (evt) {
      evt.preventDefault()
      this.loading = true
      axios.post(config.defaultURL + '/v1/client/sessions', this.form)
      .then(response => {
        this.clientLogin(response.data)
        this.loading = false
      })
      .catch((error) => {
        this.$toasted.show(error.response.data, { 
          position:'top-right', 
          duration: 5000,
          type: 'default',
          closeOnSwipe: true
        })
        this.loading = false
      })
    },
    
    clientLogin(data){
      let action
      action = async() => {
        await localStorage.setItem('auth_token', data.auth_token)
        await localStorage.setItem('user', JSON.stringify(data.user))
        await router.push("patients")
      }
      action()
    }

  }
}
</script>
