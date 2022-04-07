<template>
  <div>
    <v-app-bar color="grey lighten-4" dark>
      <img src="../assets/Wien_logo.svg" class="mr-10" width="100px" />
      <v-toolbar-title class="black--text font-weight-light">Touristen Information</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn active-class="deep-orange white--text" class="mr-3 black--text" outlined to="/">News</v-btn>
      <v-btn active-class="deep-orange white--text" class="mr-3 black--text" outlined to="/sightseeing"
        >Sightseeing</v-btn
      >
      <v-btn active-class="deep-orange white--text" class="mr-3 black--text" outlined to="/events">Events</v-btn>
      <v-btn active-class="deep-orange white--text" class="black--text" outlined to="/datatable">Table</v-btn>
    </v-app-bar>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped></style>
