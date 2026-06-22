export default class Logger {

  static readonly TAG: string = 'AGV_Terminal';

  static info(msg: string, data?: Object): void {
    if (data) {
      console.info('[' + Logger.TAG + '] ' + msg, JSON.stringify(data));
    } else {
      console.info('[' + Logger.TAG + '] ' + msg);
    }
  }

  static warn(msg: string, data?: Object): void {
    if (data) {
      console.warn('[' + Logger.TAG + '] ' + msg, JSON.stringify(data));
    } else {
      console.warn('[' + Logger.TAG + '] ' + msg);
    }
  }

  static error(msg: string, data?: Object): void {
    if (data) {
      console.error('[' + Logger.TAG + '] ' + msg, JSON.stringify(data));
    } else {
      console.error('[' + Logger.TAG + '] ' + msg);
    }
  }

  static debug(msg: string, data?: Object): void {
    if (data) {
      console.debug('[' + Logger.TAG + '] ' + msg, JSON.stringify(data));
    } else {
      console.debug('[' + Logger.TAG + '] ' + msg);
    }
  }
}
