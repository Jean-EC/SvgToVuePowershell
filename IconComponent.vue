<template>
  <component :is="icons[name]" />
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      icons: {},
    };
  },
  async created() {
    const modules = import.meta.glob('./icons/*.vue');
    for (const path in modules) {
      const module = await modules[path]();
      const name = path.slice('./icons/'.length, -'.vue'.length);
      this.icons[name] = module.default;
    }
  },
};
</script>
