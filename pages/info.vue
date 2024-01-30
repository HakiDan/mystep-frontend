<template>
  <v-row no-gutters class="ma-3 mb-10" style="font-family: 'Montserrat', sans-serif;">
    <v-col class="col-12 col-md-8 mx-auto ma-2 ma-md-6 mx-md-auto">
      <h2 style="color: rgba(0, 0, 0, 0.6)">INFO</h2>
    </v-col>
    <v-col class="col-12 col-md-8 mx-auto">
      <v-expansion-panels 
        v-for="(item, index) in questions"
        :key="index"
        class="my-1"
        
      >
        <v-expansion-panel style="background-color: #e5e5e5;">
          <v-expansion-panel-header class="font-weight-bold v-montserrat-500">
            {{ index + 1 }}. {{ item.question }}
          </v-expansion-panel-header>
          <v-expansion-panel-content class="px-6">
            <p v-html="item.answer"></p>
          </v-expansion-panel-content>
        </v-expansion-panel>
      </v-expansion-panels>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      questions: [
        {
          question: 'Senarai Kementerian dan GLC yang terlibat',
          answer:
            '<a href="../assets/Lampiran A_Senarai Kementerian_2023.pdf" class="button-info white--text pa-3" download="Lampiran A_Senarai Kementerian_2023.pdf"><button class="button-info">MUAT TURUN</button></a><div class="mt-3">Senarai Kementerian : Seperti di Lampiran A<br>Senarai GLC : Senarai GLC yang mengambil bahagian akan dikemaskini dari semasa ke semasa</div>',
        },
        {
          question: 'Syarat Kelayakan MySTEP',
          answer:
            '<table><tr><th>Sektor Awam</th><th>GLC / GLIC / Rakan Strategik</th></tr><tr><td class="text-center" colspan="2">Warganegara Malaysia</td></tr><tr><td class="text-center" colspan="2">18 tahun ke atas</td></tr><tr><td>Lepasan Sekolah/ Lepasan Sijil Pelajaran Malaysia/ Lulusan Diploma/ Lulusan Ijazah Sarjana Muda dan ke atas</td><td>Lepasan Sijil Pelajaran Malaysia/ Lulusan Diploma/ Lulusan Ijazah Sarjana Muda dan ke atas</td></tr><tr><td>Bagi golongan Orang Kurang Upaya (OKU), pelantikan adalah tertakluk kepada Kementerian masing-masing</td><td>Bagi golongan Orang Kurang Upaya (OKU), pelantikan adalah tertakluk kepada GLC/GLIC/rakan strategik masing-masing</td></tr></table>',
        },
        {
          question: 'Penempatan Pekerjaan',
          answer:
            '<ol class="r"><li>Terdapat dua saluran program penempatan di bawah MySTEP iaitu:</li><ol class="a"><li>Penempatan di Sektor Awam</li><li>Penempatan di GLC, GLIC dan rakan strategik</li></ol><li>Penempatan perolehan perkhidmatan Personel MySTEP adalah berdasarkan output <b>tanpa tertakluk</b> kepada waktu/ tempat/ jadual bertugas yang terpakai kepada pegawai awam.</li><li>Personel MySTEP yang ditempatkan di sektor awam tidak tertakluk kepada Peraturan-Peraturan Awam 2012, Perintah-Perintah Am atau peraturan-peraturan yang berkuatkuasa ke atas pegawai awam.</li><li>  Bagi GLC / GLIC / rakan strategik, penempatan adalah berdasarkan kepada struktur program penempatan GLC / GLIC / rakan strategik masing-masing.</li><li>Kuota khas sebanyak satu (1) peratus kepada golongan OKU di dalam Sektor Awam / GLC / GLIC / rakan strategik.</li></ol><br>',
        },
        {
          question: 'Tempoh Perkhidmatan',
          answer:
            '<ol class="r"><div style="padding-bottom: 10px;">Tempoh Kontrak Perkhidmatan MySTEP adalah:</div></li><ol class="a"><li>Minimum satu (1) bulan dan maksimum dua belas (12) bulan; dan</li><li>Tempoh kuatkuasa kontrak tidak melangkau 31 Disember 2023 (Bagi Sektor Awam)</li></ol></ol>',
        },
        {
          question: 'Skop Kerja',
          answer:
            '<ol class="r"><li>Personel MySTEP dilantik untuk melaksanakan segala skop kerja yang ditetapkan dan bersesuaian dengan keperluan Kementerian / Jabatan / Agensi dan tertakluk kepada Garis Panduan Perolehan Perkhidmatan Personel MySTEP dibawah Inisiatif Malaysia Short Term Employment Programme (MySTEP) 2023.</li><li>Skop tugas bagi personel MySTEP dilantik di GLC / GLIC / Rakan Strategik adalah tertakluk kepada keperluan dan skop tugas yang ditetapkan setiap program penempatan masing-masing.</li>',
        },
        {
          question: 'Kadar Upah',
          answer:
            '<ol class="r"><li>Penetapan kadar upah sebenar yang ditawarkan adalah dibawah bidang kuasa Pegawai Pengawal berdasarkan jenis dan kompleksiti tugas yang bersesuaian dengan kelayakan akademik berasaskan prinsip kadar upah untuk kerja.</li></ol><table><tr><th style="width:50%">Jenis / Kompleksiti Tugas Berdasarkan Kesetaraan Akademik</th><th style="width:25%">Kadar Sektor Awam (RM)</th><th style="width:25%">GLC / GLIC / rakan strategik<br><i>Saranan Kadar Minimum*</i><br>(RM)</th></tr><tr><td><b>Ijazah Sarjana Muda setaraf dan ke atas</b></td><td class="text-center">2,100</td><td class="text-center">2,100</td></tr><tr><td><b>Setaraf Diploma/ Sijil Tinggi Pelajaran Malaysia</b></td><td class="text-center">1,900</td><td class="text-center">1,900</td></tr><tr><td><b>Setaraf Sijil Pelajaran Malaysia (SPM)</b></td><td class="text-center">1,700</td><td class="text-center">1,700</td></tr><tr><td><b>Tiada Sijil Pelajaran Malaysia</b></td><td class="text-center">1,500</td><td class="text-center">1,500</td></tr></table><div class="mt-2"><i>*Nota: Kadar yang disarankan bergantung dan tertakluk kepada setiap program penempatan GLC / GLIC dan Rakan Strategik.</i><br><br> Bayaran upah <b>perlu mengandungi elemen caruman kepada PERKESO dan KWSP.</b></div>',
        },
        {
          question: 'Kemudahan kepada Personel MySTEP',
          answer:
            '<ol class="r"><li>Kemudahan yang diberikan kepada personel MySTEP adalah:</li></ol><table class="table-7"><tr><th>Jenis Kemudahan</th><th>Sektor Awam</th><th>GLC / GLIC / rakan strategik</th></tr><tr><td><b>Cuti Rehat</b></td><td class="text-center">12 hari setahun*</td><td class="text-center">Tertakluk kepada struktur program penempatan masing-masing</td></tr><tr><td><b>Cuti Sakit</b></td><td class="text-center">14 hari setahun*</td><td class="text-center">Tertakluk kepada struktur program penempatan masing-masing</td></tr><tr><td><b>Perlindungan Sosial</b></td><td class="text-center">Caruman KWSP dan PERKESO</td><td class="text-center">Caruman KWSP dan PERKESO jika berkenaan</td></tr></table><div class="mt-2"><i>*Dikira secara purata (pro-rate) berdasarkan tempoh kontrak</i></b></div>',
        },
        {
          question: 'Garis Panduan MySTEP',
          answer: '<ol class="r"><h4>Garis Panduan Perolehan Perkhidmatan Personel MySTEP Di Bawah Inisiatif Malaysia Short-Term Employment Programme Tahun 2023</br></br></h4><div style="text-align: justify;">Garis Panduan ini bertujuan untuk menjelaskan tadbir urus perolehan perkhidmatan Personel MySTEP di bawah inisiatif Malaysia Short-Term Employment Programme (MySTEP) bagi tahun 2023 ("Garis Panduan").</div></br><a href="../assets/Lampiran B_GARIS PANDUAN MYSTEP 2023.pdf" class="button-info white--text pa-3" download="Lampiran B_GARIS PANDUAN MYSTEP 2023.pdf"><button class="button-info">MUAT TURUN</button></a><div class="mt-3" style="font-style: italic">Sila rujuk Lampiran B</div>',
        }
        
      ],
    }
  },
    head () {
     return {
      title: 'Laman Info MySTEP ',
      meta: [
      { hid: 'description', name: 'description', content: 'Laman Info mengandungi pautan kepada Garis Panduan Perolehan Perkhidmatan Personel di bawah inisiatif MySTEP bagi tahun 2022' },
      { hid: 'og:description', name: 'og:description', content: 'Laman Info mengandungi pautan kepada Garis Panduan Perolehan Perkhidmatan Personel di bawah inisiatif MySTEP bagi tahun 2022' },
      { hid: 'og:title', name: 'og:title', content: 'Laman Info MySTEP' }
      ]
    }
  }

}
</script>

