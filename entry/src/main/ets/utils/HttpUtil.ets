import http from '@ohos.net.http';
import ApiConfig from './ApiConfig';

export default class HttpUtil {

  static async get(url: string): Promise<any> {

    let request = http.createHttp();

    try {

      let res = await request.request(
        ApiConfig.baseUrl + url,
        {
          method: http.RequestMethod.GET,
          connectTimeout: 10000,
          readTimeout: 10000,
          header: {
            'Content-Type': 'application/json',
            'Authorization': 'Basic YWRtaW4xMjM6QWRtaW5AMTIz'
          }
        }
      );

      return this.parse(res.result);

    } catch (e) {
      console.error('HTTP GET ERROR', e);
      return null;
    } finally {
      request.destroy();
    }
  }

  static async post(url: string, data: Object): Promise<any> {

    let request = http.createHttp();

    try {

      let res = await request.request(
        ApiConfig.baseUrl + url,
        {
          method: http.RequestMethod.POST,
          connectTimeout: 10000,
          readTimeout: 10000,
          header: {
            'Content-Type': 'application/json',
            'Authorization': 'Basic YWRtaW4xMjM6QWRtaW5AMTIz'
          },
          extraData: JSON.stringify(data)
        }
      );

      return this.parse(res.result);

    } catch (e) {
      console.error('HTTP POST ERROR', e);
      return null;
    } finally {
      request.destroy();
    }
  }

  static parse(data: any): any {
    if (!data) return null;
    if (typeof data === 'string') {
      return JSON.parse(data);
    }
    return data;
  }
}