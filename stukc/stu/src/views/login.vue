<template>
  <div class="wrapper">
  <div style="margin-left:35%;margin-top:20%;background-color: azure;width: 30%;height: 30%;border-radius: 20px;padding: 20px">
    <div style="text-align: center;">登录</div>
    <el-input v-model="user.id" prefix-icon="el-icon-user" style="background-color: bisque"></el-input>
    <el-input v-model="user.password" prefix-icon="el-icon-lock" style="margin-top: 10px" show-password></el-input>
    <el-select v-model="user.zhiye" placeholder="职称" style="margin-top: 10px;width: 100%">
      <el-option label="学生" value="stu"></el-option>
      <el-option label="教师" value="tea"></el-option>
      <el-option label="管理员" value="adm"></el-option>
    </el-select>
    <el-button type="primary" style="margin-top: 30px;margin-left: 35%;border-radius: 10%;width: 30%;height: 30%" @click="login">登录</el-button>
  </div>

  </div>
</template>
<style>
  .wrapper{
    height: 100vh;
    background-image: linear-gradient(to bottom right,#B3C0D1,#42b983);
    overflow: hidden;
  }
</style>
<script>
export default {
  name:"login",
  data(){
    return{
      user:{
        id:'',
        password:"",
        zhiye:""
      }
    }
  },
  methods:{
    login(){
      if(this.user.zhiye==="adm"){
        this.request.post("http://localhost:9090/user/login", this.user).then(res => {
          if (res) {
            window.sessionStorage.setItem("token1",res);
            window.sessionStorage.setItem("admID",this.user.id);
            this.$router.push("/")
          } else {
            this.$message.error("错误，不存在此管理员")
          }
        })
      }
      else if(this.user.zhiye==="stu"){
        this.request.post("http://localhost:9090/stu/login", this.user).then(res => {
          if (res) {
            window.sessionStorage.setItem("token2",res);
            window.sessionStorage.setItem("stuID",this.user.id);
            this.$router.push("/stu")
          } else {
            this.$message.error("错误，错误，不存在此学生")
          }
        })
      }
      else if(this.user.zhiye==="tea"){
        this.request.post("http://localhost:9090/tea/login", this.user).then(res => {
          if (res) {
            window.sessionStorage.setItem("token3",res)
            window.sessionStorage.setItem("teaID",this.user.id);
            this.$router.push("/tea")
          } else {
            this.$message.error("错误，不存在此教师")
          }
        })
      }
      else {
        this.$message.error("错误,不存在此用户")
      }
    }
  }
}
</script>