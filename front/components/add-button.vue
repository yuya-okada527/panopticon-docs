<template>
  <button @click="$emit('click')" class="add-button">Add</button>
</template>

<style lang="scss" scoped>
.add-button {
  padding: 12px;
  margin: 12px;
  font-size: 1.2rem;
  background-color: blue;
  border: none;
  border-radius: 12px;
  color: white;
  cursor: pointer;
  &:hover {
    opacity: 0.6;
  }
}
</style>
