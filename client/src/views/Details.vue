<template>
  <div>
    <div class="d-flex flex-wrap justify-center">
      <v-card class="mb-5 mr-5" max-width="750">
        <v-img :src="`http://localhost:3000/${sight.image}`" height="200px"></v-img>

        <v-card-title> {{ sight.title }} </v-card-title>
        <v-card-text class="d-inline-block">
          {{ sight.description }}
        </v-card-text>
      </v-card>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sight: [],
    };
  },
  created() {
    this.getOneSight();
  },
  props: {
    detailSight: {
      type: Array,
    },
    id: {
      type: String,
    },
    sights: {
      type: Array,
    },
  },
  methods: {
    getOneSight() {
      this.sight = this.sights.filter((el) => el.id === Number(this.id))[0];
    },
  },
};
</script>

<style lang="scss" scoped></style>
