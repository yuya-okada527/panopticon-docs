<template>
  <div>
    <div class="main-header">
      <h2>Projects</h2>
    </div>
    <ul class="cards">
      <li v-for="project in state.projects">
        <NuxtLink :to="`/${project.id}/tasks`" class="card">
          {{ project.name }}
        </NuxtLink>
      </li>
    </ul>
    <div class="card">
      <form>
        <label for="project-name">Name: </label>
        <input v-model="state.name" type="text" />
        <AddButton @click="onClickAddButton" />
      </form>
    </div>
  </div>
</template>

<script lang="ts">
import ApiUrls from "~~/network/static/api-urls";

type State = {
  name: string;
  projects: any;
};

export default defineComponent({
  async setup() {
    const config = useRuntimeConfig();
    const { data: projects } = await useFetch(
      ApiUrls.getProjectsUrl(config.API_URL)
    );
    const state: State = {
      name: "",
      projects: projects.value,
    };
    const onClickAddButton = async () => {
      await useFetch(ApiUrls.getProjectsUrl(config.API_URL), {
        method: "POST",
        body: {
          name: state.name,
        },
      });
      state.name = "";
      location.reload();
    };

    return {
      state,
      onClickAddButton,
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
