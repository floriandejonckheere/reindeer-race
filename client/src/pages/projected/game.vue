<template>
  <div style="width: 600px; margin: auto">
    <Progress :marker-distance="markerDistance"></Progress>
  </div>
</template>

<script setup>
import Progress from "@/components/Progress.vue";

let markerDistance = $ref(0)

</script>
