<template>
  <div class="sidebar">
    <ul class="menu-list">
      <li v-for="menu in menus" :key="menu.name">
        <NuxtLink :to="menu.to" class="link">{{ menu.name }}</NuxtLink>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
export default defineComponent({
  async setup() {
    const route = useRoute();
    const menus = [
      {
        name: "Tasks",
        to: `/${route.params.project_id}/tasks`,
      },
      {
        name: "Providers",
        to: `/${route.params.project_id}/task_providers`,
      },
      {
        name: "Analysis",
        to: `/${route.params.project_id}/analysis`,
      },
      {
        name: "Retrospection",
        to: `/${route.params.project_id}/retrospection`,
      },
    ];
    return {
      menus,
    };
  },
});
</script>

<style lang="scss" scoped>
.sidebar {
  border-right: 1px solid grey;
  width: 200px;
  height: 100vh;
  margin-right: 16px;
}
.menu-list {
  list-style-type: none;
  padding-left: 16px;
  padding-right: 16px;
}
.link {
  color: #444;
  font-size: 1.2rem;
  text-decoration: none;
  padding: 12px;
  display: block;
  &:hover {
    background-color: rgba(200, 200, 200, 0.5);
    border-radius: 12px;
    opacity: 0.8;
  }
}
</style>
