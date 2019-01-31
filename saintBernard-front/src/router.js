import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Patients from './views/Patients/List.vue'
import Patient from './views/Patients/Show.vue'
import Register from './views/Register.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/register',
      name: 'register',
      component: Register
    },
    {
      path: '/patients',
      name: 'patients',
      component: Patients
    },
    {
      path: '/patients/:id',
      name: 'patient',
      component: Patient
    }
  ]
})
