<template>
  <v-app>
    <v-main>
      <Navbar />

        <router-view :sights="sights" @delPackage="delPackage" @getSights="getSights"
      />
    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios';
import Navbar from '@/components/Navbar.vue';
export default {
  name: 'App',
  components: {
    Navbar,
  },
  data: () => ({
    sights: [],
    detailSight: [],
  }),
  created() {
    this.getSights();
  },
  methods: {
    async getSights() {
      try {
        const { data } = await axios({
          url: 'http://localhost:3000/sights',
          method: 'GET',
        });
        this.sights = data;
      } catch (error) {
        console.error(error);
      }
    },
    async delPackage(id, bez) {
      try {
        const { data } = await axios({
          url: `http://localhost:3000/packages/${id}/${bez}`,
          method: 'DELETE',
        });
        this.getSights();
        console.log(data);
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>
