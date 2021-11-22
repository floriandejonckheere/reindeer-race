<template>
  <div class="backdrop">
    <template v-for="(_, idx) in 3">
      <img class="snow-landscape" :ref="(el) => (snowLandscapes[idx] = el)" :src="snowLandscapeUrl" />
    </template>
  </div>
</template>

<script setup>
import { watchEffect, onMounted, onBeforeUnmount } from "vue";
import snowLandscapeUrl from "@/assets/backdrop.svg";

let reelActive = $ref(false);
let snowLandscapes = $ref([]);

const frameTickDistance = 1;

watchEffect(() => {
  if (reelActive) startReel();
});

onMounted(() => {
  toggleReel();
});

onBeforeUnmount(() => {
  reelActive = false
})

function toggleReel() {
  reelActive = !reelActive;
}

function startReel() {
  requestAnimationFrame(moveReelFrame)
}

function moveReelFrame() {
  if (!reelActive) return

  requestAnimationFrame(moveReelFrame)

  const snowLandscape = snowLandscapes[0];
  const oldMargin = parseInt(
    getComputedStyle(snowLandscape).getPropertyValue("margin-left")
  );
  const newMargin = oldMargin - frameTickDistance;

  snowLandscape.style.setProperty("margin-left", `${newMargin}px`);

  const amountSnowLandscapeVisible =
    parseInt(snowLandscape.width) + parseInt(snowLandscape.offsetLeft);

  if (amountSnowLandscapeVisible <= 0) {
    snowLandscape.style.setProperty("margin-left", "0px");
  }
}
</script>

<style scoped>
.backdrop {
  display: flex;
  height: 100vh;
  overflow: hidden;
}
</style>