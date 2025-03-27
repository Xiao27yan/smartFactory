import Echarts from '../components/echarts'
import { EChartsOption } from '../viewModel/viewModel'

@Entry
@Component
export struct facConsumption {
  //图表实例
  myEchart: Echarts | null = null
  /*
   * 图表配置
   */
  option: EChartsOption = {
    tooltip:{
      trigger:'item'
    },
    //标题
    title: {
      text: '工厂能耗',
      left:'center'
    },
    //图例
    // legend: {
    //   left:'left'
    // },
    //x轴配置
    xAxis: {
      type: 'category',
      data: []
    },
    //y轴配置
    yAxis: {
      type: 'value'
    },
    //数据配置
    series: [
      {
        radius:['50%'],
        data: [],
        type: 'pie',//柱状图
        name: '访问量'
      }
    ]
  };

  aboutToAppear(): void {
    this.getData()
  }

  //接口请求获取数据
  getData() {
    //模拟接口请求
    setTimeout(() => {
      //设置x轴数据
      this.option.series[0].data = [
        { value: 1048, name: 'Search Engine' },
        { value: 735, name: 'Direct' },
        { value: 580, name: 'Email' },
        { value: 484, name: 'Union Ads' },
        { value: 300, name: 'Video Ads' }
      ]
      //调用render重新渲染
      this.myEchart?.render(this.option)
    }, 2000)
  }

  // 组件实例
  chart?: Echarts;

  build() {
    Column() {
      Echarts({
        eHeight: 300,
        //回调
        renderCallBack: (e: Echarts) => {
          this.myEchart = e
          //初次渲染组件，接口获取数据是异步此时this.option可能还没有新数据
          this.myEchart.render(this.option)
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}
