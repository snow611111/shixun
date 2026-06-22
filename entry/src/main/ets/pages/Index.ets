import router from '@ohos.router';

@Entry
@Component
struct Index {

  aboutToAppear() {
    router.replaceUrl({
      url: 'pages/InitPage'
    })
  }

  build() {
    Column() {
      Text('启动中...')
    }
  }
}