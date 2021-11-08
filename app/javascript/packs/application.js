// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Vue from 'vue'
import App from '../../views/root'
import '../../stylesheets/index.scss'

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render(h) { return h(App) }
    })
})