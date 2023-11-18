import router from '@ohos.router'
@Entry
@Component
struct Two {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(80)
        Button('我是按钮').width('80%').onClick(()=>{
          router.back()
        })
      }
      .width('100%')
      .onClick(()=>{
      //   点击空白页面
        console.log('点击空白了')
      })
    }
  }
}