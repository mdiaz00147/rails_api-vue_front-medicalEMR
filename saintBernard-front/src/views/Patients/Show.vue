<template>
<div class="container">
    <header-component/>
    
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Emergency Transfer Summary (Form 34L - D)</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-12 summary__title">
            <h5 ><b>Transferring Facility</b></h5>
          </div>

          <div class="col-md-12 summary__title">
            <span class="col-md-6 summary__facility row">
              <p>Name</p>
              <p class="text-info">{{facility.name}} </p>
            </span>
            <span class="col-md-6"></span>
          </div>
          
          <div class="col-md-12 summary__title">
            <h5 ><b>Patient Information</b></h5>
          </div>

          <div class="col-md-12  summary__title ">
            <span class="col-md-3 summary__facility ">
              <p>First Name</p>
              <p class="text-info">{{patient.first_name}}</p>
            </span>
            <span class="col-md-3 summary__facility ">
              <p>Middle Name</p>
              <p class="text-info">{{patient.middle_name}}</p>
            </span>
            <span class="col-md-3 summary__facility ">
              <p>Last Name</p>
              <p class="text-info">{{patient.last_name}}</p>
            </span>
            <span class="col-md-3 summary__facility-last ">
              <p>Medical Record (MR)</p>
              <p class="text-info">{{patient.mr}}</p>
            </span>
          </div>
          
          <div class="col-md-12 ">
            <h5><b>Summary</b></h5>
            <p>
              This <span class="text-info">{{patient.age}}</span> years old <span class="text-info">{{patient.gender}}</span> was admitted to  <span class="text-info">{{facility.name}}</span> on <span class="text-info">{{patient.admission.date}}</span> at <span class="text-info">{{patient.admission.time}}</span> due to <span class="text-info">{{ patient.admission.diagnoses}}</span>. The observed symptoms on admission were <span class="text-info">{{patient.admission.symptoms}}</span>. <span class="text-info">{{patient.admission.observations}}</span>.
              <br>
              <br>
              Upon asking about known allergies, the patient disclosed <span class="text-info">{{patient.allergies}}.</span> Upon asking about chronic conditions, the patient disclosed <span class="text-info">{{patient.chronic_conditions}}.</span> The patient was administered with <span class="text-info">{{patient.medications}}.</span>
              <br>
              <br>
              The staff performed <span class="text-info">{{patient.diagnostic_procedures}}</span>, revealing <span class="text-info">{{patient.diagnoses}}.</span> Our team proceeded to <span class="text-info">{{patient.treatments}}.</span>
            </p>
          </div>
          
        </div>
        
      </div>

      
    </div>
    <footer-component/>
  </div>
</template>

<style>
  .summary__facility{
    border-right: 1px solid #ddd
  }

  .summary__title{ 
    border-bottom:  1px solid #ddd
  }
</style>

<script>
// @ is an alias to /src

import * as config from '@/config/settings'
import router from '@/router'
import axios from 'axios'

import HeaderComponent from '@/components/Header'
import FooterComponent from '@/components/Footer'

export default {
  name: 'Patient',
  data(){
    return {
      loading: false,
      patient: {
        admission:{}
      },
      facility: {}
    }
  },
  
  components: {
    'header-component': HeaderComponent,
    'footer-component': FooterComponent
  },

  created(){
    let id = this.$route.params.id
    this.getPatient(id)
  },

  methods: {
    getPatient(id) {
      this.loading = true
      axios({
        url: config.defaultURL + '/v1/client/patients/' + id,
        method: 'get',
        headers: {
          "content-type": "application/json",
          Authorization: localStorage.getItem("auth_token")
        }
      })
      .then(response => {
        this.patient = response.data
        this.facility = response.data.facility
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