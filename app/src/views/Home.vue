<template>
  <div class="login-page">
    <div class="form">
      <img alt="Vue logo" :src="require('@/assets/logo.png')">
      <h2 v-if="user">Hello, {{ user }}!</h2>
      <form class="login-form" v-else>
        <input type="email" placeholder="domain" v-model="email" readonly />
        <button type="button" @click.stop.prevent="loginSso" :disabled="!email">Login SSO</button>
      </form>
      <div class="message" v-if="error">
        {{ error }}
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { User, UserManager, WebStorageStateStore } from 'oidc-client';

import { FusionAuthApi } from '@/services/fusion_auth_api';

import { SsoOpenidApp } from '@/interfaces/sso-openid-app';
import { FusionAuthUser } from '@/interfaces/fusion-auth-user';
import { IdentityProvider } from '@/interfaces/identity-provider';

@Component
export default class Home extends Vue {
  protected readonly applicationId = '1b62d181-b4f9-4b44-87ad-38a2e29066b6';
  protected email = 'bobsmith@email.com';
  protected error = '';
  protected user = '';

  async searchIdentityProviderByDomain(domain: string): Promise<IdentityProvider> {
    console.time('searchIdentityProviderByDomain');

    try {
      const fusionAuthService = new FusionAuthApi();
      const idpData = await fusionAuthService.get('identity-provider/lookup', { domain });
      return idpData.identityProvider as IdentityProvider;
    } finally {
      console.timeEnd('searchIdentityProviderByDomain');
    }
  }

  async searchUserByEmail(email: string): Promise<FusionAuthUser> {
    console.time('searchUserByEmail');

    try {
      const fusionAuthService = new FusionAuthApi();
      const userData = await fusionAuthService.get('user', { email });
      return userData.user as FusionAuthUser;
    } finally {
      console.timeEnd('searchUserByEmail');
    }
  }

  openLoginPopUp(sso: SsoOpenidApp): Promise<User> {
    const extraQueryParams = {
      ...sso.parameters,
    };

    if (sso.login_hint) {
      extraQueryParams.login_hint = sso.login_hint;
    }

    const userManager = new UserManager({
      userStore: new WebStorageStateStore({
        store: window.localStorage,
      }),
      authority: sso.issuer,
      client_id: sso.client_id,
      popup_redirect_uri: `${ location.origin }/oauth2/callback`,
      popup_post_logout_redirect_uri: `${ location.origin }/logout`,
      response_type: 'code',
      scope: sso.scopes.join(' '),
      prompt: sso.prompt.join(' '),
      extraQueryParams: extraQueryParams,
    });

    return userManager.signinPopup();
  }

  async loginSso(): Promise<void> {
    console.time('loginSso');
    this.error = '';

    try {
      const [ , domain ] = this.email.split('@');

      const idp = await this.searchIdentityProviderByDomain(domain);
      console.log(idp);
      const fusionAuthUser = await this.searchUserByEmail(this.email).catch(() => null);
      console.log(fusionAuthUser);

      const registration = fusionAuthUser?.registrations?.find(registration => {
        return registration.applicationId === this.applicationId;
      });

      const ssoOpenIdData: SsoOpenidApp = {
        issuer: 'http://localhost:9011',
        client_id: this.applicationId,
        parameters: {
          idp_hint: idp.id,
        },
        login_hint: registration?.username,
        scopes: [
          'openid',
          'offline_access',
          'email',
        ],
        prompt: [
          'login',
        ],
      };

      const userData = await this.openLoginPopUp(ssoOpenIdData);
      console.log(userData);
      this.user = `${ userData.profile.first_name } ${ userData.profile.family_name }`;
    } catch (error) {
      console.error(error);
      this.error = `${ error }`;
    } finally {
      console.timeEnd('loginSso');
    }
  }
}
</script>

<style scoped>
.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}

.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  border-radius: 6px;
}

.form input {
  font-family: 'Roboto', sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
  border-radius: 6px;
}

.form button {
  font-family: 'Roboto', sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #41b883;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
  border-radius: 6px;
}

.form button:hover, .form button:active, .form button:focus {
  background: #35495e;
}

.form .message {
  margin: 15px 0 0;
  color: #AD3034;
  font-size: 14px;
}
</style>
