<template>
<div class="container">
    <header-component/>
    
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Patients list <i class="fa fa-list"></i></div>
      <div class="panel-body">
        <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>MR</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in patients">
            <td>{{item.id}}</td>
            <td>{{item.mr}}</td>
            <td>{{item.first_name}}</td>
            <td>{{item.last_name}}</td>
            <td><span class="badge">{{item.gender}}</span></td>
            <td>{{item.age}}</td>
            <td>
              <router-link :to="'patients/' + item.id " class="btn btn-warning btn-xs" >
                Summary
              </router-link>
            </td>
          </tr>
        </tbody>
      </table>
      </div>

      
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
  name: 'Patients',
  data(){
    return {
      loading: false,
      patients: []
    }
  },
  
  components: {
    'header-component': HeaderComponent,
    'footer-component': FooterComponent
  },

  created(){
    this.getPatients()
  },

  methods: {
    getPatients () {
      this.loading = true
      axios({
        url: config.defaultURL + '/v1/client/patients',
        method: 'get',
        headers: {
          "content-type": "application/json",
          Authorization: localStorage.getItem("auth_token")
        }
      })
      .then(response => {
        this.patients = response.data
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
    }
  }
}
  
</script>