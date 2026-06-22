import HttpUtil from './HttpUtil';
import ApiConfig from './ApiConfig';
import ErrorHandler from '../utils/ErrorHandler';

export default class ApiService {

  /**
   * 获取AGV系统配置
   */
  static async getConfig(): Promise<any> {
    let res = await HttpUtil.get(ApiConfig.AGV_CONFIG);
    if (ErrorHandler.check(res)) {
      return res.data;
    }
    return null;
  }

  /**
   * 获取任务列表
   */
  static async getTaskList(): Promise<any> {
    let res = await HttpUtil.get(ApiConfig.TASK_LIST);
    if (ErrorHandler.check(res)) {
      return res.data;
    }
    return null;
  }

  /**
   * 启动任务
   * @param taskId 任务ID
   */
  static async startTask(taskId: number): Promise<any> {
    let res = await HttpUtil.post(ApiConfig.TASK_START, { id: taskId });
    if (ErrorHandler.check(res)) {
      return res.data;
    }
    return null;
  }

  /**
   * 获取任务详情
   * @param taskId 任务ID
   */
  static async getTaskDetail(taskId: number): Promise<any> {
    let res = await HttpUtil.get(ApiConfig.TASK_LIST + '/' + taskId);
    if (ErrorHandler.check(res)) {
      return res.data;
    }
    return null;
  }
}
