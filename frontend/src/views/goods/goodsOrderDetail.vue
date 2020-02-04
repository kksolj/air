<template>
  <div>
    <a-button class="add-goods-button" icon="plus-square"   @click="addGoods">手动新增</a-button>
    <a-table
      :rowClassName="record => 'table-row'"
      :columns="columns"
      :dataSource="data"
      bordered
      :pagination={pageSize:5}
      >
      <template
        v-for="col in ['name', 'salesPrice', 'nub']"
        :slot="col"
        slot-scope="text, record, index"
      >
        <div :key="col">
          <a-input
            v-if="record.editable"
            style="margin: -5px 0"
            :value="text"
            @change="e => handleChange(e.target.value, record.key, col)"
          />
          <template v-else>{{text}}</template>
        </div>
      </template>
      <template slot="operation" slot-scope="text, record, index">
        <div class="editable-row-operations">
          <span v-if="record.editable">
            <a-button class="edit"  @click="(e) => save(e,record.key)">保存</a-button >
          </span>
          <span v-else>
            <a-button class="edit"  @click="(e) => edit(e,record.key)">编辑</a-button >
          </span>
            <a-button class="edit"  @click="(e)=>cancel(e,record.key)">删除</a-button>
        </div>
      </template>
    </a-table>
    <a-button  class="hang-up-order-button"   @click="hangUpOrder" >挂单</a-button>
    <a-button  class="create-order-button"    @click="createOrder" >收银￥{{totalPrice}}</a-button>
  </div>
