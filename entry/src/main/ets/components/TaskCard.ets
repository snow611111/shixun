import TaskModel, { taskStatusToText, taskStatusToColor } from '../model/TaskModel';
import FormatUtil from '../utils/FormatUtil';

@Component
export default struct TaskCard {

  @Prop task: TaskModel = new TaskModel();
  onClickAction?: () => void;

  build() {
    Column() {
      Row() {
        Text(this.task.name || '任务#' + this.task.id)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)

        Text(taskStatusToText(this.task.status))
          .fontSize(12)
          .fontColor('#FFFFFF')
          .backgroundColor(taskStatusToColor(this.task.status))
          .borderRadius(4)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
      }
      .width('100%')

      Text(this.task.description || '暂无描述')
        .fontSize(13)
        .fontColor('#999')
        .margin({ top: 6 })
        .width('100%')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Row() {
        Text(FormatUtil.formatDate(this.task.createTime))
          .fontSize(12)
          .fontColor('#BBB')
      }
      .width('100%')
      .margin({ top: 8 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#F8F8F8')
    .borderRadius(10)
    .onClick(() => {
      if (this.onClickAction) {
        this.onClickAction();
      }
    })
  }
}
