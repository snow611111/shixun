export default class FlawModel {
  id: number = 0;
  taskId: number = 0;
  type: FlawType = FlawType.UNKNOWN;
  description: string = '';
  imageUrl: string = '';
  location: string = '';
  severity: number = 0;
  createTime: string = '';

  constructor(data?: Record<string, Object>) {
    if (data) {
      this.id = data['id'] as number;
      this.taskId = data['taskId'] as number;
      this.type = (data['type'] as number) as FlawType;
      this.description = data['description'] as string;
      this.imageUrl = data['imageUrl'] as string;
      this.location = data['location'] as string;
      this.severity = data['severity'] as number;
      this.createTime = data['createTime'] as string;
    }
  }
}

export enum FlawType {
  UNKNOWN = 0,
  CRACK = 1,         // 裂缝
  RUST = 2,          // 锈蚀
  DEFORMATION = 3,   // 变形
  LOOSENESS = 4,     // 松动
  WEAR = 5           // 磨损
}

export function flawTypeToText(type: FlawType): string {
  const map: Record<number, string> = {
    [FlawType.UNKNOWN]: '未知',
    [FlawType.CRACK]: '裂缝',
    [FlawType.RUST]: '锈蚀',
    [FlawType.DEFORMATION]: '变形',
    [FlawType.LOOSENESS]: '松动',
    [FlawType.WEAR]: '磨损'
  };
  return map[type] || '未知';
}
