<template>
  <div class="task-list-card">
    <h3 class="task-status">{{ state.status }}</h3>
    <ul>
      <li v-for="task in tasks">
        <NuxtLink
          :to="`/${$route.params.project_id}/task/${task.id}`"
          class="task-card"
          draggable="true"
          @dragstart="dragTask($event, task.id)"
        >
          {{ abbreviate(task.name) }}
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import TextUtils from "~~/utils/text-utils";
export default defineComponent({
  props: {
    status: String,
    tasks: Object,
  },
  async setup(props) {
    const state = reactive({
      status: props.status,
      tasks: props.tasks,
    });
    const abbreviate = (name: string) => {
      return TextUtils.abbreviate(name, 12);
    };
    const dragTask = (event, taskId) => {
      event.dataTransfer.effectAllowd = "move";
      event.dataTransfer.dropEffect = "move";
      event.dataTransfer.setData("task-id", taskId);
    };
    return {
      state,
      abbreviate,
      dragTask,
    };
  },
});
</script>

<style lang="scss" scoped>
.task-list-card {
  width: 228px;
  height: 80vh;
  border-radius: 8px;
  border: solid 1px #ddd;
  margin: 0px 8px;
  background-color: rgba(200, 200, 200, 0.5);
}
.task-status {
  color: #444;
  margin-left: 8px;
}
.task-card {
  color: #444;
  border-radius: 8px;
  background-color: white;
  text-decoration: none;
  padding: 8px;
  display: block;
  margin: 8px;
  &:hover {
    opacity: 0.8;
  }
}
</style>
