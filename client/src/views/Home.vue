<template>
  <div>
    <img
      src="../assets/images/vienna-city-marathon-2017-vcm-laufen-sport-sportstadt-wien-zieleinlauf-burgtheater.jpg"
      width="100%"
    />
    <p class="text-h2 text-center mt-4 font-weight-light red--text">Vienna City Marathon 2022</p>
    <p class="text-h6 font-weight-medium">
      Der 39. Vienna City Marathon findet 2022 wieder wie gewohnt im Frühjahr statt und eröffnet Wiens
      Lauf-Jahr.
    </p>
    <p>
      Rund 22.000 Personen haben sich bereits für den Vienna City Marathon und die Nebenläufe angemeldet. Die
      Strecke bleibt wie in den Jahren zuvor: Der Startschuss für den Hauptlauf fällt wie gewohnt beim Vienna
      International Centre - der UNO-City. Weiter geht’s über die Reichsbrücke durch den Wiener Prater zur
      Ringstraße, vorbei an imperialen Prachtbauten, und von der Staatsoper hinaus zum Schloss Schönbrunn und
      wieder zurück zu Ring und Prater. Das Ziel liegt zwischen Burgtheater und Rathaus.
    </p>
    <p class="text-center text-h6 mt-4 font-italic">Die Anmeldung ist noch bis 4.April möglich!</p>
    <p class="text-center text-no-wrap red white--text">HIER GEHTS ZUR ANMELDUNG</p>

    <v-carousel hide-delimiters show-arrows-on-hover>
      <v-carousel-item v-for="i of 6" :key="i" :src="`images/${i}.jpg`"></v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {};
  },
};
</script>
