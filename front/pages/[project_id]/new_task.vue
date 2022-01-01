<template>
  <div>
    <div class="header">
      <h2>new task</h2>
      <button @click="createTask" class="create-button">Create</button>
    </div>

    <form class="form">
      <div class="box">
        <label class="label" for="name">Name</label>
        <input
          class="input-name"
          v-model="state.name"
          type="text"
          id="name"
          autocomplete="off"
        />
        <div class="underline"></div>
      </div>
      <div class="box">
        <label class="label" for="description">Description</label>
        <textarea
          v-model="state.description"
          name="description"
          id="description"
          cols="80"
          rows="20"
        ></textarea>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import ApiUrls from "~~/network/static/api-urls";

export default defineComponent({
  async setup() {
    const route = useRoute();
    const state = reactive({
      name: "",
      description: "",
    });
    const createTask = async () => {
      await useFetch(ApiUrls.getTasksUrl(route.params.project_id), {
        method: "POST",
        body: {
          name: state.name,
          description: state.description,
        },
      });
      state.name = "";
      state.description = "";
    };
    return {
      state,
      createTask,
    };
  },
});
</script>

<style lang="scss" scoped>
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.create-button {
  padding: 8px;
  margin: 12px;
  font-size: 1rem;
  background-color: blue;
  border: none;
  border-radius: 8px;
  color: white;
  cursor: pointer;
  opacity: 0.8;
  &:hover {
    opacity: 0.6;
  }
}
.box {
  margin: 16px 0;
}
.form {
  width: 480px;
}
.label {
  display: block;
}
.input-name {
  width: 100%;
  border: none;
  outline: none;
}
.underline {
  position: relative;
  border-top: 1px solid grey;
  &::before {
    position: absolute;
    left: 0px;
    bottom: 0px;
    width: 0px;
    height: 1px;
    content: "";
    background-color: #3be5ae;
    transition: all 0.2s;
  }
}
.input-name:focus + .underline::before {
  width: 100%;
}
</style>
