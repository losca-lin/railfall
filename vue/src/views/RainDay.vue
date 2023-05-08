<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
<!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>-->
<!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>-->
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
 <!--     <el-popconfirm
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
      <el-upload action="http://localhost:9090/rainDay/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55"></el-table-column>-->
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
      <el-table-column prop="gid" label="工务段id"></el-table-column>
      <el-table-column prop="lid" label="铁路线id"></el-table-column>
      <el-table-column prop="dayRain" label="日总雨量"></el-table-column>
      <el-table-column prop="r10minMaxTime" label="十分钟雨量最大时刻"></el-table-column>
      <el-table-column prop="r10minMax" label="十分钟最大雨量"></el-table-column>
      <el-table-column prop="r1hourMaxTime" label="1小时雨量最大时刻"></el-table-column>
      <el-table-column prop="1hourMaxr" label="1小时最大雨量"></el-table-column>
      <el-table-column prop="r1hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r2hour" label="下面同上，我就不改了"></el-table-column>
      <el-table-column prop="r3hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r4hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r5hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r6hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r7hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r8hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r9hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r10hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r11hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r12hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r13hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r14hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r15hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r16hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r17hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r18hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r19hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r20hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r21hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r22hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r23hour" label="0点到1点雨量"></el-table-column>
      <el-table-column prop="r24hour" label="0点到1点雨量"></el-table-column>

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
      <el-form label-width="120px" size="small">
        <el-form-item label="工务段id">
          <el-input v-model="form.gid" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="铁路线id">
          <el-input v-model="form.lid" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="日总雨量">
          <el-input v-model="form.dayRain" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="十分钟雨量最大时刻">
          <el-date-picker v-model="form.r10minMaxTime" type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="十分钟最大雨量">
          <el-input v-model="form.r10minMax" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1小时雨量最大时刻">
          <el-date-picker v-model="form.r1hourMaxTime" type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="1小时最大雨量">
          <el-input v-model="form.1hourMaxr" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r1hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="下面同上，我就不改了">
          <el-input v-model="form.r2hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r3hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r4hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r5hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r6hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r7hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r8hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r9hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r10hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r11hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r12hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r13hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r14hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r15hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r16hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r17hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r18hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r19hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r20hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r21hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r22hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r23hour" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="0点到1点雨量">
          <el-input v-model="form.r24hour" autocomplete="off"></el-input>
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
  name: "RainDay",
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
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  // 钩子函数 页面渲染后加载
  created() {
    this.load()
  },
  // 方法
  methods: {
    // 获取所有的数据 
    list() {
      this.request.get("/rainDay").then(res => {
        this.listdata = res.data
      })
    },
    // 分页查询数据
    load() {
      this.request.get("/rainDay/page", {
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
      this.request.post("/rainDay", this.form).then(res => {
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
      this.request.delete("/rainDay/" + id).then(res => {
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
      this.request.post("/rainDay/del/batch", ids).then(res => {
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
      window.open("http://localhost:9090/rainDay/export")
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
