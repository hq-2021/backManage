<template>
  <div style="font-size: 12px;display:flex">
    <div style="flex:1;font-size: 20px">
      <span :class="collapseBtnClass" @click="collapse" style="cursor:pointer;"></span>
<!--      <el-breadcrumb style="display: inline-block;margin-left: 10px" separator="/">-->
<!--        <el-breadcrumb-item to >{{ item.meta.nickname }}</el-breadcrumb-item>-->
<!--      </el-breadcrumb>-->
    </div>

    <el-dropdown style="width: 20px;cursor:pointer;" >
      <i class="el-icon-setting" style="margin-right: 15px"></i>
      <el-dropdown-menu  slot="dropdown" style="width: 100px;text-align: center;">
        <el-dropdown-item ><router-link to="/ChangePwd">个人信息</router-link></el-dropdown-item>
        <el-dropdown-item>退出</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <span>{{ nickname }}</span>
  </div>

</template>

<script>
export default {

  props: ["collapseBtnClass", "collapse"],
  //页面挂载之后,解析路由，给出面包屑，路由里面一定要含有breadCom组件的path
  data(){
    return{
      nickname:JSON.parse(localStorage.getItem("user")).data.nickname,
    }
  }
};
</script>
