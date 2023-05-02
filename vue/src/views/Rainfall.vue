<template>
  <div>
    <div style="margin: 10px 0">
      <el-select v-model="name" placeholder="请选择">
            <el-option
              v-for="item in stationlistdata"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>
    <div style="margin: 10px 0">
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
      <el-table-column prop="sid" label="铁路点">
        <template #default="scope">
            {{scope.row.station.name}}
        </template>
      </el-table-column>
      <el-table-column prop="sid" label="上传用户">
        <template #default="scope">
            {{scope.row.user.nickname}}
        </template>
      </el-table-column>
      <el-table-column prop="time" label="采集时间"></el-table-column>
      <el-table-column prop="rainfallTital" label="降雨量(mm)"></el-table-column>
      <el-table-column prop="water" label="湿度(m)"></el-table-column>
      <el-table-column prop="temperature" label="温度（摄氏度）"></el-table-column>

      <el-table-column label="操作"  width="200" align="center">
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
      <el-form label-width="120px" size="small" >
        <el-form-item label="铁路点" >
          <el-select v-model="form.sid" placeholder="请选择" :disabled="form.id ? true : false">
            <el-option
              v-for="item in stationlistdata"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="采集时间" >
          <el-date-picker v-model="form.time" type="datetime" 
          value-format="yyyy-MM-dd HH" placeholder="选择日期时间" :disabled="form.id ? true : false"></el-date-picker>
        </el-form-item>
        <el-form-item label="降雨量(mm)">
          <el-input v-model="form.rainfallTital" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="湿度">
          <el-input v-model="form.water" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="温度（摄氏度）">
          <el-input v-model="form.temperature" autocomplete="off"></el-input>
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
