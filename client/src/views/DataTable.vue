<template>
  <div>
    <template>
      <v-data-table :headers="headers" :items="sights" :items-per-page="5" class="elevation-1">
        <!-- eslint-disable-next-line -->
        <template v-slot:item.image="{ item }">
          <v-img :src="`http://localhost:3000/${item.image}`" width="100"></v-img></template
      ></v-data-table>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    sights: {
      type: Array,
    },
  },
  data() {
    return {
      headers: [
        {
          text: 'Title',
          align: 'start',
          value: 'title',
        },
        { text: 'Image', value: 'image' },
        { text: 'Admission', value: 'admission' },
        { text: 'Bezeichnung', value: 'bez' },
        { text: 'Discount', value: 'discount' },
      ],
    };
  },
};
</script>

<style lang="scss" scoped></style>
