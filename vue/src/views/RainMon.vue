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
      <el-upload action="http://localhost:9090/rainMon/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55"></el-table-column>-->
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
      <el-table-column prop="gid" label="工务段id"></el-table-column>
      <el-table-column prop="lid" label="铁路线id"></el-table-column>
      <el-table-column prop="dayMon" label="月总雨量"></el-table-column>
      <el-table-column prop="r1day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r2day" label="下面同理我就不写了"></el-table-column>
      <el-table-column prop="r3day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r4day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r5day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r6day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r7day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r8day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r9day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r10day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r11day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r12day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r13day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r14day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r15day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r16day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r17day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r18day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r19day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r20day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r21day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r22day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r23day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r24day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r25day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r26day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r27day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r28day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r29day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r30day" label="1号总雨量"></el-table-column>
      <el-table-column prop="r31day" label="1号总雨量"></el-table-column>

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
        <el-form-item label="月总雨量">
          <el-input v-model="form.dayMon" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r1day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="下面同理我就不写了">
          <el-input v-model="form.r2day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r3day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r4day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r5day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r6day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r7day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r8day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r9day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r10day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r11day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r12day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r13day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r14day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r15day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r16day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r17day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r18day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r19day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r20day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r21day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r22day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r23day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r24day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r25day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r26day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r27day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r28day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r29day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r30day" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="1号总雨量">
          <el-input v-model="form.r31day" autocomplete="off"></el-input>
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
  name: "RainMon",
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
      this.request.get("/rainMon").then(res => {
        this.listdata = res.data
      })
    },
    // 分页查询数据
    load() {
      this.request.get("/rainMon/page", {
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
      this.request.post("/rainMon", this.form).then(res => {
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
      this.request.delete("/rainMon/" + id).then(res => {
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
      this.request.post("/rainMon/del/batch", ids).then(res => {
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
      window.open("http://localhost:9090/rainMon/export")
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
