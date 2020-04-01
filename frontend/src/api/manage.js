import { axios } from '@/utils/request'
import Vue from 'vue'
import {ACCESS_TOKEN} from "../store/mutation-types";

const api = {
  user: '/api/user',
  role: '/api/role',
  service: '/api/service',
  permission: '/api/permission',
  permissionNoPager: '/api/permission/no-pager'
}

export default api

//post
export function postAction(url,parameter) {
  return axios({
    url: url,
    method:'post' ,
    data: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

//post method= {post | put}
export function httpAction(url,parameter,method) {
  return axios({
    url: url,
    method:method ,
    data: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

//put
export function putAction(url,parameter) {
  return axios({
    url: url,
    method:'put',
    data: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

//get
export function getAction(url,parameter) {
  return axios({
    url: url,
    method: 'get',
    params: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

//deleteAction
export function deleteAction(url,parameter) {
  return axios({
    url: url,
    method: 'delete',
    params: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

export function getUserList(parameter) {
  return axios({
    url: api.user,
    method: 'get',
    params: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

export function getRoleList(parameter) {
  return axios({
    url: api.role,
    method: 'get',
    params: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

export function getServiceList(parameter) {
  return axios({
    url: api.service,
    method: 'get',
    params: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

export function getPermissions(parameter) {
  return axios({
    url: api.permissionNoPager,
    method: 'get',
    params: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

// id == 0 add     post
// id != 0 update  put
export function saveService(parameter) {
  return axios({
    url: api.service,
    method: parameter.id == 0 ? 'post' : 'put',
    data: parameter,
    headers:{
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

export function downFile(url,method){
  return axios({
    url: url,
    method: method,
    responseType: 'blob',
    headers: {
      'Content-Type':'multipart/form-data',
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}

export function uploadFile(url,method,data) {
  return axios({
    url: url,
    method: method,
    data: data,
    headers: {
      'Content-Type':'multipart/form-data,charset=utf-8,boundary=none',
      'Content-Disposition':'attachment;filename=test.xls;name=import-excel',
      'X-Access-Token': Vue.ls.get(ACCESS_TOKEN)
    }
  })
}