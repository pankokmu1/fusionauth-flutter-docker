export interface FusionAuthRegistrationData {
  [key: string]: string;
}

export interface FusionAuthRegistrationTokens {
  [key: string]: string;
}

export interface FusionAuthRegistration {
  id: string;
  applicationId: string;
  insertInstant: number;
  lastLoginInstant: number;
  lastUpdateInstant: number;
  data?: FusionAuthRegistrationData;
  tokens?: FusionAuthRegistrationTokens;
  username: string;
  usernameStatus: string;
  verified: boolean;
}

export interface FusionAuthUser {
  active: boolean;
  connectorId: string;
  email: string;
  encryptionScheme: string;
  firstName: string;
  fullName: string;
  id: string;
  insertInstant: number;
  lastLoginInstant: number;
  lastName: string;
  lastUpdateInstant: number;
  password: string;
  passwordChangeRequired: boolean;
  passwordLastUpdateInstant: number;
  registrations?: FusionAuthRegistration[];
  tenantId: string;
  twoFactorDelivery: string;
  twoFactorEnabled: boolean;
  usernameStatus: string;
  username: string;
  verified: boolean;
}
