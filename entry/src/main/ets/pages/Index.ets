@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State num: number = 12
  build() {
    Row() {
      Column() {
        Text(`${this.message}${this.num}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}