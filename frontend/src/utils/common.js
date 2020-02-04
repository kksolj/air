export default{
  install(Vue,options)
  {
    //判断数组是否为空
    Vue.prototype.isEmpty = function (value) {
      return (Array.isArray(value) && value.length === 0) || (Object.prototype.isPrototypeOf(value) && Object.keys(value).length === 0);
    }
  }
}