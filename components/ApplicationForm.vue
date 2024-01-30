<template>
  <validation-observer ref="observer">
    <div v-if="show || show_oku" class="outside" @click="infoClick"></div>
    <v-row justify="center" class="text-left mt-6 mx-4 mb-6" no-gutters>
      <v-col class="col-12 col-md-10 col-lg-8">
        <v-row justify-md="start" justify="center" class="text-left">
          <v-col class="col-12 col-md-2 my-auto py-0">
            <p class="subtitle-2">Pilihan Kementerian</p>
          </v-col>
          <!-- rules="required" -->
          <v-col class="col-12 col-md-10">
            <v-row>
              <v-col class="col-12 col-md-4 py-0 pl-2">
                <validation-provider
                  v-slot="{ errors }"
                  name="Pilihan Kementerian 1"
                  :rules="form.prefer_org_4 === null ? 'required' : ''"
                >
                  <v-select
                    v-model="prefer_org_1_obj"
                    :items="gov"
                    flat
                    solo
                    dense
                    clearable
                    item-text="name"
                    label="Pilihan 1"
                    :error-messages="errors"
                    return-object
                    @change="pushArraygov(form.prefer_org_1)"
                  ></v-select>
                </validation-provider>
              </v-col>
              <v-col class="col-12 col-md-4 py-0">
                <validation-provider
                  v-slot="{ errors }"
                  name="Pilihan Kementerian 2"
                >
                  <v-select
                    v-model="prefer_org_2_obj"
                    :items="govDropdown"
                    flat
                    solo
                    item-text="name"
                    dense
                    clearable
                    label="Pilihan 2"
                    return-object
                    :error-messages="errors"
                    @change="pushArraygov(form.prefer_org_2)"
                  ></v-select>
                </validation-provider>
              </v-col>
              <v-col class="col-12 col-md-4 py-0">
                <validation-provider
                  v-slot="{ errors }"
                  name="Pilihan Kementerian 3"
                >
                  <v-select
                    v-model="prefer_org_3_obj"
                    :items="govDropdown2"
                    item-text="name"
                    flat
                    solo
                    dense
                    clearable
                    label="Pilihan 3"
                    :error-messages="errors"
                    return-object
                    @change="pushArraygov(form.prefer_org_3)"
                  ></v-select>
                </validation-provider>
              </v-col>
            </v-row>
          </v-col>

          <!-- <v-col class="col-12 col-md-1 pt-0">
            <v-tooltip v-model="show" left>
              <template #activator="{ attrs }">
                <v-btn
                  icon
                  color="#1e1e1e"
                  v-bind="attrs"
                  @click="show = !show"
                >
                  <v-icon large>mdi-information</v-icon>
                </v-btn>
              </template>
              <div v-for="(items, index) in gov" :key="items.abbreviation">
                <span
                  >{{ items.abbreviation }}: {{ gov[index].name }}<br
                /></span>
              </div>
            </v-tooltip>
          </v-col> -->
        </v-row>
        

        <v-row justify-md="start" justify="center" class="text-left">
            <v-col class="col-12 col-md-2 my-auto pt-0 pb-0 pb-md-4">
              <p class="subtitle-2">Pilihan GLC</p> 
            </v-col>
          <v-col class="col-12 col-md-10">
            <v-row>
              <v-col class="col-12 col-md-4 py-0 pl-md-2">
              <validation-provider
                v-slot="{ errors }"
                name="Pilihan GLC 1"
                :rules="form.prefer_org_1 === null ? 'required' : ''"
              >
                <v-select
                  v-model="prefer_org_4_obj"
                  :items="glc"
                  item-text="name"
                  flat
                  solo
                  dense
                  clearable
                  label="Pilihan 1"
                  :error-messages="errors"
                  return-object
                  @change="pushArrayglc(form.prefer_org_4)"
                ></v-select>
              </validation-provider>
            </v-col>
            <v-col class="col-12 col-md-4 py-0">
              <validation-provider v-slot="{ errors }" name="Pilihan GLC 2">
                <v-select
                  v-model="prefer_org_5_obj"
                  :items="glcDropdown"
                  item-text="name"
                  flat
                  solo
                  dense
                  clearable
                  label="Pilihan 2"
                  :error-messages="errors"
                  return-object
                  @change="pushArrayglc(form.prefer_org_5)"
                ></v-select>
              </validation-provider>
            </v-col>

            <v-col class="col-12 col-md-4 pt-0">
              <validation-provider v-slot="{ errors }" name="Pilihan GLC 3">
                <v-select
                  v-model="prefer_org_6_obj"
                  :items="glcDropdown2"
                  item-text="name"
                  flat
                  solo
                  dense
                  clearable
                  label="Pilihan 3"
                  :error-messages="errors"
                  return-object
                ></v-select>
              </validation-provider>
            </v-col>
            </v-row> 
            
          </v-col>
          
        </v-row>

        <v-row justify-md="start" justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Pilihan Lokasi Penempatan</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <validation-provider
              v-slot="{ errors }"
              name="Pilihan Penempatan"
              rules="required"
            >
              <v-select
                v-model="form.prefered_placement"
                :items="state"
                item-text="name"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
              ></v-select>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Nama</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Nama"
              rules="required"
            >
              <v-text-field
                v-model="form.name"
                flat
                required
                solo
                dense
                :error-messages="errors"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">No. Kad Pengenalan</p>
          </v-col>
          <v-col class="col-12 col-md-5">
            <validation-provider
              v-slot="{ errors }"
              name="No. Kad Pengenalan"
              :rules="{
                      required: true, max:14,min:14, regex:/^(([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01]))-([0-9]{2})-([0-9]{4})$/ 
                    }"
            >
              <v-text-field
                v-model="icNumber"
                required
                solo
                flat
                dense
                :error-messages="errors"
                @input="getAge"
              ></v-text-field>
            </validation-provider>
          </v-col>

          <v-col class="col-12 col-md-2 my-auto pl-md-6">
            <p class="subtitle-2 text-md-right pr-md-6">Umur</p>
          </v-col>
          <v-col class="col-12 col-md-3">
            <validation-provider
              v-slot="{ errors }"
              name="Umur"
              rules="required"
            >
              <v-text-field
                v-model="form.age"
                required
                solo
                dense
                flat
                :error-messages="errors"
                readonly
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2 mb-1">Jantina</p>
          </v-col>
          <v-col class="col-12 col-md-4 my-auto">
            <validation-provider
              v-slot="{ errors }"
              name="Jantina"
              rules="required"
            >
              <v-radio-group
                v-model="form.gender_bm"
                class="mt-0 pt-2"
                row
                dense
                :error-messages="errors"
              >
                <v-radio label="Lelaki" value="Lelaki"></v-radio>
                <v-radio label="Perempuan" value="Perempuan"></v-radio>
              </v-radio-group>
            </validation-provider>
          </v-col>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2 text-md-right pr-md-6">No. Telefon</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <VuePhoneNumberInput v-model="mobileNo" :error="mobileNoError !== null ? true : false" :no-example="true" :translations="{countrySelectorLabel: 'Negara',countrySelectorError: 'Negara Salah', phoneNumberLabel: 'No Telefon', example: 'Contoh :'}" default-country-code="MY" required @update="mobileNoValidation" />
            <span class="red--text pl-3" style="font-size: 12px" > {{ mobileNoError }} </span>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">E-mel</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="E-mel"
              rules="required|email"
            >
              <v-text-field
                v-model="form.email"
                required
                flat
                solo
                dense
                :error-messages="errors"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Bangsa</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <validation-provider
              v-slot="{ errors }"
              name="Bangsa"
              rules="required"
            >
              <v-select
                v-model="race_bm_obj"
                :items="race_list"
                item-text="bm"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
                return-object
                @change="raceChangeObj"
              ></v-select>
            </validation-provider>
          </v-col>
          <!-- v-if="form.race_bm === 'Lain-lain'" replace  v-if="race_bm_obj" -->
          <!-- <v-col class="col-12 col-md-2 my-auto pl-md-6">
            <p  v-if="form.race_bm === 'Lain-lain'" class="subtitle-2">Lain-lain</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <validation-provider
              v-slot="{ errors }"
              name="Etnik"
              rules=""
            >
              <v-select
                v-if="form.race_bm === 'Lain-lain' "
                v-model="form.ethnic_bm"
                :items="race_bm_obj.ethnics"
                item-text="bm"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
              ></v-select>
            </validation-provider>
          </v-col> -->
          <v-col class="col-12 col-md-2 my-auto pl-md-6">
            <p  v-if="form.race_bm === 'Lain-lain'" class="subtitle-2 text-md-right pr-md-6">Nyatakan</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <validation-provider
              v-slot="{ errors }"
              name="Etnik"
              rules=""
            >
              <v-text-field
                v-if="form.race_bm === 'Lain-lain' "
                v-model="form.ethnic_bm"
                flat
                solo
                dense
                :error-messages="errors"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2 mb-1">Ketidakupayaan</p>
          </v-col>

          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Field"
              rules="required"
            >
              <v-radio-group
                v-model="oku"
                class="mt-0 pt-2"
                row
                mandatory
                dense
                :error-messages="errors"
              >
                <v-radio label="Tidak" value="Tidak Berkenaan"></v-radio>
                <v-radio label="Ya" value="Y"></v-radio>
                <v-tooltip v-model="show_oku" right>
                  <template #activator="{ attrs }">
                    <v-btn
                      icon
                      color="#1e1e1e"
                      v-bind="attrs"
                      @click="show_oku = !show_oku"
                    >
                      <span><v-icon large>mdi-information</v-icon></span>
                    </v-btn>
                  </template>
                  <span>Kerajaan menyediakan kuota khas sebanyak satu (1) peratus kepada golongan OKU</span>
                </v-tooltip>
              </v-radio-group>
            </validation-provider>
          </v-col>
          <!-- v-if="oku === 'Y'" -->
          <v-col v-if="oku === 'Y'" cols="10" offset="md-2">
            <validation-provider
              v-slot="{ errors }"
              name="Ketidakupayaan"
              rules="required"
            >
              <v-select
                v-model="form.disability_bm"
                :items="oku_status"
                label="Sila Pilih"
                item-text="bm"
                flat
                solo
                dense
                :error-messages="errors"
              ></v-select>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Alamat 1</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Alamat 1"
              rules="required"
            >
              <v-text-field
                v-model="form.add_1"
                flat
                solo
                dense
                :error-messages="errors"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Alamat 2</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <v-text-field v-model="form.add_2" flat solo dense></v-text-field>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left mt-0">
          <v-col class="col-12 col-md-2 my-auto pt-0 pb-0 pb-md-4">
            <p class="subtitle-2">Bandar</p>
          </v-col>
          <v-col class="col-12 col-md-4 pt-0 pl-2">
            <validation-provider
              v-slot="{ errors }"
              name="Bandar"
              rules="required"
            >
              <v-text-field
                v-model="form.city"
                required
                flat
                solo
                dense
                :error-messages="errors"
              ></v-text-field>
            </validation-provider>
          </v-col>
          <v-col class="col-12 col-md-2 my-auto pt-0 pb-0 pb-md-4">
            <p class="subtitle-2 text-md-right">Poskod</p>
          </v-col>
          <v-col class="col-12 col-md-4 py-0">
            <validation-provider
              v-slot="{ errors }"
              name="Poskod"
              rules="required|numeric|digits:5"
            >
              <v-text-field
                v-model="form.postcode"
                required
                flat
                solo
                dense
                :error-messages="errors"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify-md="start" justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Negeri</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <validation-provider
              v-slot="{ errors }"
              name="Negeri"
              rules="required"
            >
              <v-select
                v-model="form.state"
                :items="state"
                item-text="name"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
              ></v-select>
            </validation-provider>
          </v-col>
        </v-row>

        

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Pendapatan Isi Rumah (Bulanan)</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Pendapatan Isi Rumah"
              :rules="{required:true, regex:/^(?=.)(\d{1,3}(,\d{3})*)?(\.\d+)?$/ }"
            >
              <v-text-field
                v-model="household_income_locale"
                required
                flat
                solo
                dense
                :error-messages="errors"
                @input="toLocale"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Status Pekerjaan Semasa</p>
          </v-col>

          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Status Pekerjaan Semasa"
              rules="required"
            >
              <v-select
                v-model="form.current_working_status_bm"
                :items="work_stat"
                item-text="bm"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
              >
              </v-select>
              <!-- <v-radio-group
              class="mt-0 pt-2"
                v-model="work_stat"
                row
                mandatory
                dense
                :error-messages="errors"
              >
                <v-radio label="Sepenuh Masa" value="Sepenuh Masa"></v-radio>
                <v-radio label="Separuh" value="Separuh"></v-radio>
                <v-radio label="Tidak Bekerja" value="Tidak Bekerja"></v-radio>
              </v-radio-group> -->
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify-md="start" justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Pendidikan Tertinggi</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Pendidikan Tertinggi"
              rules="required"
            >
              <v-select
                v-model="form.education_lvl_bm"
                :items="edu_level"
                item-text="bm"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
                @change="removeField"
              ></v-select>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row
          v-if="education"
          class="text-left"
          justify-md="start"
          justify="center"
          no-gutters
        >
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Bidang</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <v-select
              v-model="study_field_bm_obj"
              :items="edu_field"
              item-text="bm"
              flat
              solo
              dense
              label="Sila Pilih"
              return-object
              @change="fieldChangeObj"
            ></v-select>
          </v-col>
        </v-row>

        <v-row
          v-if="form.study_field_bm"
          class="text-left"
          justify-md="start"
          justify="center"
          no-gutters
        >
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Kursus</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <v-select
              v-model="course_selection"
              :items="study_field_bm_obj.courses"
              item-text="bm"
              flat
              solo
              dense
              label="Sila Pilih"
              @change="courseNameChange"
            ></v-select>
          </v-col>
        </v-row>

        <v-row
          v-if="course_selection === 'Lain-lain'"
          justify-md="start"
          justify="center"
          class="text-left"
          no-gutters
        >
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Nama Kursus</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Kursus"
              rules="required"
            >
              <v-text-field
                v-model="course_name"
                required
                flat
                solo
                dense
                :error-messages="errors"
                @input="courseNameChange"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row
          v-if="education"
          justify-md="start"
          justify="center"
          class="text-left"
          no-gutters
        >
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Universiti</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider v-slot="{ errors }" name="Universiti">
              <!-- can take into consideration to use v-autocomplete -->
              <v-select
                v-model="university_selection"
                :items="university"
                item-text="name"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
                @change="uniNameChange"
              ></v-select>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row
          v-if="university_selection === 'Lain-lain'"
          justify-md="start"
          justify="center"
          class="text-left"
          no-gutters
        >
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Nama Universiti</p>
          </v-col>
          <v-col class="col-12 col-md-10">
            <validation-provider
              v-slot="{ errors }"
              name="Universiti"
              rules="required"
            >
              <v-text-field
                v-model="uni_name"
                required
                flat
                solo
                dense
                :error-messages="errors"
                @input="uniNameChange"
              ></v-text-field>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify-md="start" justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Pengalaman Bekerja (Tahun)</p>
          </v-col>
          <v-col class="col-12 col-md-4">
            <validation-provider
              v-slot="{ errors }"
              name="Pengalaman Kerja"
              rules="required"
            >
              <v-select
                v-model="form.experienced_lvl_bm"
                :items="work_exp"
                item-text="bm"
                flat
                solo
                dense
                label="Sila Pilih"
                :error-messages="errors"
              ></v-select>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify-md="start" justify="center" class="text-left" no-gutters>
          <v-col class="col-12 col-md-2 my-auto">
            <p class="subtitle-2">Muat Naik (PDF)</p>
          </v-col>
          <v-col class="col-12 col-md-5">
            <validation-provider
              v-slot="{ errors }"
              name="CV"
              rules="required|size:5000"
            >
              <v-file-input
                v-model="file"
                accept=".pdf"
                label="muat naik CV"
                solo
                dense
                flat
                persistent-hint
                hint="saiz maksima 5MB"
                :error-messages="errors"
              ></v-file-input>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify-md="start" justify="center" class="text-left disclaimer-top" no-gutters>
          <v-col class="col-12 col-md-12">
            <validation-provider
              v-slot="{ errors }"
              rules="required"
              name="Persetujuan"
            >
              <v-checkbox v-model="disclaimer" :error-messages="errors" @change=" !disclaimer ? disclaimer= null : disclaimer = true">
                <template #label>
                  <div>
                    Saya telah membaca dan bersetuju dengan
                    <a
                      target="_blank"
                      href="assets/MySTEP-Terma_dan_Syarat.pdf"
                      @click.stop
                    >
                     Terma dan Syarat
                    </a>
                    dan 
                    <a
                      target="_blank"
                      href="assets/MySTEP-Notis_Privasi.pdf"
                      @click.stop
                    >
                     Notis Privasi
                    </a>
                  </div>
                </template>
              </v-checkbox>
            </validation-provider>
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-btn class="white--text mx-0 my-3" color="red" @click="submit()">
            Hantar
          </v-btn>
        </v-row>
      </v-col>
    </v-row>
    <Loading v-model="loading" />
    <ApplicationFormSuccessDialog v-model="successDialog" />
  </validation-observer>
