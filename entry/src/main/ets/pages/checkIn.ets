import { User } from '../model/User'
import { ItemRestriction, SegmentButton, SegmentButtonOptions, SegmentButtonTextItem } from '@kit.ArkUI'

@Component
export struct checkIn{
  @State changeValue: string = ''
  @State searchValue:string = ''
  @StorageLink("allUserListData") allUserListData:Array<User> = []
  getUserData(){
    const dataList = [
      new User('姓名', '状态', '部门'),
      new User('Alice', '已打卡', '工程师'),
      new User('Bob', '未打卡', '市场监督'),
      new User('Charlie', '已打卡', '销售'),
      new User('David', '已打卡', '客服'),
      new User('Eve', '未打卡', '运营'),
      new User('Frank', '已打卡', '设计')
    ];
    this.allUserListData = dataList
  }
  aboutToAppear(): void {
    this.getUserData()
  }
  searchUserByCondition = (flag:string,condition:string) =>{
    let resList:Array<User> = []
    switch (flag){
      case "name":
        this.allUserListData.forEach((item)=>{
          if(item.name == condition){
            resList.push(item)
          }
        })
        this.allUserListData = resList
        break
      case "status":
        this.allUserListData.forEach((item)=>{
          if(item.status == condition){
            resList.push(item)
          }
        })
        this.allUserListData = resList
    }

  }
  build() {
    Flex({direction:FlexDirection.Column}){
      Search({ value: this.changeValue, placeholder: '请输入姓名' })
        .searchButton('搜索')
        .searchIcon({
          src: $r('sys.media.ohos_ic_public_search_filled')
        })
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            src: $r('sys.media.ohos_ic_public_cancel_filled')
          }
        })
        .onDidDelete(()=>{
          this.allUserListData = this.allUserListData
        })
        .width('100%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.searchUserByCondition("name",value)
        })
        .onChange((value:string) => {
          if(value == ''){
            this.getUserData()
          }
        })
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.allUserListData, (item: User) => {
          ListItem() {
            Row(){
              Text(item.name).width("30%")
              Text(item.status).width("30%")
              Text(item.department).width("30%")
            }
            .width("100%")
            .height("50")
            // .backgroundColor(Color.Orange)
            .border({style:BorderStyle.Dashed,width:1,color:Color.Black})
            .justifyContent(FlexAlign.Center)
            .borderRadius('10')
          }
        })
      }
      .height('100%')
      .width("100%")
      .friction(0.6)
      .scrollBar(BarState.Off)
      .margin({top:30})
      Flex({justifyContent: FlexAlign.SpaceAround}){
        Button('全部人').onClick(()=>{
          this.getUserData()
        })
        Button('已打卡').onClick(()=>{
          this.getUserData()
          this.searchUserByCondition('status',"已打卡")
        })
        Button('未打卡').onClick(()=>{
          this.getUserData()
          this.searchUserByCondition('status',"未打卡")
        })
      }.margin({top:30})
    }.padding("10")
  }
}