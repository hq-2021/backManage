<template>
  <div>
    <div>
      <el-button type="primary" @click="getImage(0)">随机</el-button>
      <el-button type="success" @click="getImage(1)">精选</el-button>
      <el-button type="info" @click="getImage(2)">最近</el-button>
      <el-button type="danger" @click="getImage(3)">横屏</el-button>
      <el-button type="warning" @click="getImage(4)">竖屏</el-button>
      <el-button type="primary" style="float: right">下载</el-button>
    </div>

    <div class="demo-image">
      <el-image v-for="(url, index) in urls" :key="index" style="width: 200px" :src="url"></el-image>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
axios.defaults.baseURL = '/img'
axios.defaults.headers.post['Content-Type'] = 'application/json';
export default {
  data() {
    return {
      urls: [],
      web: ['Random.php', 'MirlKoi.php', 'MirlKoi-iw233.php', 'pc.php', 'mp.php'],
    }
  },
  methods: {
    getImage(check) {
      for (var i = 0; i < 6; i++) {
        var web = '/API/' + this.web[check] + '?type=json'
        axios.get(web).then((response) => {
          if (response.data) {
            this.urls.push(response.data.pic)
          } else {
            alert('请求失败')
          }
        })
      }
    },

  },
}
</script>
<style>
.demo-ruleForm {
  width: 50%;
  margin: 0 auto;
}
</style>