</template>
<script>
  import { deleteAction,getAction } from '@/api/manage'

  const columns = [
    {
      title: '商品名称',
      dataIndex: 'name',
      width: '25%',
      scopedSlots: { customRender: 'name' },
    },
    {
      title: '商品条码',
      dataIndex: 'barcode',
      width: '15%',
      scopedSlots: { customRender: 'barcode' },
    },
    {
      title: '销售价',
      dataIndex: 'salesPrice',
      width: '15%',
      scopedSlots: { customRender: 'salesPrice' },
    },
    {
      title: '数量',
      dataIndex: 'nub',
      width: '15%',
      scopedSlots: { customRender: 'nub' },
    },
    {
      title: '小计',
      dataIndex: 'amount',
      width: '15%',
      scopedSlots: { customRender: 'amount' },
    },
    {
      title: '操作',
      dataIndex: 'operation',
      scopedSlots: { customRender: 'operation' },

    },
  ];

  export default {
    component() {
    },
    data() {
      return {
        row_class:'row-class',
        userInfo:[],
        totalPrice: 0,
        data:[],
        columns,
        nextCode: '',
        lastTime: '',
        code: '',
        i: 0,
        url: {
          getByBarcode: "/goods/goods/getByBarcode",
        },

      };
    },
    watch: {
      data: {
        handler: function (newVal) {
          this.totalPrice = 0
          newVal.forEach(item => {
            this.totalPrice= this.totalPrice+item.amount
          })
        },
        deep: true
      }
    },
    mounted() {
      // 添加键盘监听事件
      document.addEventListener('keydown', this.getBarCode)
    },
    destroyed() {
      // 销毁页面时销毁监听
      document.removeEventListener('keydown', this.getBarCode)
    },
    methods: {
      // 通过扫码枪获取条形码
      getBarCode(e) {

        let nextCode
        let nextTime = ''
        const lastTime = this.lastTime
        let code = this.code
        if (window.event) {
          // IE
          nextCode = e.keyCode
        } else if (e.which) {
          // Netscape/Firefox/Opera
          nextCode = e.which
        }
        nextTime = new Date().getTime()
        // 字母上方 数字键0-9 对应键码值 48-57; 数字键盘 数字键0-9 对应键码值 96-105
        if (
          (nextCode >= 48 && nextCode <= 57) ||
          (nextCode >= 96 && nextCode <= 105)
        ) {
          const codes = {
            '48': 48,
            '49': 49,
            '50': 50,
            '51': 51,
            '52': 52,
            '53': 53,
            '54': 54,
            '55': 55,
            '56': 56,
            '57': 57,
            '96': 48,
            '97': 49,
            '98': 50,
            '99': 51,
            '100': 52,
            '101': 53,
            '102': 54,
            '103': 55,
            '104': 56,
            '105': 57
          }
          nextCode = codes[nextCode]
          nextTime = new Date().getTime()
        }
        // 第二次输入延迟两秒，删除之前的数据重新计算
        if (nextTime && lastTime && nextTime - lastTime > 300) {
          code = String.fromCharCode(nextCode)
        } else {
          code += String.fromCharCode(nextCode)
        }
        // 保存数据
        this.nextCode = nextCode
        this.lastTime = nextTime
        this.code = code
        // 键入Enter
        if (e.which === 13) {
          code = code.trim()
          if (code.length == 0) {
              // this.$message.error('请输入条码');
              return ;
            } else {
              this.i = this.i+1
              //执行扫码后方法
              this.getByBarCode(code);
            }

          // 键入回车务必清空code值
          this.code = ''
          return false
        }
      },
      addGoods(e){
        e.target.blur()
        this.i = this.i + 1
        const newGoods = {
          key:this.i,
          barcode: '无条码商品' + this.i ,
          name: '手动录入商品' + this.i ,
          salesPrice: 0,
          remarks: "无",
          amount: 0,
          nub: 1,
        }
        this.data.push(newGoods)
        console.log(this.data)
      },
      getByBarCode(code){
          getAction(this.url.getByBarcode,{barcode:code}).then((res)=>{
          // console.log('res',res)
          if(res.success && res.data.name!==""){
            const newGoods ={
              key:this.i,
              barcode: code,
              name: res.data.name,
              salesPrice: res.data.salesPrice,
              remarks: res.data.remarks?res.data.remarks:"无",
              amount: res.data.salesPrice * 1,
              nub: 1,
            }

            const haveGoods =  this.data.some(item =>{
              return item.barcode === code
            })
            if(!haveGoods){
              return  this.data.unshift(newGoods);
            }else {
               this.data.find(item => {
                if(code===item.barcode)
                  return   (item.nub = Number.parseInt(item.nub)+1 )&& (item.amount = item.nub*item.salesPrice)
              });
            }
          }else{
            this.$message.error('没有该条码的商品');
          }
        })
      },
      handleChange(value, key, column) {
        const newData = [...this.data];
        const target = newData.filter(item => key === item.key)[0];
        if (target) {
          target[column] = value;
          this.data = newData;
        }
      },
      edit(e,key) {
        e.target.blur()
        const newData = [...this.data];
        const target = newData.filter(item => key === item.key)[0];
        if (target) {
          target.editable = true;
          this.data = newData;
        }
      },
      save(e,key) {
        e.target.blur()
        const newData = [...this.data];
        let target = newData.filter(item => key === item.key)[0];
        target.amount = target.nub*target.salesPrice
        if (target) {
          delete target.editable;
          this.data = newData;
        }
      },
      cancel(e,key) {
        e.target.blur()
        const newData = [...this.data];
        const target = newData.filter(item => key === item.key)[0];
        if (target) {
          delete target.editable;
          let arr = newData.filter(function(val){
            return val.key!=key;
          });
          this.data = arr;
        }
      },

      hangUpOrder(e){
        //取消焦点
         e.target.blur();
         console.log('挂单')
      },
      createOrder(e){
        //取消焦点
        e.target.blur();

        //订单判断
        if(this.isEmpty(this.data)){
          return   this.$message.error('目前没有购买任何商品');
        }

        //填充订单
         let resultArr = []
         resultArr.push({
          orderList: this.data,
          userInfo: this.userInfo,
          totalPrice: this.totalPrice
        })

        //此处需要一段上传数据代码
        console.log('本次订单内容:'+ JSON.stringify(resultArr))
        this.$message.info('订单提交成功');

        //数据归位
        Object.assign(this.$data, this.$options.data(),this.data)
      }
    },
  };
</script>
<style>

  .add-goods-button{
    width: 100%;
    color: #222222;
    height: 50px;
    background-color: #a0d911;
    font-size: 18px;
    font-weight: bold;
  }
  .editable-row-operations a {
    margin-right: 8px;
  }

  .hang-up-order-button{
    float: left;
    background-color: #fa541c;
    font-size: 30px;
    height: 80px;
    width: 150px;
  }

  .create-order-button{
    float: right;
    background-color: #2f54eb;
    font-size: 30px;
    color: white;
    height: 80px;
    width: 300px;
  }

  .edit{
    background-color: #222222;
    color: white;
    font-size: 18px;
  }

  .table-row{
    font-size: 18px;
    color: #222222;
    font-weight: bold;
  }

</style>
