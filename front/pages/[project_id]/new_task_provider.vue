<template>
  <div>
    <div class="header">
      <h1>new task provider</h1>
      <AddButton @click="onClickAddButton" />
    </div>
    <form>
      <label class="label" for="name">Name</label>
      <input
        v-model="state.name"
        class="input-name"
        type="text"
        id="name"
        autocomplete="off"
      />
      <div class="underline"></div>
      <div class="margin"></div>
      <label class="label" for="orgs">Organization</label>
      <input
        v-model="state.organization"
        class="input-name"
        type="text"
        id="orgs"
        autocomplete="off"
      />
      <div class="underline"></div>
      <div class="margin"></div>
      <label class="label" for="repository">Repository</label>
      <input
        v-model="state.repository"
        class="input-name"
        type="text"
        id="orgs"
        autocomplete="off"
      />
      <div class="underline"></div>
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
      kind: "",
      organization: "",
      repository: "",
    });

    const onClickAddButton = async () => {
      await useFetch(ApiUrls.getTaskProvidersUrl(route.params.project_id), {
        method: "POST",
        body: {
          name: state.name,
          provider_kind: "github",
          organization: state.organization,
          repository: state.repository,
        },
      });
      state.name = "";
      state.kind = "";
      state.organization = "";
      state.repository = "";
    };
    return {
      state,
      onClickAddButton,
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
.margin {
  margin: 12px;
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