<style>
table {
  width: 100%;
  border: solid 1px #000000;
  border-collapse: collapse;
  border-spacing: 0;
  padding: 10px 15px;
}

table tr th {
  border: solid 1px #000000;
  padding: 10px 15px;
}

table tr td {
  border: solid 1px #000000;
  padding: 10px 15px;
}

@media (max-width: 600px) {
  table {
    font-size: 13px;
    /* margin: 0 0 0 -20px; */
  }

  .table-7 {
    margin: 0 0 0 -20px;
  }

  table tr th {
  padding: 10px 10px;
  }
  
  table tr td {
    padding: 10px 10px;
  }
}

li {
  margin-bottom: 1rem;
  text-align: justify;
}

ol.r {
  list-style-type: lower-roman;
}

ol.a {
  list-style-type: lower-alpha;
}

.v-montserrat-500{
  font-family: 'Montserrat', sans-serif;
  font-size: 1rem !important;
    font-weight: normal;
    letter-spacing: 0.009375em !important;
    line-height: 1.75rem;
}

.button-info{
  background-color: rgb(255, 179, 0);
    border-color: rgb(255, 179, 0);
align-items: center;
    border-radius: 4px;
    display: inline-flex;
    flex: 0 0 auto;
    font-weight: 500;
    letter-spacing: 0.0892857143em;
    justify-content: center;
    outline: 0;
    position: relative;
    text-decoration: none;
    text-indent: 0.0892857143em;
    text-transform: uppercase;
    transition-duration: 0.28s;
    transition-property: box-shadow, transform, opacity;
    transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    vertical-align: middle;
    white-space: nowrap;
}
</style>
