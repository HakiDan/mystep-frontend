<template>

  <div style="background: white">
    <v-row no-gutters class="pa-3">
      <v-col class="col-12 col-md-6" style="float: left">
        <v-img :src="require('~/static/landing-banner.png')" />
      </v-col>
      <v-col class="my-auto">
        <v-row no-gutters>
          <h1 class="py-4 px-3 v-mobile-text title-font">
            PELUANG PEKERJAAN<br />UNTUK RAKYAT MALAYSIA<br />
          </h1>
        </v-row>
      </v-col>
    </v-row>

    <v-row class="px-md-8" no-gutters>
      <v-col style="align: center; display: inline-block; position: relative">
        <v-img
          class="v-img-center logo-center"
          :src="require('assets/mystep-logo/mystep-3.png')"
          style=""
        />
      </v-col>
    </v-row>
    <v-row class="px-md-8 pb-8" no-gutters>
      <v-col cols="12" class="text-center v-caption-text">
        <h2>
          MySTEP membuka peluang pekerjaan jangka pendek di Sektor Awam, Agensi
          Kerajaan serta Syarikat Berkaitan Kerajaan (GLC) secara kontrak.
        </h2>
      </v-col>
    </v-row>

    <v-row no-gutters class="text-center py-10">
      <v-col cols="12" class="mx-auto">
        <h1 class="title v-montserrat-500">INISIATIF OLEH:</h1>
      </v-col>
      <v-col cols="12" class="mx-auto">
        <v-img
          :src="require('assets/mystep-logo/my.png')"
          style="width: 150px; height: 150px"
          class="mx-auto"
        />
        <h3 class="v-subtitle-2">KERAJAAN MALAYSIA</h3>
      </v-col>
      <v-col cols="12" class="mx-auto mt-3">
        <h2 class="v-subtitle-2 font-weight-bold my-4">DENGAN KERJASAMA:</h2>
      </v-col>
      <v-row no-gutters class="text-center">
        <v-col class="mx-auto col-md-12 col-2">
          <div class="d-flex align-items-center justify-center flex-wrap">
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/khazanah.png')"
              max-width="120"
            />
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/pnb.png')"
              max-width="120"
            />
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/petronas-1.png')"
              max-width="120"
            />
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/kwsp.png')"
              max-width="120"
            />
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/mystep-logo-mof.png')"
              max-width="120"
            />
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/ltat.png')"
              max-width="120"
            />
            <v-img
              class="mx-2"
              :src="require('assets/mystep-logo/kw.png')"
              max-width="120"
            />
          </div>
        </v-col>
      </v-row>
    </v-row>
    
    <v-dialog v-model="modalVisible" persistent max-width="600">
      <v-card>
        <v-card-title class="headline">MAKLUMAT TERKINI</v-card-title>
        <v-card-text style="text-align: center;">
          Permohonan MySTEP 2024 telah dibuka. Bagi membuat permohonan, sila layari 
          <br>
          <a href="https://myfuturejobs.gov.my"><u>https://myfuturejobs.gov.my</u></a> atau <a href="https://candidates.myfuturejobs.gov.my"><u>https://candidates.myfuturejobs.gov.my</u></a>.
          <br>
          <br>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click="closeModal">OK</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
  
</template>

<script>

export default {
    
  data: () => ({
    model: 0,
    colors: ['white'],
    arrowToggle: false,
    modalVisible: false
  }),
  mounted() {
    // Display modal after 1 seconds (1000 milliseconds)
    setTimeout(() => {
      this.modalVisible = true;
    }, 1000);
  },
  methods: {
    closeModal() {
      this.modalVisible = false;
    },
    head() {
    return {
      title: 'Laman Utama MySTEP',
      meta: [
        {
          hid: 'description',
          name: 'description',
          content:
            'Halaman Utama mengandungi penerangan ringkas tentang MySTEP serta navigation bar yang akan membawa pengguna ke halaman Pengenalan, Permohonan, Info, FAQ dan Majikan',
        },
        {
          hid: 'og:description',
          name: 'og:description',
          content:
            'Halaman Utama mengandungi penerangan ringkas tentang MySTEP serta navigation bar yang akan membawa pengguna ke halaman Pengenalan, Permohonan, Info, FAQ dan Majikan',
        },
        { hid: 'og:title', name: 'og:title', content: 'Laman Utama MySTEP' },
      ],
    }
  },
  },

}

</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:wght@200;300;500&display=swap');

html,
body {
  font-family: 'Roboto', sans-serif;
}

#app {
  font-family: 'Roboto', sans-serif;
}

.div {
  box-shadow: 5px 10px;
}

.v-expansion-panel-content >>> .v-expansion-panel-content__wrap {
  padding: 0 !important;
}

.v-btn:not(.v-btn--round).v-size--default {
    height: 36px;
    min-width: 80px;
    padding: 0 16px;
}

.v-dialog > .v-card > .v-card__actions {
  display: flex;
  padding: 12px 24px 16px;
  justify-content: center;
}

.v-dialog > .v-card > .v-card__title {
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
  font-size: 1.25rem;
  font-weight: 500;
  letter-spacing: 0.0125em;
  padding: 16px 24px 16px;
}

.v-dialog > .v-card > .v-card__text {
  width: 100%;
  text-align: justify;
  padding: 0 28px 0px;
}

@media (max-width: 959px) {
  .v-mobile-text {
    font-size: 9vw;
    text-align: center !important;
    width: 100%;
    font-family: 'Bebas Neue', cursive;
    font-weight: 500;
  }
}
@media (min-width: 960px) {
  .v-mobile-text {
    font-size: 48px;
    text-align: left;
    font-family: 'Bebas Neue', cursive;
    font-weight: 300;
  }
}

@media (max-width: 959px) {
  .v-buttons-center {
    font-size: 2vh;
    display: inline-block;
    float: none !important;
    left: 50%;
    position: relative;
    transform: translate(-50%);
  }
}

@media (min-width: 960px) {
  .v-buttons-center {
    font-size: 20px;
  }
}

@media (max-width: 959px) {
  .v-caption-text {
    font-size: 2.8vw;
    font-family: 'Montserrat', sans-serif;
    font-weight: 300;
  }
}

@media (min-width: 960px) {
  .v-caption-text {
    max-width: 60%;
    text-align: center;
    position: relative;
    display: inline-block;
    float: none !important;
    left: 50%;
    transform: translate(-50%);
    font-family: 'Montserrat', sans-serif;
  }
}

.v-montserrat-200 {
  font-family: 'Montserrat', sans-serif;
  font-weight: 200;
  font-size: 1rem;
  line-height: 2rem;
  letter-spacing: 0.0125em !important;
}
.v-montserrat-500 {
  font-family: 'Montserrat', sans-serif;
  font-weight: 500;
  font-size: 1rem;
  line-height: 2rem;
  letter-spacing: 0.0125em !important;
}

@media (min-width: 960px) {
  .logo-center {
    left: 50%;
    max-width: 50%;
    transform: translate(-50%);
  }
}

.v-subtitle-2 {
  font-size: 0.875rem !important;
  font-weight: 500;
  letter-spacing: 0.0071428571em !important;
  line-height: 1.375rem;
  font-family: 'Montserrat', sans-serif;
}

.align-items-center {
  align-items: center;
}
</style>
