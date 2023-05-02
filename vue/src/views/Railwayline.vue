<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0" v-if="user.role=='ROLE_ADMIN'||user.role=='ROLE_RAILWAYS'">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
     <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
     <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
      <el-table-column prop="name" label="铁路线名称"></el-table-column>
      <el-table-column prop="grade" label="铁路线等级"></el-table-column>
      <el-table-column prop="tname" label="铁路局">
<!--        <template #default="scope">-->
<!--          <div v-for="(item,index) in scope.row.stationList" :key="index">-->
<!--            <el-tag  type="success">{{item.name}}</el-tag>-->
<!--          </div>-->
<!--        </template>-->
      </el-table-column>
      <el-table-column prop="uid" label="负责人">
        <template #default="scope">
          {{scope.row.user.nickname }}
        </template>
      </el-table-column>
      <el-table-column label="操作"  width="200" align="center" v-if="user.role=='ROLE_ADMIN'||user.role=='ROLE_RAILWAYS'">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="50%" >
      <el-form label-width="120px" size="small">

        <el-form-item label="铁路线名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="铁路线等级">
          <el-select v-model="form.grade" placeholder="铁路线等级" >
              <el-option value="Ⅰ级铁路"></el-option>
              <el-option value="Ⅱ级铁路"></el-option>
              <el-option value="Ⅲ级铁路"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="铁路局">
          <el-select v-model="form.tid" placeholder="请选择" >
            <el-option
              v-for="item in tljlistdata"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="负责人" v-if="form.id">
          <el-select v-model="form.uid" placeholder="请选择" disabled>
            <el-option
              v-for="item in RAILWAYSlistdata"
              :key="item.id"
              :label="item.nickname"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Railwayline",
  data() {
    return {
      tableData: [],
      listdata: [],
      stationlistdata:[],
      tljlistdata:[],
      RAILWAYSlistdata:[],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  // 钩子函数 页面渲染后加载
  created() {
    this.load()
    this.stationlist()
    this.tljList()
    this.RAILWAYSlistdatalist()
  },
  // 方法
  methods: {
      // 获取所有的数据
      RAILWAYSlistdatalist() {
      this.request.get("/user", {
        params: {
          role: 'ROLE_RAILWAYS',
        }
      }).then(res => {
        this.RAILWAYSlistdata = res.data
      })
    },
    // 获取所有的数据
    stationlist() {
      this.request.get("/station").then(res => {
        this.stationlistdata = res.data
      })
    },

    // 获取所有的数据
    tljList() {
      this.request.get("/tlj").then(res => {
        this.tljlistdata = res.data
      })
    },
    // 获取所有的数据
    list() {
      this.request.get("/railwayline").then(res => {
        this.listdata = res.data
      })
    },
    // 分页查询数据
    load() {
      this.request.get("/railwayline/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },

    // 新增或者更新数据  当id为空新增，id不为空更新
    save() {
      this.request.post("/railwayline/", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    // 新增按钮点击事件 打开弹出框
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
      })
    },
    // 编辑按钮点击事件 打开弹出框
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
    },
    // 根据id删除一行数据
    del(id) {
      this.request.delete("/railwayline/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    // 批量删除
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/railwayline/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open("http://localhost:9090/railwayline/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
