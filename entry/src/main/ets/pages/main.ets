import {checkIn} from '../pages/checkIn'
import {facConsumption} from './facConsumption'
import {factoryStatus} from '../pages/factoryStatus'

@Entry
@Component
struct main {
  @State message: string = 'Hello World';
  @State selectedIndex:number = 0
  build() {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        checkIn()
      }.tabBar('工人考勤状况')
      TabContent(){
        facConsumption()
      }.tabBar('工厂能耗')
      TabContent(){
        factoryStatus()
      }.tabBar('工厂产量')
    }
    .height('100%')
    .width('100%')
  }
}