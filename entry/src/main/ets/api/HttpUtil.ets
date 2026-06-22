import http from '@ohos.net.http';
import ApiConfig from './ApiConfig';

export default class HttpUtil {

  static async get(url: string): Promise<any> {

    let req = http.createHttp();

    try {

      let res = await req.request(
        ApiConfig.baseUrl + url,
        {
          method: http.RequestMethod.GET,
          connectTimeout: 10000,
          readTimeout: 10000,
          header: {
            'Content-Type': 'application/json'
          }
        }
      );

      return typeof res.result === 'string'
        ? JSON.parse(res.result)
        : res.result;

    } finally {
      req.destroy();
    }
  }

  static async post(url: string, data: Object): Promise<any> {

    let req = http.createHttp();

    try {

      let res = await req.request(
        ApiConfig.baseUrl + url,
        {
          method: http.RequestMethod.POST,
          extraData: JSON.stringify(data),
          header: {
            'Content-Type': 'application/json'
          }
        }
      );

      return typeof res.result === 'string'
        ? JSON.parse(res.result)
        : res.result;

    } finally {
      req.destroy();
    }
  }
}