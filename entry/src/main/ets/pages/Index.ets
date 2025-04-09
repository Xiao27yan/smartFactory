import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  private swiperController:SwiperController = new SwiperController()
  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Column() {
        Swiper(this.swiperController) {
          Image($r('app.media.startIcon')).width('100%').height('100%')
          Image($r('app.media.download'))
        }
        .indicator(
          Indicator.dot()// 圆形导航点
            .selectedColor(Color.Black)// 选中颜色
            .selectedItemWidth(10)// 选中宽度
            .selectedItemHeight(5)// 选中高度
            .itemWidth(5)// 默认宽度
            .itemHeight(5) // 默认高度
        )

        .height('50%')
        .loop(true)
        .autoPlay(true)
        .interval(2000)
        .width('100%')

        Row() {
          Button('员工考勤').width(120)
            .onClick(()=>{
              router.pushUrl({url:'pages/checkIn'})
            })
          Button('流水线监控').width(120)
            .onClick(()=>{
              router.pushUrl({url:'pages/facConsumption'})
            })
        }
        .margin({top:100})
        .width('100%')
        .justifyContent(FlexAlign.Center)
      }

      .width('95%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}