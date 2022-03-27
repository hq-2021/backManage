<template>
  <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="原密码:" prop="oldPass">
      <el-input style="width: 60%;" type="password" v-model="ruleForm.oldPass" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="密码:" prop="pass">
      <el-input style="width: 60%;" type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="确认密码:" prop="checkPass">
      <el-input style="width: 60%;" type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
    </el-form-item>

    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
import axios from 'axios'
export default {
  data() {
    var validateOldPass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入原密码'))
      } else {
        let user = {
          name: 'hq',
          pwd: value,
        }
        axios.get('http://127.0.0.1:9090/userData', { params: user }).then(
          (response) => {
            if (!response.data) {
              callback(new Error('密码错误,请重新输入'))
            } else {
              callback()
            }
          },
          (error) => {
            console.log(error.message)
          }
        )
      }
    }
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        if (this.ruleForm.checkPass !== '') {
          // ？？？？什么意思
          // ruleForm自定义属性
          this.$refs.ruleForm.validateField('checkPass')
        }
        callback()
      }
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.ruleForm.pass) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      ruleForm: {
        pass: '',
        checkPass: '',
        oldPass: '',
      },
      rules: {
        pass: [{ validator: validatePass, trigger: 'blur' }],
        checkPass: [{ validator: validatePass2, trigger: 'blur' }],
        oldPass: [{ validator: validateOldPass, trigger: 'blur' }],
      },
    }
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let user = {
            name: 'hq',
            // 刚开始忘记加ruleForm了
            pwd: this.ruleForm.checkPass,
          }
          axios
            .get('http://127.0.0.1:9090/upPass', {
              params: user,
            })
            .then((response) => {
              if (response.data) {
                alert('修改成功')
              } else {
                alert('修改失败')
              }
              this.$refs['ruleForm'].resetFields()
            })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
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