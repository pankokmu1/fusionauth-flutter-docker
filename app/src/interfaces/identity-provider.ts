export interface IdentityProviderOauth2 {
  authorization_endpoint: string;
  clientAuthenticationMethod: string;
  client_id: string;
  scope: string;
  token_endpoint: string;
  userinfo_endpoint: string;
}

export interface IdentityProvider {
  applicationIds: string[];
  id: string;
  name: string;
  oauth2: IdentityProviderOauth2;
  type: string;
}
