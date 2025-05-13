javascript:(function(){
  function runHLSOptimization() {
    const log = console.log;
    if (typeof Hls !== 'undefined' && Hls.isSupported()) {
      const hls = new Hls({
        maxMaxBufferLength: 30,
        startLevel: 0,
        capLevelToPlayerSize: true
      });
      const video = document.querySelector("video");
      const src = video?.getAttribute("data-hls") || video?.src;
      if (video && src) {
        hls.loadSource(src);
        hls.attachMedia(video);
        hls.on(Hls.Events.MANIFEST_PARSED, (e, d) => {
          const lowest = d.levels.length - 1;
          hls.currentLevel = lowest;
          log("HLS optimizado a:", d.levels[lowest].height + "p");
        });
      } else {
        log("No se encontró video o URL HLS.");
      }
    } else if (document.querySelector("video")?.canPlayType("application/vnd.apple.mpegURL")) {
      const v = document.querySelector("video");
      v.play();
      log("HLS nativo activado.");
    } else {
      log("HLS no compatible en este navegador.");
    }
  }
  runHLSOptimization();
})();