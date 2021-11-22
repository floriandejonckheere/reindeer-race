<template>
  <div class="container">
    <img class="deer" :src="selectedDeer">
  </div>
</template>

<script setup>

import {defineProps, watchEffect} from "vue";

import deerOne from "@/assets/deers/deer_one.png"
import deerTwo from "@/assets/deers/deer_two.png"
import deerThree from "@/assets/deers/deer_three.png"
import deerFour from "@/assets/deers/deer_four.png"
import deerFive from "@/assets/deers/deer_five.png"

const deers = [deerOne, deerTwo, deerThree, deerFour, deerFive]

let selectedDeer = $ref(deerOne);
let selectedDeerIndex = $ref(0)
let interval = $ref(null)

const props = defineProps({
  running: {
    type: Boolean,
    required: true,
  }
})

const startRunning = () => {
  interval = setInterval(() => {
    selectedDeerIndex += 1
    if (selectedDeerIndex === 5) selectedDeerIndex = 0
    selectedDeer = deers[selectedDeerIndex]
    console.log(selectedDeer)
  }, 100)
}

const stopRunning = () => {
  clearInterval(interval)
  selectedDeer = deerOne
  selectedDeerIndex = 0
}

watchEffect(() => {
  props.running ? startRunning() : stopRunning()
})


</script>

<style>
.container{
  width:100px;
  height: 100px;
}

.deer {
  width: 100%;
}
</style>
