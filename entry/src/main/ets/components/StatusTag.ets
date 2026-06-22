import { TaskStatus, taskStatusToText, taskStatusToColor } from '../model/TaskModel';

@Component
export default struct StatusTag {

  @Prop status: TaskStatus = TaskStatus.PENDING;

  build() {
    Text(taskStatusToText(this.status))
      .fontSize(12)
      .fontColor('#FFFFFF')
      .backgroundColor(taskStatusToColor(this.status))
      .borderRadius(4)
      .padding({ left: 10, right: 10, top: 4, bottom: 4 })
  }
}
