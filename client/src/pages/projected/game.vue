<template>
  <div style="width: 600px; margin: auto">
    <Reindeer :running="running"/>
    <Progress :marker-distance="markerDistance"/>
  </div>
</template>

<script setup>
import Progress from "@/components/Progress.vue";
import Reindeer from "@/components/Reindeer.vue"

let markerDistance = $ref(0)
let running = $ref(true)

</script>
