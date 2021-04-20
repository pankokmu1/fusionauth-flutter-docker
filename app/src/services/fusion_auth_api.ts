export class FusionAuthApi {
  get baseURL(): string {
    return 'http://localhost:9011/api';
  }

  get apiToken(): string {
    return 'XmDDjxZ2lN_hJ53sYr8FenCqAIhxe4Vb96uAMLrje9YTUkEl-tPowuck';
  }

  get headersDefault(): Headers {
    const headers = new Headers({
      'Authorization': this.apiToken,
    });
    return headers;
  }

  async get(path: string, params: { [key: string]: string } = {}): Promise<any> {
    const headers = this.headersDefault;

    const url = new URL(`${ this.baseURL }/${ path }`);

    url.search = `${ new URLSearchParams(params) }`;

    const response = await fetch(`${ url }`, {
      method: 'GET',
      headers,
    });

    return await response.json();
  }
}
