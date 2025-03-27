import Echarts from '../components/echarts'
import { EChartsOption } from '../viewModel/viewModel'

@Entry
@Component
struct Index {
  //图表实例
  myEchart: Echarts | null = null
  /*
   * 图表配置
   */
  option: EChartsOption = {
    //标题
    title: {
      text: '基础柱状图'
    },
    //图例
    legend: {
      data: ['访问量']
    },
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
        data: [],
        type: 'bar',//柱状图
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
      this.option.xAxis.data = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      //设置y轴数据
      this.option.series[0].data = [120, 200, 150, 80, 70, 110, 130]
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
