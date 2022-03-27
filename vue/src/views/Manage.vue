<template>
  <el-container style="min-height: 100%; border: 1px solid #eee">
    <el-aside :width="sideWidth+'px'"
              style="box-shadow:2px 0 6px rgb(0 21 41) ;min-height:100%;background-color: rgb(238, 241, 246)">
      <Aside :is-collapse="isCollapse" :logo-text-show="logoTextShow"/>
    </el-aside>

    <el-container>
      <el-header>
        <Header :collapseBtnClass="collapseBtnClass" :collapse="collapse"></Header>
      </el-header>

      <el-main>
        <!--        路由展示处-->
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>
<style scoped>
.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}


</style>
<script>
// @ is an alias to /src
import Aside from "@/components/Aside";
import Header from "@/components/Header";
import User from "@/components/User";


export default {
  name: 'Home',

  data() {
    return {
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      logoTextShow: true,
      sideWidth: 200,
    }
  },
  methods: {
    collapse() {
      this.isCollapse = !this.isCollapse;
      if (this.isCollapse) {
        this.sideWidth = 64
        this.collapseBtnClass = 'el-icon-s-unfold'
        this.logoTextShow = false
      } else {
        this.sideWidth = 200
        this.collapseBtnClass = 'el-icon-s-fold'
        this.logoTextShow = true
      }
    },
  },
  created() {
  }
  ,
  components: {
    Aside, Header, User
  }
}
</script>

