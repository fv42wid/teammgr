/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import Vuetify from 'vuetify'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

import MainHeader from './layout/vue-header.vue'
import UserSignup from './devise/vue-signup.vue'

Vue.use(VueResource)
Vue.use(Vuetify)

document.addEventListener('turbolinks:load', () => {
    var element = document.getElementById("main-app")

    var app = new Vue({
        el: element,
        data: {
            sideNav: false
        },
        created: function () {
            console.log('main vue created')
        },
        components: {
            'main-header' : MainHeader,
            'vue-signup' : UserSignup
        }
    })
})
