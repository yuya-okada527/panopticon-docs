<template>
  <div>
    <div class="header">
      <h2>Providers</h2>
      <AddButton @click="onClickAddButton" />
    </div>
    <ul class="provider-cards">
      <li v-for="provider in state.taskProviders">
        <TaskProvider :provider="provider" />
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import ApiUrls from "~~/network/static/api-urls";
import AddButton from "~~/components/add-button.vue";

type State = {
  taskProviders: any;
};

export default defineComponent({
  async setup() {
    const route = useRoute();
    const router = useRouter();
    const { data: taskProviders } = await useFetch(
      ApiUrls.getTaskProvidersUrl(route.params.project_id)
    );
    const state: State = {
      taskProviders: taskProviders.value,
    };
    const onClickAddButton = () => {
      router.push(`/${route.params.project_id}/new_task_provider`);
    };
    return {
      state,
      onClickAddButton,
    };
  },
  components: { AddButton },
});
</script>

<style lang="scss" scoped>
.header {
  display: flex;
}
.provider-cards {
  width: 640px;
}
</style>