</template>

<script>
import VuePhoneNumberInput from 'vue-phone-number-input';
import 'vue-phone-number-input/dist/vue-phone-number-input.css';
import { extend, ValidationObserver, ValidationProvider } from 'vee-validate'
import {
  required,
  email,
  numeric,
  digits,
  size,
  max,
  min,
  regex,
} from 'vee-validate/dist/rules'

extend('regex', { ...regex, message: '{_field_} tidak sah' })
extend('email', { ...email, message: '{_field_} tidak sah' })
extend('max', { ...max, message: '{_field_} tidak sah' })
extend('min', { ...min, message: '{_field_} tidak sah' })
extend('numeric', { ...numeric, message: '{_field_} tidak sah' })
extend('required', { ...required, message: '{_field_} perlu dilengkapkan' })
extend('digits', { ...digits, message: '{_field_} tidak sah ' })
extend('size', { ...size, message: 'fail tidak boleh melebihi 5MB' })

export default {
  components: {
    ValidationObserver,
    ValidationProvider,
    VuePhoneNumberInput,
  },
  data: () => ({
    successDialog: false,
    icNumber: null,
    show: false,
    show_oku: false,
    race_bm_obj: null,
    study_field_bm_obj: null,
    prefer_org_1_obj: null,
    prefer_org_2_obj: null,
    prefer_org_3_obj: null,
    prefer_org_4_obj: null,
    prefer_org_5_obj: null,
    prefer_org_6_obj: null,
    household_income_locale: null,
    form: {
      name: null,
      ic: '',
      email: null,
      phone_num: null,
      add_1: null,
      add_2: null,
      postcode: null,
      city: null,
      state: null,
      prefered_placement: null,
      household_income: null,
      experienced_lvl_bm: null,
      gender_bm: null,
      race_bm: null,
      ethnic_bm: null,
      disability_bm: 'Tidak Berkenaan',
      education_lvl_bm: null,
      study_field_bm: null,
      course_bm: null,
      university: null,
      cv: null,
      prefer_org_1: null,
      prefer_org_2: null,
      prefer_org_3: null,
      prefer_org_4: null,
      prefer_org_5: null,
      prefer_org_6: null,
      current_working_status_bm: null,
      age: null,
    },
    course_selection: null,
    course_name: null,
    university_selection: null,
    uni_name: null,
    disclaimer: null,
    // age: null,
    work_stat: [],
    file: null,
    oku: '',
    menu: '',
    gender_bm: ['Lelaki', 'Perempuan'],
    university: [],
    isValid: '',
    selected_gov: [],
    selected_glc: [],
    race_list: [],
    oku_status: [],
    state: [],
    edu: null,
    edu_level: [],
    edu_field: [],
    work_exp: [],
    gov: [],
    glc: [],
    excludeRace: null,
    mobileNo: null,
    mobileNoError: null,
    genderError: null,
    loading: false,
  }),
  computed: {
    raceDropdown() {
      return this.race_bm.filter((value) => {
        return value.indexOf(this.excludeRace)
      })
    },
    govDropdown() {
      return this.gov.filter((value) => {
        return value !== this.prefer_org_1_obj
      })
    },
    govDropdown2() {
      return this.gov.filter((value) => {
        return !this.selected_gov.includes(value)
      })
    },

    glcDropdown() {
      return this.glc.filter((value) => {
        return value !== this.prefer_org_4_obj
      })
    },
    glcDropdown2() {
      return this.glc.filter((value) => {
        return !this.selected_glc.includes(value)
      })
    },

    education() {
      return (
        this.form.education_lvl_bm === 'Ijazah Sarjana Muda' ||
        this.form.education_lvl_bm === 'Ijazah Sarjana' ||
        this.form.education_lvl_bm === 'Doktor Falsafah' ||
        this.form.education_lvl_bm === 'Sijil Profesional'
      )
    },
    uniName() {
      return this.university_selection === 'Lain-lain'
    },
  },
  watch: {
    'form.phone_num'(value) {
      this.mobileNoError = null
      if(value === null) {
        this.mobileNoError = "No. Telefon tidak sah"
      }
    },
    icNumber() {
      this.form.ic = this.icNumber
      if (this.icNumber.length === 6) {
        this.icNumber = this.icNumber.replace(/-/gi, '')
        this.icNumber = this.icNumber + '-'
      }
      if (this.icNumber.length === 9) {
        this.icNumber = this.icNumber + '-'
      }
      if (this.icNumber.length === 14) {
        this.icNumber = this.icNumber.replace(/-/gi, '')
        const firstnum = this.icNumber.slice(0, 6)
        const secnum = this.icNumber.slice(6, 8)
        const thirdnum = this.icNumber.slice(8, 12)
        this.icNumber = firstnum + '-' + secnum + '-' + thirdnum
        this.form.ic = this.icNumber
      }
    },
  },

  mounted() {
    this.dropdownApi()
    // alert('test')
  },
  methods: {
    mobileNoValidation(payload){
      this.form.phone_num = null
      if(payload.isValid){
        this.form.phone_num = payload.countryCallingCode + payload.nationalNumber
      }
    },
    okuStat(){
      if(this.oku === 'Y'){
        // console.log(this.oku)
        return true
      }
    },
    toLocale(){
      const noCommaNum = this.household_income_locale.replace(/,/g, '')
      this.household_income_locale = new Intl.NumberFormat("en-GB").format(noCommaNum)
      this.form.household_income = this.household_income_locale.replace(/,/g, '')
    },
    infoClick(){
      if(this.show){
         this.show = !this.show
      }
      if(this.show_oku){
        this.show_oku = !this.show_oku
      }
    },
    removeField(){
      if(this.form.study_field_bm){
        this.study_field_bm_obj = null
        this.form.study_field_bm = null
        this.form.course_bm = null
        this.form.university = null
      }
    },
     courseNameChange() {
      if (this.course_selection === 'Lain-lain') {
        let courseUpper = null
        if (this.course_name !== null){
          courseUpper = this.course_name.toUpperCase()
        }
        this.form.course_bm = this.course_selection + ' - ' + courseUpper
      } else {
        this.form.course_bm = this.course_selection
      }
    },
    uniNameChange() {
      if (this.university_selection === 'Lain-lain') {
        this.form.university = this.uni_name
      } else {
        this.form.university = this.university_selection
      }
    },
    raceChangeObj() {
      if (this.race_bm_obj) {
        this.form.race_bm = this.race_bm_obj.bm
      }
    },
    fieldChangeObj() {
      if (this.study_field_bm_obj) {
        this.form.study_field_bm = this.study_field_bm_obj.bm
      }
    },
    async dropdownApi() {
      const response = await this.$axios.get('/v1/dropdown/all')
      const resdisable = await this.$axios.get('/v1/dropdown/disabilities')
      const restate = await this.$axios.get('/v1/dropdown/states')
      // console.log(response.data.data.races)
      this.race_list = response.data.data.races
      this.oku_status = resdisable.data.data
      this.edu_level = response.data.data.education
      this.state = restate.data.data
      this.edu_field = response.data.data.fields
      this.work_exp = response.data.data.experience
      this.gov = response.data.data.ministries
      this.glc = response.data.data.glcs
      this.university = response.data.data.universities
      this.work_stat = response.data.data.currentWorkingStatus
    },
    pushArraygov() {
      this.selected_gov = []
      if (this.prefer_org_1_obj) {
        this.selected_gov.push(this.prefer_org_1_obj)
        this.form.prefer_org_1 = this.prefer_org_1_obj.name
      }
      if (this.prefer_org_2_obj) {
        this.selected_gov.push(this.prefer_org_2_obj)
        this.form.prefer_org_2 = this.prefer_org_2_obj.name
      }
      if (this.prefer_org_3_obj) {
        this.form.prefer_org_3 = this.prefer_org_3_obj.name
      }
    },
    pushArrayglc() {
      this.selected_glc = []
      if (this.prefer_org_4_obj) {
        this.selected_glc.push(this.prefer_org_4_obj)
        this.form.prefer_org_4 = this.prefer_org_4_obj.name
      }
      if (this.prefer_org_5_obj) {
        this.selected_glc.push(this.prefer_org_5_obj)
        this.form.prefer_org_5 = this.prefer_org_5_obj.name
      }
      if (this.prefer_org_6_obj) {
        // this.selected_glc.push(this.prefer_org_6_obj)
        this.form.prefer_org_6 = this.prefer_org_6_obj.name
      }
    },
    async submit() {
      this.loading = true
      const isValid = await this.$refs.observer.validate()
      // special validation for telephone
      this.mobileNoError = null
      if(this.form.phone_num === null) {
        this.mobileNoError = "No. Telefon perlu dilengkapkan"
        const el = document.querySelector(".red--text");
        if(el){
           el.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});;
         }
         this.loading = false
        return
      }
      if(this.form.gender_bm === null) {
        this.genderError = "Jantina perlu dilengkapkan"
        const el = document.querySelector(".error--text");
        if(el){
           el.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});;
         }
         this.loading = false
        return
      }
      if (isValid) {
        if (this.file) {
          const uploadStatus = await this.uploadCV()
          // if upload success
          if (uploadStatus !== false) {
            this.form.cv = uploadStatus
            if(this.form.race_bm !== 'Lain-lain'){
              this.form.ethnic_bm = null
            }
            try {
              const { data } = await this.$axios.post(
              '/v1/candidate/submit-application',
              this.form
              )
              // if form submit success
              if (data.status) {
                this.successDialog = true
                this.clear()
              } else {
                // form fail to submit
                alert(data.error.message)
              }
            } catch (error) {
              // if axios fail
              alert(error)
            }
          }
        }
      }
      else{
         const el = document.querySelector(".v-messages.error--text:first-of-type");
         if(el){
           el.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});;
         }
      }
      this.loading = false
    },
    async uploadCV() {
      const payload = new FormData()
      payload.append('file', this.file, this.file.name)

      try {
        const { data } = await this.$axios
        .post('/v1/candidate/upload-cv', payload)

        if (data.status) {
          return data.data.path
        } else {
          // if server error
          alert(data.error.message)
          return false
        }
      } catch (error) {
        // if axios error
        alert(error)
        return false
      }
    },
    getAge() {
      this.form.age = null
      if (this.icNumber && this.icNumber.length >= 2) {
        let dob = this.icNumber.substring(0, 2)
        const now = new Date().getFullYear().toString()
        if (dob <= now.substring(2, 4)) {
          dob = 20 + dob
        } else {
          dob = 19 + dob
        }
        const newAge = now - dob
        this.form.age = newAge.toString()
      }
    },
    clear() {
      this.form.name = null
      this.form.ic = ''
      this.form.email = null
      this.form.phone_num = null
      this.form.add_1 = null
      this.form.add_2 = null
      this.form.postcode = null
      this.form.city = null
      this.form.state = null
      this.form.prefered_placement = null
      this.form.household_income = null
      this.form.experienced_lvl_bm = null
      this.form.gender_bm = null
      this.form.race_bm = null
      this.form.ethnic_bm = null
      this.form.disability_bm = null
      this.form.education_lvl_bm = null
      this.form.study_field_bm = null
      this.form.course_bm = null
      this.form.university = null
      this.form.cv = null
      this.form.prefer_org_1 = null
      this.form.prefer_org_2 = null
      this.form.prefer_org_3 = null
      this.form.prefer_org_4 = null
      this.form.prefer_org_5 = null
      this.form.prefer_org_6 = null
      this.$refs.observer.reset()
    },
  },
}
</script>

<style>
.bg-transparent-info {
  background-color: transparent;
  padding: 0px;
  box-shadow: transparent;
}

.outside {
  width: 100vw;
  height: 100vh;
  position: fixed;
  top: 0px;
  left: 0px;
} 
.v-list-item__title{
  white-space: normal;
}
.v-messages__message {
    line-height: 12px;
    word-break: break-word;
    word-wrap: break-word;
    word-wrap: break-word;
    -webkit-hyphens: auto;
    -ms-hyphens: auto;
    hyphens: auto;
    padding-top: 3px !important;
    padding-bottom: 1px !important;
}
</style>
