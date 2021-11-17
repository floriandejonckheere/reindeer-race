<template>
  <table class="customer">
    <header>
      <th></th>
      <th>NickName</th>
      <th>Time</th>
    </header>
    <body>
      <tr v-for="(score, idx) in scores" :key="idx">
        <td>{{ idx }}</td>
        <td>{{ score.username }}</td>
        <td>{{ score.score }}</td>
      </tr>
    </body>
  </table>
</template>

<script setup>
import { defineProps, onMounted } from "vue";
const props = defineProps({
  type: String,
  id: Number,
});
let scores = $ref([]);
console.log(props);

onMounted(() => {
  getScores();
});

async function getScores() {
  // const endpoint = import.meta.env.VITE_SERVER_URL;
  // const better_endpoint = props.type === "gameResult" ? `${endpoint}/game/${props.id}/score` : `${endpoint}/leaderboard`
  // const response = await fetch(better_endpoint)
  // const data = await response.json()
  const data = {
    scores: [
      {
        username: "Jasper",
        score: 23456,
      },
      {
        username: "Karl-Erik",
        score: 23456,
      },
      {
        username: "Pieter",
        score: 23456,
      },
      {
        username: "Florian",
        score: 23456,
      },
      {
        username: "Yannick",
        score: 23456,
      },
    ],
  };

  scores = data.scores;
}
</script>
