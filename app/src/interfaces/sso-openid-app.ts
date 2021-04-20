export interface SsoOpenidApp {
  issuer: string;
  client_id: string;
  scopes: string[];
  prompt: string[];
  login_hint?: string;
  parameters: { [key: string]: string };
}
