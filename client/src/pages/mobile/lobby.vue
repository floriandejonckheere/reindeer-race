<template>
  <div>Lobby</div>
  <div>
    <LobbyList :id="gameId"></LobbyList>
  </div>
</template>

<script setup>
import LobbyList from "@/components/LobbyList.vue";
import { useRoute } from 'vue-router'

const router = useRoute()
const gameId = router.query.game_id;
</script>

<style scoped>
h1 {
  text-align: center;
  color: red;
}
</style>
