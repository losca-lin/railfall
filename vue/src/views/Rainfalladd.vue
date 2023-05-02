<template>
  <div style="width:50%">
    <el-form label-width="150px" size="small"  >
        <el-form-item label="车站id">
          <el-select v-model="form.sid" placeholder="请选择">
            <el-option
              v-for="item in stationlistdata"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="采集时间">
          <el-date-picker v-model="form.time" type="datetime" value-format="yyyy-MM-dd HH" placeholder="选择日期时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="累计雨量(mm)">
          <el-input v-model="form.rainfallTital" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="水位(m)">
          <el-input v-model="form.water" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="雨量级别">
          <el-select v-model="form.rainfallRank" placeholder="请选择" style="margin-right: 10px;width: 130px">
                <el-option  value="大雨"></el-option>
                <el-option  value="中雨"></el-option>
                <el-option  value="小雨"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="气温度数（摄氏度）">
          <el-input v-model="form.temperature" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer"  style="padding:10px 100px;">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
  </div>
</template>

<script>
export default {
  name: "Rainfall",
  data() {
    return {
      tableData: [],
      listdata: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      stationlistdata:[],
    }
  },
  // 钩子函数 页面渲染后加载
  created() {
    this.load()
    this.stationlist()
  },
  // 方法
  methods: {
    // 获取车站所有的数据 
    stationlist() {
      this.request.get("/station").then(res => {
        this.stationlistdata = res.data
      })
    },
    // 获取所有的数据 
    list() {
      this.request.get("/rainfall").then(res => {
        this.listdata = res.data
      })
    },
    // 分页查询数据
    load() {
      this.request.get("/rainfall/page", {
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
      if(!this.form.sid){
        this.$message.error("请选择车站信息")
        return;
      }
      if(!this.form.time){
        this.$message.error("请选择时间")
        return;
      }
      this.form.time=this.form.time+':00'
      console.log(this.form.time)
      this.request.post("/rainfall", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
          this.form={}
        } else {
          this.$message.error(res.msg)
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
      this.request.delete("/rainfall/" + id).then(res => {
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
      this.request.post("/rainfall/del/batch", ids).then(res => {
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
      window.open("http://localhost:9090/rainfall/export")
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
