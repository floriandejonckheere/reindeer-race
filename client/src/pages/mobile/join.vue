<template>
  <link href="https://fonts.googleapis.com/css?family=Mountains of Christmas" rel="stylesheet" />
  <h1>REINDEER RACE</h1>
  <form ref="scheme_form">
    <label for="name">Gebruikersnaam:</label>
    <br />
    <input v-model="name" type="text" name="name" id="name_field" />
    <br />

    <div class="radio-toolbar">
      <div v-for="(colour_active, colour_name) in colours">
        <input v-if="colour_active" type="radio" id="radio-button" name="radioFruit" value="apple" />
        <label
          v-if="!colour_active"
          v-on:click="radio_button_clicked(colour_name)"
          v-bind:class="colour_name"
          for="radio-button"
          class="radio-button-label"
        ></label>
      </div>
    </div>

    <br />
    <button type="button" @click="join_button">Join</button>
  </form>
</template>

<script setup lang="ts">
import { onBeforeUnmount, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

let name = $ref('')
let error = $ref('')
let colours = $ref('')
let game_id = $ref('')
let interval = $ref<number | null>(null)
let selected_colour = $ref('')

onMounted(() => {
  // interval = setInterval(fetchGame, 1000)
  fetchGame()
})

onBeforeUnmount(() => {
  if (interval) clearInterval(interval)
})

function radio_button_clicked(colour_name) {
  var radio_button_labels = document.getElementsByClassName("radio-button-label")
  console.log(radio_button_labels)
  for (var label of radio_button_labels) {
    label.classList.remove("selected-radio-button")
  }
  selected_colour = colour_name
  document.getElementsByClassName(selected_colour)[0].classList.add("selected-radio-button")
}

async function fetchGame() {
  const get_game = `${import.meta.env.VITE_SERVER_URL}/game`
  const response = await fetch(get_game)
  const data = await response.json()

  game_id = data.game_id
  colours = data.colours
}

async function join_button() {
  var post_data = { "name": name, "colour": selected_colour }
  console.log(post_data)
  const join_game = `${import.meta.env.VITE_SERVER_URL}/game/${game_id}/user`
  const response = await fetch(join_game, {
    method: 'POST',
    mode: 'cors',
    credentials: 'same-origin',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(post_data)
  })

  router.push({ name: 'mobile-lobby', query: { game_id } })

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

#name_field {
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

.radio-toolbar input[type="radio"] {
  opacity: 0;
  position: fixed;
  width: 0;
}

.radio-toolbar div {
  display: inline-block;
  margin-top: 5px;
}

.radio-button-label {
  padding: 1px 10px;
  border: 0px solid;
  border-radius: 10px;
  margin-right: 2px;
  margin-left: 2px;
}

.red {
  background-color: red;
}

.blue {
  background-color: blue;
}

.green {
  background-color: green;
}

.purple {
  background-color: purple;
}

.yellow {
  background-color: yellow;
}

.orange {
  background-color: orange;
}

.pink {
  background-color: pink;
}

.gray {
  background-color: gray;
}

.selected-radio-button {
  border: 2px solid black !important;
  margin-right: 0px !important;
  margin-left: 0px !important;
}
</style>
