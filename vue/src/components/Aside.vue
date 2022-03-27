<template>
<el-menu :default-openeds="['1', '3']" style="height:100%;overflow: hidden"
         background-color="rgb(48,65,86)" text-color="#fff"
         active-text-color="#ffd04b" :collapse-transition="false"
         :collapse="isCollapse"
         router
>
  <div style="height:60px;;line-height: 60px;text-align: center">
    <img src="../assets/logo.png" alt=""
         style="width: 18px;position: relative;top: 4px;left: 4px;margin-right: 5px">
    <b v-show="logoTextShow" style="color: white;font-weight: 500">后台管理系统</b>
  </div>
  <el-menu-item index="/">
  <i class="el-icon-s-home"></i>
      <span>主页</span>
  </el-menu-item>
  <el-submenu index="2">
    <template slot="title">
      <i class="el-icon-menu"></i>
      <span>系统管理</span>
    </template>
    <el-menu-item index="/user">
      <i class="el-icon-user"></i>
      <span>用户管理</span>
    </el-menu-item>
    <el-menu-item index="/image">
      <i class="el-icon-message"></i>
      <span>图片管理</span>
    </el-menu-item>
  </el-submenu>
</el-menu>
</template>
<script>
export default {

  data() {
    return {

    }
  },

  props:{
    isCollapse:Boolean,
    logoTextShow: Boolean,
  }
  }

</script>