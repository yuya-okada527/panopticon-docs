<template>
  <div>
    <div class="main-header">
      <h2>Projects</h2>
    </div>
    <ul class="cards">
      <li v-for="project in state.projects">
        <div class="card">
          {{ project.name }}
        </div>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import ApiUrls from "~~/network/static/api-urls";

type State = {
  projects: any;
};

export default defineComponent({
  async setup() {
    const config = useRuntimeConfig();
    const { data: projects } = await useFetch(
      ApiUrls.getProjectsUrl(config.API_URL)
    );
    const state: State = {
      projects: projects.value,
    };

    return {
      state,
    };
  },
});
</script>

<style lang="scss" scoped>
.main-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.cards {
  width: 640px;
}
.card {
  display: block;
  margin: 12px 0;
  padding: 12px;
  border-radius: 8px;
  background-color: rgba(200, 200, 200, 0.5);
}
</style>
