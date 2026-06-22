@Entry
@Component
struct SettingsPage {

  @State baseUrl: string = 'http://192.168.2.57/prod-api';
  @State authToken: string = 'Basic YWRtaW4xMjM6QWRtaW5AMTIz';
  @State autoCheck: boolean = true;

  build() {
    Column() {
      // 顶部标题
      Row() {
        Text('系统设置')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(16)

      // 设置项列表
      Column() {
        // 后端地址
        Row() {
          Text('后端地址')
            .fontSize(16)
          TextInput({ placeholder: '请输入后端地址', text: this.baseUrl })
            .onChange((value: string) => {
              this.baseUrl = value;
            })
            .layoutWeight(1)
            .margin({ left: 12 })
        }
        .width('100%')
        .padding(16)

        // 认证令牌
        Row() {
          Text('认证令牌')
            .fontSize(16)
          TextInput({ placeholder: '请输入认证令牌', text: this.authToken })
            .onChange((value: string) => {
              this.authToken = value;
            })
            .layoutWeight(1)
            .margin({ left: 12 })
        }
        .width('100%')
        .padding(16)

        // 自动检测
        Row() {
          Text('启动自动检测')
            .fontSize(16)
          Toggle({ type: ToggleType.Switch, isOn: this.autoCheck })
            .onChange((value: boolean) => {
              this.autoCheck = value;
            })
            .margin({ left: 12 })
        }
        .width('100%')
        .padding(16)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
  }
}
