export default class ConfigModel {
  stationId: string = '';
  stationName: string = '';
  checkInterval: number = 5000;
  videoSource: string = '';
  autoStart: boolean = false;
  timeout: number = 30000;
  retryCount: number = 3;

  constructor(data?: Record<string, Object>) {
    if (data) {
      this.stationId = data['stationId'] as string;
      this.stationName = data['stationName'] as string;
      this.checkInterval = data['checkInterval'] as number;
      this.videoSource = data['videoSource'] as string;
      this.autoStart = data['autoStart'] as boolean;
      this.timeout = data['timeout'] as number;
      this.retryCount = data['retryCount'] as number;
    }
  }
}
