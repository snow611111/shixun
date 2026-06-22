export default class TaskModel {
  id: number = 0;
  name: string = '';
  status: TaskStatus = TaskStatus.PENDING;
  description: string = '';
  createTime: string = '';
  updateTime: string = '';
  priority: number = 0;
  videoUrl: string = '';

  constructor(data?: Record<string, Object>) {
    if (data) {
      this.id = data['id'] as number;
      this.name = data['name'] as string;
      this.status = (data['status'] as number) as TaskStatus;
      this.description = data['description'] as string;
      this.createTime = data['createTime'] as string;
      this.updateTime = data['updateTime'] as string;
      this.priority = data['priority'] as number;
      this.videoUrl = data['videoUrl'] as string;
    }
  }
}

export enum TaskStatus {
  PENDING = 0,       // 待执行
  RUNNING = 1,       // 执行中
  COMPLETED = 2,     // 已完成
  FAILED = 3,        // 失败
  CANCELLED = 4      // 已取消
}

export function taskStatusToText(status: TaskStatus): string {
  const map: Record<number, string> = {
    [TaskStatus.PENDING]: '待执行',
    [TaskStatus.RUNNING]: '执行中',
    [TaskStatus.COMPLETED]: '已完成',
    [TaskStatus.FAILED]: '失败',
    [TaskStatus.CANCELLED]: '已取消'
  };
  return map[status] || '未知';
}

export function taskStatusToColor(status: TaskStatus): string {
  const map: Record<number, string> = {
    [TaskStatus.PENDING]: '#999999',
    [TaskStatus.RUNNING]: '#007AFF',
    [TaskStatus.COMPLETED]: '#34C759',
    [TaskStatus.FAILED]: '#FF3B30',
    [TaskStatus.CANCELLED]: '#FF9500'
  };
  return map[status] || '#999999';
}
