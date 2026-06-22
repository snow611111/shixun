import router from '@ohos.router';

@Entry
@Component
struct TaskExecutePage {

  @State videoUrl: string = '';
  @State isRunning: boolean = false;
  @State progress: number = 0;

  aboutToAppear() {
    const params = router.getParams() as Record<string, Object>;
    if (params) {
      this.videoUrl = params['videoUrl'] as string;
    }
  }

  build() {
    Column() {
      // 顶部标题
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => {
            router.back();
          })
        Text('任务执行')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
      }
      .width('100%')
      .padding(16)

      // 视频播放区域（占位）
      Column() {
        Text('视频画面')
          .fontSize(16)
          .fontColor('#999')
      }
      .width('100%')
      .height(240)
      .backgroundColor('#1A000000')
      .justifyContent(FlexAlign.Center)
      .borderRadius(8)
      .margin(16)

      // 进度信息
      Text('执行进度：' + this.progress + '%')
        .fontSize(16)
        .margin({ left: 16, bottom: 12 })

      Progress({ value: this.progress, total: 100 })
        .width('90%')
        .height(8)
        .color('#007AFF')

      // 控制按钮
      Row() {
        Button(this.isRunning ? '暂停' : '开始')
          .onClick(() => {
            this.isRunning = !this.isRunning;
          })
          .backgroundColor(this.isRunning ? '#FF9500' : '#007AFF')
          .width(120)

        Button('停止')
          .onClick(() => {
            this.isRunning = false;
            this.progress = 0;
          })
          .backgroundColor('#FF3B30')
          .width(120)
          .margin({ left: 16 })
      }
      .margin({ top: 24 })
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
