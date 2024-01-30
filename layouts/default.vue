<template>
  <v-app>
    <v-app-bar color="white" flat class="ma-1 header">
      <a href="https://www.mof.gov.my" target="_blank">
      <v-img
        :src="require('assets/mystep-logo/my.png')"
        alt="Logo"
        max-width="60"
        class="mr-3"
      />
      </a>
      <v-spacer></v-spacer>
      <router-link to="/">
        <v-img
          :src="require('assets/mystep-logo/mystep.png')"
          alt="MySteo Logo"
          max-width="130"
        />
      </router-link>
      <v-app-bar-nav-icon
        class="hidden-md-and-up"
        color="orange"
        @click="drawer = true"
      ></v-app-bar-nav-icon>
      <div class="hidden-sm-and-down mx-auto black--text">
        <span
          v-for="(item, index) in navigations"
          :key="item.name"
          text
          small
          class="black--text ma-1 pa-1"
          ><nuxt-link
            :to="item.link"
            style="color: black; text-decoration: none; word-spacing: 10px"
            >{{ item.name }}
            <span v-if="index + 1 != navigations.length">|</span></nuxt-link
          >
        </span>
        <v-btn
          v-if="employerLoginUrl"
          nuxt
          small
          class="rounded-pill mr-4"
          style="background-color: #eaeaea3; color: rgb(103 93 94 / 1)"
          @click="employerButton"
          >MAJIKAN</v-btn
        >
      </div>
    </v-app-bar>
    <v-app-bar height="15px" flat class="secondary-blue-background header2">
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" class="mr-auto" absolute temporary>
      <v-list nav>
        <div v-for="{ name, link } in navigations" :key="name">
          <v-list-item slot="activator" :to="link">
            <v-list-item-title class="subtitle-2">{{ name }}</v-list-item-title>
          </v-list-item>
        </div>
        <v-list-item >
          <v-list-item-title outline
            ><v-btn
              v-if="employerLoginUrl"
              nuxt
              outlined
              small
              class="rounded-pill mr-4 black--text"
              @click="employerButton"
              >MAJIKAN</v-btn
            ></v-list-item-title
          >
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-main style="background-color: #e5e5e5; min-height: 100vh">
      <Nuxt />
    </v-main>
    <v-footer padless class="subtitle-2 primary-blue-background">
      <v-row no-gutters class="mx-auto my-6">
        <v-col class="col-12 text-center white--text pt-1">
          Hak cipta © {{ new Date().getFullYear() }}
          Kerajaan Malaysia. Hak cipta terpelihara
        </v-col>
      </v-row>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      drawer: false,
      employerLoginUrl: process.env.EMPLOYER_LOGIN_URL,
      navigations: [
        {
          name: 'PENGENALAN',
          link: '/pengenalan',
        },
        {
          name: 'INFO',
          link: '/info',
        },
      ],
    }
  },
  methods: {
    employerButton() {
      window.open(`${process.env.EMPLOYER_LOGIN_URL}`)
    }
  }
}
</script>

<style lang="scss">
.primary-blue {
  color: $primary-blue !important;
}
.secondary-blue {
  color: #0D42AE !important;
}
.primary-blue-background {
  background-color: $primary-blue !important;
}
.secondary-blue-background {
  background-color: #0D42AE !important;
}

@media only screen and (max-width: 414px) {
  .footer {
    position: fixed;
    bottom: 0;
  }
  .foot {
    display: inline-flex;
  }
}
</style>
