<template>
  <v-dialog persistent max-width="450" v-bind="$attrs" v-on="$listeners">
    <v-card class="pa-3 rounded-xl mx-auto">
      <v-card-title class="justify-center text-center font-weight-bold">
        Permohonan Anda Berjaya Dihantar
      </v-card-title>
      <v-card-text class="text-center"
        >Jika anda terpilih, kami akan hubungi anda dalam tempoh 30
        hari</v-card-text
      >
      <v-card-actions class="justify-center">
        <v-btn class="white--text" elevation="0" color="#FFB300" to="/">
          Setuju
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>