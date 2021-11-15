import { defineConfig } from "vite";
import Vue from "@vitejs/plugin-vue";
import Pages from "vite-plugin-pages";

export default defineConfig({
  server: {
    port: 3001,
  },
  plugins: [Vue(), Pages()],
});
