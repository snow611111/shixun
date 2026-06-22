export default class ErrorHandler {

  static check(res: any): boolean {

    if (!res) {
      console.log('网络错误');
      return false;
    }

    if (res.code && res.code !== 200) {
      console.log('业务错误：' + res.msg);
      return false;
    }

    return true;
  }
}