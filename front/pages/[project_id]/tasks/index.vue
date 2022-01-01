<template>
  <div>
    <div class="main-header">
      <h2>Tasks</h2>
      <AddButton @click="onAddButtonClick" />
    </div>
    <div>
      <ul class="task-board">
        <li>
          <TaskList
            status="Created"
            :tasks="createdTasks"
            @drop.prevent="dropTask($event, 'created')"
            @dragover.prevent
            @dragenter.prevent
          />
        </li>
        <li>
          <TaskList
            status="Todo"
            :tasks="todoTasks"
            @drop.prevent="dropTask($event, 'todo')"
            @dragover.prevent
            @dragenter.prevent
          />
        </li>
        <li>
          <TaskList
            status="Doing"
            :tasks="doingTasks"
            @drop.prevent="dropTask($event, 'doing')"
            @dragover.prevent
            @dragenter.prevent
          />
        </li>
        <li>
          <TaskList
            status="Done"
            :tasks="doneTasks"
            @drop.prevent="dropTask($event, 'done')"
            @dragover.prevent
            @dragenter.prevent
          />
        </li>
      </ul>
    </div>
  </div>
</template>

<script lang="ts">
import TaskStatus from "~~/models/static/task-status";
import ApiUrls from "~~/network/static/api-urls";
import AddButton from "~~/components/add-button.vue";

export default defineComponent({
  async setup() {
    const route = useRoute();
    const router = useRouter();
    const { data: tasks } = await useFetch(
      ApiUrls.getTasksUrl(route.params.project_id)
    );
    // @ts-ignore
    const createdTasks = tasks.value.filter(
      (t) => t.status === TaskStatus.CREATED
    );
    // @ts-ignore
    const todoTasks = tasks.value.filter((t) => t.status === TaskStatus.TODO);
    // @ts-ignore
    const doingTasks = tasks.value.filter((t) => t.status === TaskStatus.DOING);
    // @ts-ignore
    const doneTasks = tasks.value.filter((t) => t.status === TaskStatus.DONE);
    // @ts-ignore
    // const closedTasks = tasks.value.filter(
    //   (t) => t.status === TaskStatus.CLOSED
    // );
    const onAddButtonClick = () => {
      router.push(`/${route.params.project_id}/new_task`);
    };
    const dropTask = async (event, dropTaskKind) => {
      // @ts-ignore
      const targetTask = tasks.value.filter(
        (t) => t.id === Number(event.dataTransfer.getData("task-id"))
      )[0];
      await useFetch(
        ApiUrls.getTaskStatusUrl(route.params.project_id, targetTask.id),
        {
          method: "PUT",
          body: {
            before_status: targetTask.status,
            after_status: dropTaskKind,
          },
        }
      );
      // TODO: リファクタリング
      location.reload();
    };

    return {
      createdTasks,
      todoTasks,
      doingTasks,
      doneTasks,
      onAddButtonClick,
      dropTask,
    };
  },
  components: { AddButton },
});
</script>

<style lang="scss" scoped>
.main-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.task-board {
  display: flex;
}
</style>
