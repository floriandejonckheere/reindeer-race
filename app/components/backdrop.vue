<template>
  <div class='backdrop'>
    <template v-for="_ in 3">
      <img class='snow-landscape' ref="snowLandscape" :src=snowLandscapeUrl>
    </template>
  </div>
</template>

<script>

import _snowLandscapeUrl from '../images/backdrop.svg'

export default {
  data() {
    return {
      snowLandscapeUrl: _snowLandscapeUrl,
      reelActive: false,
      snowLandscapes: null,
      frameInterval: null,
      frameTickTime: 15,
      frameTickDistance: 5
    }
  },

  mounted() {
    this.snowLandscapes = this.$refs.snowLandscape
    this.toggleReel()
  },

  methods: {

    toggleReel() {
      this.reelActive = !this.reelActive
    },

    startReel() {
      this.frameInterval = setInterval(this.moveReelFrame, this.frameTickTime)
    },

    stopReel() {
      if (this.frameInterval) clearInterval(this.frameInterval)
    },

    moveReelFrame() {
      const snowLandscape = this.snowLandscapes[0]
      const oldMargin = parseInt(getComputedStyle(snowLandscape).getPropertyValue('margin-left'))
      const newMargin =  oldMargin - this.frameTickDistance
      snowLandscape.style.setProperty('margin-left', `${newMargin}px`)
      const amountSnowLandscapeVisible =  parseInt(snowLandscape.width) + parseInt(snowLandscape.offsetLeft)
      if (amountSnowLandscapeVisible === 0) snowLandscape.style.setProperty('margin-left', '0px')
    },
  },
  watch: {
    reelActive() {
      this.reelActive ? this.startReel() : this.stopReel()
    }
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
