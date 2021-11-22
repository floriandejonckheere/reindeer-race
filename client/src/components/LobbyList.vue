<template>
<table>
  <header>
    <th></th>
    <th>Players</th>
    <th>Color</th>
  </header>
  <body>
    <tr v-for="(reindeer1, idx) in reindeer" :key="idx">
      <td>{{ idx }}</td>
      <td>{{ reindeer1.username }}</td>
      <td>{{ reindeer1.color }}</td>
    </tr>
  </body>
</table>
<body></body>
</template>

<script setup>
import { defineProps, onMounted } from "vue";
const props = defineProps({
  id: Number
});

let reindeer = $ref([]);

onMounted(() => {
  getGame();
});

async function getGame() {
  // const endpoint = import.meta.env.VITE_SERVER_URL;
  // const better_endpoint = `${endpoint}/game/${props.id}/`
  // const response = await fetch(better_endpoint)
  // const data = await response.json()
  const data = {
    reindeer: [
      {
        username: "Jasper",
        position: 0,
        color: "green",
      },
      {
        username: "Karl-Erik",
        score: 0,
        color: "red"
      },
      {
        username: "Pieter",
        score: 0,
        color: "blue",
      },
      {
        username: "Florian",
        score: 0,
        color: "black",
      },
      {
        username: "Yannick",
        score: 0,
        color: "purple",
      },
    ],
    progress: 0,
    time_elapsed: 0,
    state: "waiting"
  };

  reindeer = data.reindeer;
}

</script>