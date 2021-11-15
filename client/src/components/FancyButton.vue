<template>
  <div
    id="button_control"
    onclick="document.getElementById('top-oval').classList.remove('play-top');
      document.getElementById('top-oval').offsetHeight;
      document.getElementById('center-rectangle').classList.remove('play-rectangle');
      document.getElementById('center-rectangle').offsetHeight;
      document.getElementById('top-oval').classList.add('play-top');
      document.getElementById('center-rectangle').classList.add('play-rectangle');"
  >
    <div id="top-oval"></div>
    <div id="center-rectangle"></div>
    <div id="bottom-oval"></div>
  </div>
</template>

<script setup lang="ts">

</script>

<style>
#top-oval {
  width: 200px;
  height: 70px;
  background-color: darkred;
  border-radius: 200px / 70px;
  position: absolute;
  top: 165px;
  z-index: 10;
}

.play-top {
  animation: button_top_oval 0.2s;
}

#center-rectangle {
  width: 200px;
  height: 100px;
  background: red;
  position: absolute;
  top: 200px;
  z-index: 5;
}

.play-rectangle {
  animation: button_rectangle 0.2s;
}

#bottom-oval {
  width: 200px;
  height: 70px;
  background-color: red;
  border-radius: 200px / 70px;
  position: absolute;
  top: 265px;
}

#button_control {
  position: relative;
  height: 300px;
  width: 100px;
}

@keyframes button_rectangle {
  0% {
    height: 100px;
    top: 200px;
  }
  100% {
    height: 50px;
    top: 250px;
  }
}

@keyframes button_top_oval {
  0% {
    top: 165px;
  }
  100% {
    top: 215px;
  }
}
</style>
