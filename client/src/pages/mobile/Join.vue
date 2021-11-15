<template>
  <link href="https://fonts.googleapis.com/css?family=Mountains of Christmas" rel="stylesheet" />
  <h1>REINDEER RACE</h1>
  <form ref="scheme_form">
    <p>{{ name }}</p>
    <label for="name">Gebruikersnaam:</label>
    <br />
    <input v-model="name" type="text" name="name" />
    <br />
    <button type="button" @click="join_button">Join</button>
  </form>
</template>

<script setup lang="ts">import { onBeforeUnmount, onMounted } from '@vue/runtime-core'

let name = $ref('')
let error = $ref('')
let colours = $ref([])
let game_id = $ref('')
let interval = $ref<number | null>(null)

onMounted(() => {
  interval = setInterval(fetchGame, 1000)
})

onBeforeUnmount(() => {
  if (interval) clearInterval(interval)
})

async function fetchGame() {
  const get_game = `${import.meta.env.SERVER_URL}/game`
  const response = await fetch(get_game)
  const data = await response.json()

  game_id = data.game_id
  colours = data.colours
}

async function join_button() {
  const join_game = `${import.meta.env.SERVER_URL}/game/${game_id}/user`

}

</script>

<style scoped>
h1 {
  font-family: "Mountains of Christmas";
  background-image: linear-gradient(
    to left,
    violet,
    indigo,
    green,
    blue,
    yellow,
    orange,
    red
  );
  -webkit-background-clip: text;
  -moz-background-clip: text;
  background-clip: text;
  color: transparent;
  margin: auto;
  width: 90%;
  display: line;
  font-size: 45px;
}

form {
  position: fixed;
  top: 30%;
  left: 30%;
}

input {
  width: 80%;
  height: 30px;
  text-align: center;
  vertical-align: middle;
  line-height: 90px;
}

button {
  margin-left: 2%;
  margin-top: 30px;
  width: 80%;
  height: 30px;
}

label {
  color: red;
}

img {
  width: 200px;
  position: fixed;
  bottom: -50px;
  left: -80px;
}

html {
  background-color: aqua;
}
</style>
