<template>
  <v-row
    no-gutters
    class="ma-3 mb-10 px-6"
    style="font-family: 'Montserrat', sans-serif"
  >
    <v-col class="col-12 col-md-8 mx-auto ma-2 ma-md-6 mx-md-auto"
      ><h2 style="color: rgba(0, 0, 0, 0.6)">PENGENALAN</h2>
    </v-col>
    <v-col class="col-12 col-md-8 mx-auto" style="text-align: justify">
      Malaysia Short-Term Employment Programme (MySTEP) merupakan inisiatif
      Kerajaan yang menyediakan peluang pekerjaan jangka pendek (kontrak) di
      pelbagai Kementerian, Agensi Kerajaan, Syarikat Berkaitan Kerajaan (GLC),
      Syarikat Pelaburan Berkaitan Kerajaan (GLIC) dan Rakan Strategik.
      Inisiatif MySTEP ini disediakan khusus buat warganegara Malaysia yang
      berumur 18 tahun ke atas daripada pelbagai latar belakang akademik dalam
      usaha Kerajaan membuka lebih banyak peluang pekerjaan dan memberi
      pengalaman kerja bagi meningkatkan kebolehpasaran pekerja di Malaysia.<br /><br />

      Secara keseluruhannya, pada tahun 2021 MySTEP telah berjaya mencatatkan
      jumlah penyertaan sebanyak 64,921 yang mana telah melebihi jumlah sasaran
      asal sebanyak 50,000 penempatan pekerjaan. Bagi tahun 2022 pula, MySTEP
      mensasarkan sebanyak 80,000 peluang penempatan pekerjaan.<br /><br />

      Melihat kepada kejayaan program ini pada tahun-tahun sebelumnya, inisiatif
      MySTEP diteruskan seperti yang telah diumumkan dalam RUU Perbelanjaan
      Sementara 2023. Pada tahun ini, MySTEP diteruskan dengan menawarkan 50,000
      peluang penempatan pekerjaan yang meliputi 15,000 penempatan di Sektor
      Awam dan 35,000 penempatan di GLC / GLIC dan Rakan Strategik.<br /><br />

      Kerajaan berharap menerusi kesinambungan kepada inisiatif ini akan terus
      memberi manfaat khususnya kepada rakyat Malaysia dalam penempatan
      pekerjaan yang seterusnya akan mencapai hasrat Kerajaan untuk berada pada
      kadar guna tenaga penuh dan mengurangkan kadar pengangguran negara.
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {}
  },

  head() {
    return {
      title: 'Laman Pengenalan MySTEP',
      meta: [
        {
          hid: 'description',
          name: 'description',
          content:
            'Laman Pengenalan MySTEP memberi maklumat ringkas berkenaan program ini seperti objektif program, sasaran tahunan serta Kementerian dan Agensi yang terlibat',
        },
        {
          hid: 'og:description',
          name: 'og:description',
          content:
            'Laman Pengenalan MySTEP memberi maklumat ringkas berkenaan program ini seperti objektif program, sasaran tahunan serta Kementerian dan Agensi yang terlibat',
        },
        {
          hid: 'og:title',
          name: 'og:title',
          content: 'Laman Pengenalan MySTEP',
        },
      ],
    }
  },
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:wght@200;300;500&display=swap');
.v-application {
  font-family: 'Montserrat', sans-serif;
  font-weight: 200;
}
</style>
