/**
 * echart配置数据类型定义
 */
export interface EChartsOption {
  grid?: EchartGrid,
  title?: EChartsTitle;
  tooltip?: EChartsTooltip;
  legend?: EChartsLegend;
  xAxis?: EChartsXAxis;
  yAxis?: EChartsYAxis;
  series: EChartsSeries[];
}

export  interface EchartGrid {
  top?: number|string
  bottom?: number|string
  left?: number|string
  right?: number|string
}

export interface EChartsTitle {
  text?: string;
  left?:string
}

export  interface itemStyle{
  color?:string
}

export interface EChartsTooltip {
  trigger?:string;
  formatter?:string
}

export interface EChartsLegend {
  orient?:string
  show?:boolean
  data?: string[];
  left?:string
}


export interface EChartsXAxis {
  type?: string;
  data: string[];
  axisLine?: XAxisAxisLine;
  axisTick?: XAxisAxisTick
  boundaryGap?: boolean | Array<string>
  axisLabel?: AxisLabel

}

export interface XAxisAxisLine {
  show?: boolean
}

export interface XAxisAxisTick {
  show?: boolean
}


export interface EChartsYAxis {
  type?: string
  splitLine?: YAxisSplitLine
  splitNumber?: number
  min?: number
  max?: number
  scale?: boolean
  interval?: number

}

export interface AxisLabel {
  show?: boolean
  formatter?: string | ((value: number | string, index: number) => string)
}

export interface YAxisSplitLine {
  lineStyle?: AxisSplitLineLineStyle
}

export interface AxisSplitLineLineStyle {
  type?: string
}

export interface keyValue{
  value?:number;
  name?:string
}

export interface Label{
  position?:string;
  formatter?:string
  color?:string
  fontSize?:number
}

export interface link{
  source?:string,
  target?:string,
  value?:number
}

export interface keyValue2{
  name?:string,
  itemStyle?:itemStyle
}


export interface EChartsSeries {
  name?: string;
  type?: string;
  data?: number[]|keyValue[]|keyValue2[];
  radius?:number[]|string[];
  center?:string[];
  label?:Label,
  left?:string,
  right?:string
  nodeAlign?:string
  links?:link[]
}
