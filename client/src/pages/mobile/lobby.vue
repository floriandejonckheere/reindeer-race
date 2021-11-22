<template>
  <div>Lobby</div>
  <div>
    <LobbyList :id="gameId"></LobbyList>
  </div>
</template>

<script setup>
import LobbyList from "@/components/LobbyList.vue";
const gameId = 1;
</script>

<style scoped>
h1 {
  text-align: center;
  color: red;
}
</style>
