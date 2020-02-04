<template>
  <a-modal
    :title="title"
    :width="800"
    :visible="visible"
    :confirmLoading="confirmLoading"
    @ok="handleOk"
    @cancel="handleCancel"
    cancelText="关闭">
    
    <a-spin :spinning="confirmLoading">
      <a-form :form="form">

        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="商品名称">
          <a-input placeholder="请输入商品名称" v-decorator="['name', validatorRules.name ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="国际条码">
          <a-input placeholder="请输入国际条码" v-decorator="['barcode', validatorRules.barcode ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="分类（必填）">
          <a-input placeholder="请输入分类（必填）" v-decorator="['typeName', validatorRules.typeName ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="规格">
          <a-input placeholder="请输入规格" v-decorator="['specs', validatorRules.specs ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="计量单位">
          <a-input placeholder="请输入计量单位" v-decorator="['unit', validatorRules.unit ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="库存量（必填）">
          <a-input-number v-decorator="[ 'amount', validatorRules.amount ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="进货价（必填）">
          <a-input-number v-decorator="[ 'purchasePrice', validatorRules.purchasePrice ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="销售价（必填）">
          <a-input-number v-decorator="[ 'salesPrice', validatorRules.salesPrice ]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="批发价">
          <a-input-number v-decorator="[ 'tradePrice', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="会员价">
          <a-input-number v-decorator="[ 'vipPrice', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="会员折扣">
          <a-input-number v-decorator="[ 'vipDiscount', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="积分商品(1=是 2=否)">
          <a-input placeholder="请输入积分商品(1=是 2=否)" v-decorator="['integral', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="库存上限">
          <a-input-number v-decorator="[ 'stockUpperLimit', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="库存下限">
          <a-input-number v-decorator="[ 'stockLowerLimit', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="品牌">
          <a-input placeholder="请输入品牌" v-decorator="['brand', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="供货商">
          <a-input placeholder="请输入供货商" v-decorator="['supplier', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="生产日期">
          <a-date-picker showTime format='YYYY-MM-DD HH:mm:ss' v-decorator="[ 'manufactureTime', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="保质期（天）">
          <a-input-number v-decorator="[ 'qualityDays', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="保质到期日">
          <a-date-picker showTime format='YYYY-MM-DD HH:mm:ss' v-decorator="[ 'qualityDate', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="拼音码">
          <a-input placeholder="请输入拼音码" v-decorator="['pinyin', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="自定义1">
          <a-input placeholder="请输入自定义1" v-decorator="['diyW1', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="自定义2">
          <a-input placeholder="请输入自定义2" v-decorator="['diyW2', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="商品状态">
          <a-input placeholder="请输入商品状态" v-decorator="['state', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="商品描述">
          <a-input placeholder="请输入商品描述" v-decorator="['desc', {}]" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="不计库存（1=是 2=否）">
          <a-input placeholder="请输入不计库存（1=是 2=否）" v-decorator="['noStock', {}]" />
        </a-form-item>
		
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>
  import { httpAction } from '@/api/manage'
  import pick from 'lodash.pick'
  import moment from "moment"

  export default {
    name: "goodsModal",
    data () {
      return {
        title:"操作",
        visible: false,
        model: {},
        labelCol: {
          xs: { span: 24 },
          sm: { span: 5 },
        },
        wrapperCol: {
          xs: { span: 24 },
          sm: { span: 16 },
        },

        confirmLoading: false,
        form: this.$form.createForm(this),
        validatorRules:{
        name:{rules: [{ required: true, message: '请输入商品名称!' }]},
        barcode:{rules: [{ required: true, message: '请输入国际条码!' }]},
        typeName:{rules: [{ required: true, message: '请输入分类（必填）!' }]},
        specs:{rules: [{ required: true, message: '请输入规格!' }]},
        unit:{rules: [{ required: true, message: '请输入计量单位!' }]},
        amount:{rules: [{ required: true, message: '请输入库存量（必填）!' }]},
        purchasePrice:{rules: [{ required: true, message: '请输入进货价（必填）!' }]},
        salesPrice:{rules: [{ required: true, message: '请输入销售价（必填）!' }]},
        },
        url: {
          add: "/goods/goods/add",
          edit: "/goods/goods/edit",
        },
      }
    },
    created () {
    },
    methods: {
      add () {
        this.edit({});
      },
      edit (record) {
        this.form.resetFields();
        this.model = Object.assign({}, record);
        this.visible = true;
        this.$nextTick(() => {
          this.form.setFieldsValue(pick(this.model,'storeId','name','barcode','typeName','specs','unit','amount','purchasePrice','salesPrice','tradePrice','vipPrice','vipDiscount','integral','stockUpperLimit','stockLowerLimit','brand','supplier','qualityDays','pinyin','diyW1','diyW2','state','desc','noStock'))
		  //时间格式化
          this.form.setFieldsValue({manufactureTime:this.model.manufactureTime?moment(this.model.manufactureTime):null})
          this.form.setFieldsValue({qualityDate:this.model.qualityDate?moment(this.model.qualityDate):null})
        });

      },
      close () {
        this.$emit('close');
        this.visible = false;
      },
      handleOk () {
        const that = this;
        // 触发表单验证
        this.form.validateFields((err, values) => {
          if (!err) {
            that.confirmLoading = true;
            let httpurl = '';
            let method = '';
            if(!this.model.id){
              httpurl+=this.url.add;
              method = 'post';
            }else{
              httpurl+=this.url.edit;
               method = 'put';
            }
            let formData = Object.assign(this.model, values);
            //时间格式化
            formData.manufactureTime = formData.manufactureTime?formData.manufactureTime.format('YYYY-MM-DD HH:mm:ss'):null;
            formData.qualityDate = formData.qualityDate?formData.qualityDate.format('YYYY-MM-DD HH:mm:ss'):null;
            
            console.log(formData)
            httpAction(httpurl,formData,method).then((res)=>{
              if(res.success){
                that.$message.success(res.message);
                that.$emit('ok');
              }else{
                that.$message.warning(res.message);
              }
            }).finally(() => {
              that.confirmLoading = false;
              that.close();
            })



          }
        })
      },
      handleCancel () {
        this.close()
      },


    }
  }
</script>

<style scoped>

</style>