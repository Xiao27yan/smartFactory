import {checkIn} from '../pages/checkIn'
import {consumption} from '../pages/consumption'
import {factoryStatus} from '../pages/factoryStatus'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State selectedIndex:number = 0
  build() {
      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          checkIn()
        }.tabBar('工人打卡')
        TabContent(){
          consumption()
        }.tabBar('工厂能耗')
        TabContent(){
          factoryStatus()
        }.tabBar('工厂产量')
      }
    .height('100%')
    .width('100%')
  }
}