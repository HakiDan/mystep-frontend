<template>  
    <v-app dark>
      <div class="errorMessage">
        <v-img max-width="200" src="./mystep-logo-crop.png" class="mx-auto" />
        <v-img src="./assets/error-graphic.jpg" class="mx-auto" max-width="250"/>
        <h1 v-if="error.statusCode === 404" class="primary-blue">
          {{ pageNotFound }}
        </h1>
        <h1 v-else class="primary-blue">
          {{ otherError }}
        </h1>
        <h2 class="pa-3">Sila hubungi 03-8882 4666 atau info.mystep@treasury.gov.my untuk mendapatkan bantuan.</h2>
        <v-btn
          class="mt-4 primary-blue-background white--text"
          to="/"
        >Kembali Ke Laman Utama
        </v-btn>
      </div>
      <v-footer
      padless
      class="pa-3 primary-blue-background white--text"
      inset
      app
    >
      <v-layout grow justify-center>
        Hak cipta © {{ new Date().getFullYear() }}
        Kerajaan Malaysia. Hak cipta terpelihara
      </v-layout>
    </v-footer>
    </v-app>  
</template>

<script>
export default {
  layout: 'blank',
  props: {
    error: {
      type: Object,
      default: null
    }
  },
  data () {
    return {
      pageNotFound: '404 | Laman Tidak Dijumpai',
      otherError: 'Ralat Berlaku Ketika Menyediakan Laman Ini'
    }
  },
  head () {
    const title =
      this.error.statusCode === 404 ? this.pageNotFound : this.otherError
    return {
      title
    }
  }
}
</script>

<style scoped>
h1 {
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
  font-size: 2rem;
  color: #505050;
  letter-spacing: 0.0125em !important;
}

h2 {
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
  font-size: 1rem;
  color: #505050;
  letter-spacing: 0.0125em !important;
}

.errorMessage {
  text-align: center;
  margin: auto;
  width: 70%;
}
</style>
