import router from '@ohos.router';

@Entry
@Component
struct TaskDetailPage {

  @State taskId: number = -1;
  @State taskName: string = '';
  @State taskStatus: string = '';
  @State taskDesc: string = '';

  aboutToAppear() {
    const params = router.getParams() as Record<string, Object>;
    if (params) {
      this.taskId = params['id'] as number;
      this.taskName = params['name'] as string;
    }
  }

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => {
            router.back();
          })
        Text('任务详情')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
      }
      .width('100%')
      .padding(16)

      // 任务信息卡片
      Column() {
        Text(this.taskName || '任务#' + this.taskId)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)

        Text('状态：' + (this.taskStatus || '未知'))
          .fontSize(16)
          .margin({ top: 8 })

        Text(this.taskDesc || '暂无描述')
          .fontSize(14)
          .fontColor('#666')
          .margin({ top: 12 })
      }
      .width('100%')
      .padding(20)
      .margin(16)
      .borderRadius(12)
      .backgroundColor('#F5F5F5')
    }
    .width('100%')
    .height('100%')
  }
}
