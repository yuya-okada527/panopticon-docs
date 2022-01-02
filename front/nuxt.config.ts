import { defineNuxtConfig } from "nuxt3";

// https://v3.nuxtjs.org/docs/directory-structure/nuxt.config
export default defineNuxtConfig({
  css: ["@/assets/style/global.css", "@/assets/style/github.css"],
  publicRuntimeConfig: {
    API_URL: process.env.API_URL || "http://localhost:3000",
  },
});
