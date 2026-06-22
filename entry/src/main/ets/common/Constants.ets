/**
 * 应用全局常量
 */
export default class Constants {

  /** 应用名称 */
  static readonly APP_NAME: string = 'AGV巡检系统';

  /** 默认后端地址 */
  static readonly DEFAULT_BASE_URL: string = 'http://192.168.2.57/prod-api';

  /** 默认认证令牌 */
  static readonly DEFAULT_AUTH_TOKEN: string = 'Basic YWRtaW4xMjM6QWRtaW5AMTIz';

  /** HTTP请求超时时间（毫秒） */
  static readonly HTTP_TIMEOUT: number = 10000;

  /** 系统自检轮询间隔（毫秒） */
  static readonly CHECK_INTERVAL: number = 5000;

  /** 存储键名 */
  static readonly STORAGE_KEYS = {
    BASE_URL: 'agv_base_url',
    AUTH_TOKEN: 'agv_auth_token',
    AUTO_CHECK: 'agv_auto_check'
  };

  /** 路由路径 */
  static readonly ROUTES = {
    INIT: 'pages/InitPage',
    TASK_LIST: 'pages/TaskListPage',
    TASK_DETAIL: 'pages/TaskDetailPage',
    TASK_EXECUTE: 'pages/TaskExecutePage',
    SETTINGS: 'pages/SettingsPage'
  };
}
