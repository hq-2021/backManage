<template>
<div>

  <div style="margin: 10px 0">
    <el-input v-model="username" style="width: 200px" suffix-icon="el-icon-search"
              placeholder="请输入用户名"></el-input>
    <el-input v-model="nickname" style="width: 200px" suffix-icon="el-icon-user" placeholder="请输入昵称"></el-input>
    <el-input v-model="email" style="width: 200px" suffix-icon="el-icon-message" placeholder="请输入邮箱"></el-input>
    <el-input v-model="phone" style="width: 200px" suffix-icon="el-icon-phone" placeholder="请输入电话号码"></el-input>

    <el-input v-model="address" style="width: 200px" suffix-icon="el-icon-position"
              placeholder="请输入地址"></el-input>
    <el-button type="primary" class="ml-5  mr-5" @click="search">搜索</el-button>
    <el-button type="warning" @click="reset" class="ml-5">重置</el-button>

  </div>

  <div style="margin: 10px 0">
    <el-button type="primary" class="ml-5" @click="handleAdd" icon="el-icon-circle-plus-outline">新增</el-button>
    <el-popconfirm
        class="ml-5"
        confirm-button-text="确定"
        cancel-button-text="取消"
        icon="el-icon-info"
        icon-color="red"
        title="您确定批量删除吗？"
        @confirm="batchDel"
    >
      <el-button type="primary"  slot="reference"  class="ml-5" icon="el-icon-remove-outline">批量删除</el-button>
    </el-popconfirm>
    <el-upload :action="'http://' + serverIp + ':9090/user/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
      <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
    </el-upload>
    <el-button type="primary" @click="exp"  class="ml-5" icon="el-icon-top">导出</el-button>

  </div>

  <el-table  v-loading="loading" :data="tableData" border stripe  @selection-change="handleSelectionChange">
    <el-table-column type="selection" width="55" >
    </el-table-column>
    <el-table-column prop="username" label="用户名" width="140">
    </el-table-column>
    <el-table-column prop="nickname" label="昵称" width="120">
    </el-table-column>
    <el-table-column prop="email" label="邮箱" width="180">
    </el-table-column>
    <el-table-column prop="phone" label="电话" width="120">
    </el-table-column>
    <el-table-column prop="address" label="地址" width="300">
    </el-table-column>
    <el-table-column>
      <template slot-scope="scope">
        <el-button type="success" icon="el-icon-edit" @click="handleEdit(scope.row)">编辑</el-button>
        <el-popconfirm
            class="ml-5"
            confirm-button-text="确定"
            cancel-button-text="取消"
            icon="el-icon-info"
            icon-color="red"
            title="您确定删除吗？"
            @confirm="handleDelete(scope.row.id)"
        >
          <el-button type="danger" slot="reference" icon="el-icon-remove-outline">删除</el-button>
        </el-popconfirm>
      </template>
    </el-table-column>
  </el-table>
  <div style="padding: 10px 0">
    <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[5, 10, 15, 20]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
    </el-pagination>
  </div>
  <!--        弹出框-->
  <el-dialog modal title="用户信息"  custom-class="dialog-class" :visible.sync="dialogFormVisible" width="30%">
    <el-form label-width="80px" :model="form" size="small">
      <el-form-item label="用户名:">
        <el-input v-model="form.username" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="昵称:">
        <el-input v-model="form.nickname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="邮箱:">
        <el-input v-model="form.email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="电话:">
        <el-input v-model="form.phone" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item s label="地址:">
        <el-input v-model="form.address" autocomplete="off"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" style="text-align: center" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">取 消</el-button>
      <el-button type="primary" @click="save">确 定</el-button>
    </div>
  </el-dialog>
</div>
</template>

<script>
import {serverIp} from "../../public/config";
export default {
  name: "User.vue",
  data() {
    return {
      pageNum: 1,
      pageSize: 10,
      tableData: [],
      total: 0,
      username: "",
      nickname: "",
      email: "",
      address: "",
      phone: "",
      dialogFormVisible: false,
      form: {},
      multipleSelection: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      logoTextShow: true,
      loading: true,
      serverIp: serverIp,
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
    load() {
      this.loading = true
      //+this.username+"&nickname="+this.nickname+"&phone="+this.phone+"&email="+this.email+"&address="+this.address+""
      this.request.get("/user/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          phone: this.phone,
          address: this.address,
          nickname: this.nickname,
          email: this.email
        }
      }).then((res) => {
        //  request.js处理过了，res就是request.data
        this.tableData = res.data.records
        this.total = res.data.total
        this.loading = false
      })
    },
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
    search() {
      this.load()
    },
    reset() {
      this.username = this.nickname = this.phone = this.email = this.address = ""
      this.load()
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    save() {
      this.request.post("/user",
          this.form
      ).then((res) => {
        if (res) {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
      this.load()
    },
    handleDelete(id) {
      this.request.delete("/user/" + id).then((res) => {
        if (res) {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    batchDel() {
      let ids = this.multipleSelection.map(v => v.id)
      this.request.post("/user/del/batch", ids).then((res) => {
        if (res) {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    exp() {
      window.open(`http://${serverIp}:9090/user/export`)
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  },
  created() {
    this.load()

  }
  ,
}
</script>

<style scoped>
.el-table thead > tr > th {
  background-color: lightgray !important;
}

.el-table td, .el-table th {
  text-align: center !important;
}

.dialog-class {
  border-radius: 10px;
}
</style>