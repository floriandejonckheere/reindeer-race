<template>
  <div>
    <h1>Leaderboard</h1>
  </div>
  <div>
    <ScoreBoard type="gameResult" :id="gameId"></ScoreBoard>
  </div>
</template>

<script setup>
import ScoreBoard from "@/components/ScoreBoard.vue";
const gameId = 1;
</script>

<style scoped>
h1 {
  text-align: center;
  color: red;
}
</style>
