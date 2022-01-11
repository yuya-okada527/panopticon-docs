<template>
  <div class="sidebar">
    <ul class="menu-list">
      <li v-for="menu in store.menus" :key="menu.name">
        <a @click="handleMenuClick(menu.path)" class="link">{{ menu.name }}</a>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
type Menu = {
  name: string;
  path: string;
};
type Store = {
  menus: Menu[];
};
export default defineComponent({
  async setup() {
    const route = useRoute();
    const router = useRouter();
    const store: Store = reactive({
      menus: [
        {
          name: "Tasks",
          path: `tasks`,
        },
        {
          name: "Providers",
          path: `task_providers`,
        },
        {
          name: "Analysis",
          path: `analysis`,
        },
        {
          name: "Retrospection",
          path: `retrospection`,
        },
      ],
    });
    const handleMenuClick = (path: string) => {
      // TOOD 暫定対応
      const defaultProject = 1;
      if (!route.params.project_id) {
        router.push(`/${defaultProject}/${path}`);
        return;
      }
      router.push(`/${route.params.project_id}/${path}`);
    };
    return {
      store,
      handleMenuClick,
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
