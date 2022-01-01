<template>
  <div @click="$emit('click')" class="update-icon"></div>
</template>

<style lang="scss" scoped>
.update-icon {
  font-size: 12px;
  position: relative;
  margin: 12px;
  width: 1.2em;
  height: 1.2em;
  border-top: 0.2em solid #39a9d6;
  border-left: 0.2em solid #39a9d6;
  border-right: 0.2em solid transparent;
  border-bottom: 0.2em solid #39a9d6;
  border-radius: 100% 100% 100% 100%;
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
  cursor: pointer;
  &::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0.9em;
    width: 0;
    height: 0;
    border-top: 0.4em solid transparent;
    border-left: 0.6em solid #39a9d6;
    border-bottom: 0.4em solid transparent;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
  }
  &:hover {
    opacity: 0.7;
  }
}
</style>
