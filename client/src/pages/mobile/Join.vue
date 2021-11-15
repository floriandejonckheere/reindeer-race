<template>
  <link href="https://fonts.googleapis.com/css?family=Mountains of Christmas" rel="stylesheet" />
  <h1>REINDEER RACE</h1>
  <form ref="scheme_form">
    <label for="name">Gebruikersnaam:</label>
    <br />
    <input type="text" id="name" name="name" />
    <br />
    <button type="button">Join</button>
  </form>
</template>

<script setup lang="ts">

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
</style>
