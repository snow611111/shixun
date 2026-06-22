export default class FormatUtil {

  /**
   * 格式化时间戳为日期时间字符串
   * @param timestamp 时间戳（毫秒）或ISO日期字符串
   * @param format 格式模板，默认 'YYYY-MM-DD HH:mm:ss'
   */
  static formatDate(timestamp: number | string, format: string = 'YYYY-MM-DD HH:mm:ss'): string {
    let date: Date;
    if (typeof timestamp === 'string') {
      date = new Date(timestamp);
    } else {
      date = new Date(timestamp);
    }

    const map: Record<string, string | number> = {
      'YYYY': date.getFullYear(),
      'MM': String(date.getMonth() + 1).padStart(2, '0'),
      'DD': String(date.getDate()).padStart(2, '0'),
      'HH': String(date.getHours()).padStart(2, '0'),
      'mm': String(date.getMinutes()).padStart(2, '0'),
      'ss': String(date.getSeconds()).padStart(2, '0')
    };

    let result = format;
    for (const key in map) {
      result = result.replace(key, String(map[key]));
    }
    return result;
  }

  /**
   * 格式化文件大小
   * @param bytes 字节数
   */
  static formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB'];
    const k = 1024;
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return (bytes / Math.pow(k, i)).toFixed(1) + ' ' + units[i];
  }

  /**
   * 格式化持续时间为可读文字
   * @param ms 毫秒数
   */
  static formatDuration(ms: number): string {
    const seconds = Math.floor(ms / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);

    if (hours > 0) {
      return hours + '时' + (minutes % 60) + '分';
    }
    if (minutes > 0) {
      return minutes + '分' + (seconds % 60) + '秒';
    }
    return seconds + '秒';
  }
}
