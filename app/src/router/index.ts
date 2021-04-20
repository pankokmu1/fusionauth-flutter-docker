import Vue from 'vue';
import VueRouter, { RouteConfig } from 'vue-router';
import { UserManager, WebStorageStateStore } from 'oidc-client';

import Home from '@/views/Home.vue';

Vue.use(VueRouter);

const routes: Array<RouteConfig> = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/oauth2/callback',
    beforeEnter: () => {
      const userManager = new UserManager({
        userStore: new WebStorageStateStore({ store: window.localStorage }),
        response_type: 'code',
      });
      userManager.signinPopupCallback();
    },
  },
  {
    path: '/logout',
    async beforeEnter(to, from, next) {
      try {
        const userManager = new UserManager({
          userStore: new WebStorageStateStore({ store: window.localStorage }),
          response_type: 'code',
        });

        await userManager.removeUser();
      } finally {
        next({
          name: 'Home',
        });
      }
    },
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
