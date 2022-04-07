<template>
  <div>
    {{ detailSight }}
    <!-- <div class="d-flex flex-wrap justify-center">
      <v-card class="mb-5 mr-5" max-width="344">
        <v-img :src="`http://localhost:3000/${detailSight.image}`" height="200px"></v-img>

        <v-card-title> {{ detailSight.title }} </v-card-title>
        <v-card-text class="d-inline-block text-truncate">
          {{ detailSight.description }}
        </v-card-text>
      </v-card>
    </div> -->
  </div>
</template>

<script>
export default {
  props: {
    detailSight: {
      type: Array,
    },
  },
};
</script>

<style lang="scss" scoped></style>
