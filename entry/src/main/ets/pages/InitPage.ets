import router from '@ohos.router';
import http from '@ohos.net.http';

@Entry
@Component
struct InitPage {

  @State status: string = '系统初始化中...'
  @State ok: boolean = false

  async onPageShow() {
    this.checkSystem()
  }

  async checkSystem() {
    try {
      this.status = '正在连接后端...'

      let httpRequest = http.createHttp()

      let res = await httpRequest.request(
        'http://192.168.2.57/prod-api/agv/config',
        {
          method: http.RequestMethod.GET,
          header: {
            'Authorization': 'Basic YWRtaW4xMjM6QWRtaW5AMTIz',
            'Content-Type': 'application/json'
          }
        }
      )

      let data = JSON.parse(res.result.toString())

      if (data) {
        this.status = '系统正常 ✔ 可以进入'
        this.ok = true
      } else {
        this.status = '配置异常 ❌'
      }

      httpRequest.destroy()

    } catch (e) {
      this.status = '后端连接失败 ❌'
    }
  }

  build() {
    Column() {

      Text('AGV巡检系统')
        .fontSize(24)
        .margin(20)

      Text(this.status)
        .fontSize(18)
        .margin(20)

      if (this.ok) {
        Button('进入任务列表')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/TaskListPage'
            })
          })
      }

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}