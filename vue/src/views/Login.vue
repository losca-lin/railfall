<template>
  <div class="wrapper">
    <div style="margin: 100px auto; background-color: #fff; width: 450px; height: 400px; padding: 20px; border-radius: 10px">
      <div style="margin: 20px 0; text-align: center; font-size: 24px"><b>登 录</b></div>
      <el-form :model="user" :rules="rules" ref="userForm">
        <el-form-item prop="username">
          <el-input size="medium" prefix-icon="el-icon-user" v-model="user.username" placeholder="请输入账号"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input size="medium" prefix-icon="el-icon-lock" show-password v-model="user.password" placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item>
          <div style="display: flex">
            <el-input size="mid" prefix-icon="el-icon-s-opportunity" v-model="code" style="width: 200px" placeholder="请输入验证码"></el-input>
            <span @click="refreshCode" style="cursor: pointer; flex: 1;">
              <Identify :identifyCode="identifyCode"></Identify>
            </span>
          </div>
        </el-form-item>
        <el-form-item label="用户类型:">
          <el-radio v-model="user.role" label="ROLE_USER">工务段用户</el-radio>
          <el-radio v-model="user.role" label="ROLE_RAILWAYS">铁路局用户</el-radio>
          <el-radio v-model="user.role" label="ROLE_ADMIN">管理员</el-radio>
        </el-form-item>
        <el-form-item style="margin: 10px 0; text-align: right">
          <el-button type="warning" size="small"  autocomplete="off" @click="$router.push('/register')">注册</el-button>
          <el-button type="primary" size="small"  autocomplete="off" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import {setRoutes} from "@/router";
import Identify from "@/views/Identify";
export default {
  name: "Login",
  data() {
    return {
      user: {},
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],


      },
      code: '',
      identifyCode: '',
      // 验证码规则
      identifyCodes: '3456789ABCDEFGHGKMNPQRSTUVWXY'
    }
  },
    components: {Identify},
    mounted() {

    this.refreshCode()
  },
  methods: {
     // 切换验证码
    refreshCode() {
      this.identifyCode = ''
      this.makeCode(this.identifyCodes, 4)
    },
    // 生成随机验证码
    makeCode(o, l) {
      for (let i = 0; i < l; i++) {
        this.identifyCode += this.identifyCodes[Math.floor(Math.random() * this.identifyCodes.length)]
      }
    },
    login() {
      if (this.code !== this.identifyCode.toLowerCase()) {
        this.$message({
          type: "error",
          message: "验证码错误"
        })
        return;
      }
      if (!this.user.role) {
        this.$message({
          type: "error",
          message: "请选择用户类型"
        })
        return;
      }
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          this.request.post("/user/login", this.user).then(res => {
            if(res.code === '200') {
              localStorage.setItem("user", JSON.stringify(res.data))  // 存储用户信息到浏览器
              localStorage.setItem("menus", JSON.stringify(res.data.menus))  // 存储用户信息到浏览器

              // 动态设置当前用户的路由
              setRoutes()
              this.$router.push("/")
              this.$message.success("登录成功")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    }
  }
}
</script>

<style>
  .wrapper {
    height: 100vh;
    background-image: url(../assets/2.jpg);

    overflow: hidden;
    position:fixed;
    top: 0;
    left: 0;
    width:100%;
    height:100%;
    min-width: 1000px;
    z-index:-10;
    zoom: 1;
    background-color: #fff;
    background-repeat: no-repeat;
    background-size: cover;
    -webkit-background-size: cover;
    -o-background-size: cover;
    background-position: center 0;
  }
</style>
