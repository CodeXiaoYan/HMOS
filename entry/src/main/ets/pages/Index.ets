class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item).width('90%').height(160).backgroundColor(0xAFEEEE).textAlign(TextAlign.Center).fontSize(30)
        }, item => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })

      Row({ space: 12 }) {
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext()
          })
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          })
      }.margin(5)
    }.width('100%')
    .margin({ top: 5 })
  }
}
@Entry
@Component
struct Main {

  public tabsController: TabsController = new TabsController()
  @State currentIndex:number = 0

  build() {
    Tabs({barPosition:BarPosition.End,index:this.currentIndex,controller:this.tabsController}) {
      TabContent() {
      }
      .tabBar(this.TabBuilder("首页",0,null,null))
      TabContent() {
        Text('公众号的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder("公众号",1,null,null))
      TabContent() {
        Text('体系的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder("体系",2,null,null))
      TabContent() {
        Text('项目的内容').fontSize(30)
      }
      .tabBar(this.TabBuilder("项目",3,null,null))
    }.barHeight(100)
    .onChange((index:number) => {
      this.currentIndex = index
    })
  }

  @Builder TabBuilder(title: string, targetIndex: number,selectedImg: Resource,normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 30, height: 30 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#5DA0FF' : '#999999')
    }
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
    .justifyContent(FlexAlign.Center)
  }
}
