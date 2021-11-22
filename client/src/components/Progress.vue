<template>
  <div class="progress">
      <div class="marker"></div>
  </div>
</template>

<script setup>

import {defineProps, watchEffect} from "vue";
import { gsap } from "gsap";

// props

const props = defineProps({
  markerDistance: {
    type: Number,
    required: true,
    validator: (value) => {
      if (value > 100 || value < 0) return false
      return true
    }
  }
})

// watcher

watchEffect(() => {
  gsap.to('.progress .marker', {left: `calc(${props.markerDistance}% - 25px)`})
})

</script>

<style>
.progress {
  width: 100%;
  height: 20px;
  background-color: black;
  border-radius: 15px;
  position: relative;
}

.marker {
  height: 40px;
  width: 40px;
  border-radius: 40px;
  background-color: red;
  transform: translateY(-25%);
  position: absolute;
}
</style>