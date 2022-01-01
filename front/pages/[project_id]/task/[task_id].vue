<template>
  <div>
    <div class="header">
      <h2>{{ state.task.name }}</h2>
      <a :href="state.task.external_url" class="external-link">
        {{ "#" + state.task.id }}
      </a>
      <SyncIcon @click="onUpdateIconClick" />
    </div>
    <div class="status">
      <label for="status">Status: </label>
      <select v-model="state.task.status" name="status" id="status">
        <option value="created">Created</option>
        <option value="todo">Todo</option>
        <option value="doing">Doing</option>
        <option value="done">Done</option>
        <option value="closed">Closed</option>
      </select>
    </div>
    <div>
      <label for="preview">Preview</label>
      <input v-model="state.previewMarkdown" type="checkbox" id="preview" />
    </div>
    <textarea
      v-if="!state.previewMarkdown"
      v-model="state.task.description"
      name="description"
      id="description"
      cols="80"
      rows="30"
    >
    </textarea>
    <div v-else v-html="parsedHtml"></div>
  </div>
</template>

<script lang="ts">
import ApiUrls from "~~/network/static/api-urls";
import SyncIcon from "~~/components/sync-icon.vue";
import { marked } from "marked";
import DOMPurify from "dompurify";
import hljs from "highlight.js";

type State = {
  task: any;
  previewMarkdown: boolean;
};

export default defineComponent({
  async setup() {
    const route = useRoute();
    const { data: task } = await useFetch(
      ApiUrls.getTaskUrl(route.params.project_id, route.params.task_id)
    );
    const state: State = reactive({
      task: task.value,
      previewMarkdown: true,
    });
    const onUpdateIconClick = async () => {
      await useFetch(
        ApiUrls.getTaskUrl(route.params.project_id, route.params.task_id),
        {
          method: "PUT",
          body: {
            name: state.task.name,
            description: state.task.description,
            status: state.task.status,
          },
        }
      );
    };
    marked.setOptions({
      langPrefix: "",
      highlight: function (code, lang) {
        return hljs.highlightAuto(code, [lang]).value;
      },
    });
    const parsedHtml = computed(() => {
      if (!state.task.description) {
        return "";
      }
      return DOMPurify.sanitize(marked(state.task.description));
    });
    return {
      state,
      onUpdateIconClick,
      parsedHtml,
    };
  },
  components: { SyncIcon },
});
</script>

<style lang="scss" scoped>
.header {
  display: flex;
  align-items: center;
}
.external-link {
  margin-left: 8px;
  color: blue;
  text-decoration: none;
}
.status {
  margin: 8px 0;
}
</style>
