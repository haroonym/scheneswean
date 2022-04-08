<template>
  <div>
    <img src="../assets/images/1-blick-auf-die-ringstrasse-40707.jpg" width="100%" />
    <v-container>
      <p class="text-h4 text-center red--text">Sightseeing in Wien</p>
      <p>
        Es gibt viel zu sehen: Vom gotischen Stephansdom über die imperiale Hofburg bis zu Jugendstil, vom
        Barockschloss Schönbrunn über spannende Museen bis zu aktueller Architektur.
      </p>
      <div class="d-flex flex-wrap justify-center">
        <v-card v-for="(sight, i) in sights" :key="i" class="mb-5 mr-5" max-width="344">
          <v-img :src="`http://localhost:3000/${sight.image}`" height="200px"></v-img>

          <v-card-title> {{ sight.title }} </v-card-title>
          <v-card-text class="d-inline-block text-truncate">
            {{ sight.description }}
          </v-card-text>
          <v-btn class="red--text ml-2 mb-2" plain color="primary" :to="`/details/${sight.id}`"
            >Details</v-btn
          >
          <v-dialog transition="dialog-bottom-transition" max-width="600">
            <template v-slot:activator="{ on, attrs }">
              <v-btn class="red--text ml-2 mb-2" plain color="danger" v-bind="attrs" v-on="on">Mehr</v-btn>
            </template>
            <template v-slot:default="dialog">
              <v-card>
                <v-card-title class="text-h5 black--text font-weight-bold mb-5">
                  {{ sight.title }}
                </v-card-title>
                <v-card-subtitle v-if="sight.bez != null">
                  <p class="font-weight-light">Packages: {{ sight.bez }}</p>
                </v-card-subtitle>
                <v-card-subtitle v-else>
                  <p class="font-weight-light">Packages: keines</p>
                </v-card-subtitle>
                <v-card-text>
                  <p class="font-weight-light">{{ sight.description }}</p>
                </v-card-text>
                <v-card-actions>
                  <v-btn color="red" v-if="sight.bez == null" disabled text @click="dialog.value = false"
                    >Entfernen</v-btn
                  >
                  <v-btn
                    color="red"
                    v-else
                    text
                    @click="(dialog.value = false), delPackage(sight.id, sight.bez)"
                    >Entfernen</v-btn
                  >
                  <v-btn class="ml-auto" color="success" text @click="dialog.value = false">Beenden</v-btn>
                </v-card-actions>
              </v-card>
            </template>
          </v-dialog>

          <v-dialog transition="dialog-bottom-transition" max-width="600">
            <!-- eslint-disable-next-line -->
            <template v-slot:activator="{ on, attrs }">
              <v-btn class="red--text ml-auto mb-2" plain color="warning" v-bind="attrs" v-on="on"
                >Update</v-btn
              >
            </template>
            <template v-slot:default="dialog">
              <v-card>
                <v-card-title class="text-h5 black--text font-weight-bold mb-5">
                  {{ sight.title }}
                </v-card-title>
                <v-form class="mr-5 ml-5">
                  <v-text-field v-model="title" label="Title" required></v-text-field>
                  <v-text-field v-model="admission" label="Admission" required></v-text-field>
                </v-form>

                <v-card-actions>
                  <v-btn color="blue" text @click="(dialog.value = false), patchSight(sight.id)"
                    >Update</v-btn
                  >
                  <v-btn class="ml-auto" color="success" text @click="dialog.value = false">Beenden</v-btn>
                </v-card-actions>
              </v-card>
            </template>
          </v-dialog>
        </v-card>
      </div>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: {
    sights: {
      type: Array,
    },
  },
  data() {
    return {
      dialog: false,
      edited: [],
      title: '',
      admission: '',
    };
  },
  methods: {
    delPackage(id, bez) {
      this.$emit('delPackage', id, bez);
    },
    async patchSight(id) {
      try {
        const { data } = await axios({
          url: `http://localhost:3000/sight/${id}`,
          method: 'PATCH',
          contentType: 'application/json',
          data: {
            title: this.title,
            admission: this.admission,
          },
        });
        this.$emit('getSights');
        console.log(data);
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

<style lang="scss" scoped></style>
