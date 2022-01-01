<template>
  <div class="provider-card">
    <div class="header">
      <div class="name">
        {{ state.provider.name }}
      </div>
      <SyncIcon @click="sync" />
      <DeleteButton @click="deleteProvider" />
    </div>
    <div>URL : {{ state.provider.provider_url }}</div>
    <div>
      <label class="label" for="token">Token: </label>
      <input class="input" v-model="state.token" type="text" />
    </div>
    <div>
      <label class="label" for="user_name">User Name: </label>
      <input class="input" v-model="state.userName" type="text" />
    </div>
  </div>
</template>

<script lang="ts">
import ApiUrls from "~~/network/static/api-urls";

export default defineComponent({
  props: {
    provider: Object,
  },
  async setup(props) {
    const route = useRoute();
    const state = reactive({
      provider: props.provider,
      token: "",
      userName: "",
    });
    const sync = async () => {
      await useFetch(
        ApiUrls.getTaskProviderSyncUrl(
          route.params.project_id,
          props.provider.id
        ),
        {
          method: "POST",
          body: {
            user_name: state.userName,
          },
          headers: {
            "X-Task-Provider-Token": state.token,
          },
        }
      );
      state.token = "";
      state.userName = "";
    };
    const deleteProvider = async () => {
      await useFetch(
        ApiUrls.getTaskProviderUrl(route.params.project_id, props.provider.id),
        {
          method: "DELETE",
        }
      );
    };
    return {
      state,
      sync,
      deleteProvider,
    };
  },
});
</script>

<style lang="scss" scoped>
.header {
  display: flex;
  align-items: center;
}
.name {
  font-weight: bold;
}
.provider-card {
  display: block;
  margin: 12px 0;
  padding: 12px;
  border-radius: 8px;
  background-color: rgba(200, 200, 200, 0.5);
}
.label {
  display: inline-block;
  width: 20%;
}
.input {
  width: 75%;
}
</style>
