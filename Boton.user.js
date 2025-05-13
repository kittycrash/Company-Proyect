JavaScript:(function () {
  // 1. Crear el botón flotante
  const btn = document.createElement("button");
  btn.innerText = "Optimizar HLS 250p";
  Object.assign(btn.style, {
    position: "fixed",
    bottom: "20px",
    right: "20px",
    zIndex: 9999,
    padding: "12px 18px",
    backgroundColor: "#0084ff",
    color: "white",
    border: "none",
    borderRadius: "8px",
    fontSize: "14px",
    fontWeight: "bold",
    boxShadow: "0 4px 8px rgba(0,0,0,0.2)",
    cursor: "pointer"
  });

  // 2. Agregar botón a la página
  document.body.appendChild(btn);

  // 3. Función para cargar HLS.js y optimizar video
  const loadHLS = (callback) => {
    if (typeof Hls !== "undefined") {
      callback();
    } else {
      const script = document.createElement("script");
      script.src = "https://cdn.jsdelivr.net/npm/hls.js@latest";
      script.onload = () => callback();
      document.head.appendChild(script);
    }
  };

  // 4. Lógica de optimización
  const optimizeHLS = () => {
    const video = document.querySelector("video");
    const src = video?.getAttribute("data-hls") || video?.src;
    if (!video || !src) return alert("No se encontró video HLS");

    if (Hls.isSupported()) {
      const hls = new Hls({
        startLevel: 0,
        capLevelToPlayerSize: true,
        maxMaxBufferLength: 30
      });
      hls.loadSource(src);
      hls.attachMedia(video);
      hls.on(Hls.Events.MANIFEST_PARSED, (ev, data) => {
        const low = data.levels.length - 1;
        hls.currentLevel = low;
        alert("Resolución forzada: " + data.levels[low].height + "p");
      });
    } else if (video.canPlayType("application/vnd.apple.mpegURL")) {
      video.play();
      alert("Reproducción HLS nativa activada.");
    } else {
      alert("Este navegador no soporta HLS.");
    }
  };

  // 5. Acción al hacer clic en el botón
  btn.onclick = () => loadHLS(optimizeHLS);
})();