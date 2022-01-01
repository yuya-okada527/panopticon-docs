<template>
  <div @click="$emit('click')" class="trash"></div>
</template>

<style lang="scss" scoped>
.trash {
  font-size: 12px;
  position: relative;
  width: 0.9em;
  height: 1.2em;
  border-left: 0.1em solid #d64339;
  border-right: 0.1em solid #d64339;
  border-bottom: 0.1em solid #d64339;
  border-radius: 0 0 0.1em 0.1em;
  background: linear-gradient(to bottom, #d64339 0%, #d64339 100%) 0.2em 0.2em,
    linear-gradient(to bottom, #d64339 0%, #d64339 100%) 0.4em 0.2em,
    linear-gradient(to bottom, #d64339 0%, #d64339 100%) 0.6em 0.2em;
  background-size: 0.1em 0.8em;
  background-repeat: no-repeat;
  cursor: pointer;
  &:hover {
    opacity: 0.6;
  }
}
/* 蓋 */
.trash::before {
  content: "";
  position: absolute;
  top: -0.1em;
  left: -0.2em;
  width: 1.3em;
  height: 0.1em;
  background-color: #d64339;
}
/* 取っ手 */
.trash::after {
  content: "";
  position: absolute;
  top: -0.3em;
  left: 0.1em;
  width: 0.5em;
  height: 0.2em;
  border-top: 0.1em solid #d64339;
  border-left: 0.1em solid #d64339;
  border-right: 0.1em solid #d64339;
  border-radius: 0.1em 0.1em 0 0;
}
</style>
