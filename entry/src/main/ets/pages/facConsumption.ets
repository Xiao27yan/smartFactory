import Echarts from '../components/echarts'
import { EChartsOption } from '../viewModel/viewModel'

@Entry
@Component
export struct facConsumption {
  //图表实例
  myEchart1: Echarts | null = null
  myEchart2: Echarts | null = null

  option2:EChartsOption={
    title: {
      text: '生产线零件故障分析',
      left: 'center'
    },
    series: [{
      type: 'sankey',
      left: '5%',
      right: '5%',
      nodeAlign: 'right',
      data: [
      // 第一层：生产线
        { name: 'L1生产线', itemStyle: { color: '#FF6B6B' } },
        { name: 'L2生产线', itemStyle: { color: '#4ECDC4' } },
        { name: 'L3生产线', itemStyle: { color: '#45B7D1' } },

        // 第二层：零件类型
        { name: '轴承', itemStyle: { color: '#FFA07A' } },
        { name: '齿轮', itemStyle: { color: '#98D8C8' } },
        { name: '电路板', itemStyle: { color: '#F9D5E5' } },

        // 第三层：故障类型
        { name: '磨损', itemStyle: { color: '#E57373' } },
        { name: '短路', itemStyle: { color: '#81C784' } },
        { name: '变形', itemStyle: { color: '#64B5F6' } },
        { name: '无故障', itemStyle: { color: '#A5D6A7' } }
      ],
      links: [
      // L1生产线的零件分布
        { source: 'L1生产线', target: '轴承', value: 156 },
        { source: 'L1生产线', target: '齿轮', value: 78 },
        { source: 'L1生产线', target: '电路板', value: 92 },

        // L2生产线的零件分布
        { source: 'L2生产线', target: '轴承', value: 204 },
        { source: 'L2生产线', target: '电路板', value: 135 },

        // L3生产线的零件分布
        { source: 'L3生产线', target: '齿轮', value: 167 },
        { source: 'L3生产线', target: '电路板', value: 88 },

        // 轴承的故障流向
        { source: '轴承', target: '磨损', value: 95 },
        { source: '轴承', target: '无故障', value: 265 },

        // 齿轮的故障流向
        { source: '齿轮', target: '变形', value: 32 },
        { source: '齿轮', target: '无故障', value: 213 },

        // 电路板的故障流向
        { source: '电路板', target: '短路', value: 41 },
        { source: '电路板', target: '变形', value: 18 },
        { source: '电路板', target: '无故障', value: 256 }
      ],
      label: {
        color: '#333',
        fontSize: 12,
        formatter: '{b}'
      },
    }],
    tooltip: {
      formatter: '{b}'
    }
  }
  /*
   * 图表配置
   */
  option: EChartsOption = {
    tooltip: {
      trigger: 'item'
    },
    //标题
    title: {
      text: '各流水线产量',
      left: 'center'
    },
    legend: {
      orient: 'vertical',
      left: 'left'
    },

    //数据配置
    series: [
      {
        radius: ['50%','20%'],
        data: [],
        type: 'pie',
        name: '访问量'
      },
      {
        name: '总数',
        type: 'pie',
        radius: ['0%','0%'],
        data: [
          { value: 10048, name: '总数' },
        ],
        label:{
          position:'center',
          formatter:'{b}{c}'
        }

      }
    ],

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
        { value: 1048, name: '流水线a' },
        { value: 735, name: '流水线b' },
        { value: 580, name: '流水线c' },
        { value: 484, name: '流水线d' },
        { value: 300, name: '流水线e' }
      ]
      //调用render重新渲染
      this.myEchart1?.render(this.option)
      this.myEchart2?.render(this.option2)
    }, 2000)
  }

  // 组件实例
  chart?: Echarts;

  build() {
    Column() {
      Echarts({
        eHeight: 500,
        //回调
        renderCallBack: (e: Echarts) => {
          this.myEchart1 = e
          //初次渲染组件，接口获取数据是异步此时this.option可能还没有新数据
          this.myEchart1.render(this.option)
        }
      })

      Echarts({
        eHeight: 500,
        //回调
        renderCallBack: (e: Echarts) => {
          this.myEchart2 = e
          //初次渲染组件，接口获取数据是异步此时this.option可能还没有新数据
          this.myEchart2.render(this.option2)
        }
      })
    }
    .width('100%')
    .height('100%')


  }
}
