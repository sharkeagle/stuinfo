<template>
  <div style="font-size: larger;background-image: linear-gradient(to top left,#ffa118,blanchedalmond);height: 100vh">
    <div>
      <el-tag color="white" style="margin-left: 45%;font-size: larger;">教师页面</el-tag>
      <el-button type="warning" style="margin-left: 60vh" @click="dislogin">退出登录</el-button>
    </div>
    <div style="border-radius:10px;background-color:#eeeeee;width: 100%;font-size: large;margin-top: 5vh">
      <el-descriptions title="用户信息："  label-style="height:10%;" size="medium" border>
        <el-descriptions-item label="用户名：" >{{user.name}}</el-descriptions-item>
        <el-descriptions-item label="id：">{{user.id}}</el-descriptions-item>
        <el-descriptions-item label="所属系：" >{{user.spename}}</el-descriptions-item>
      </el-descriptions>
    </div>
    <div style="margin-top: 50px;background-color: blanchedalmond;border-radius: 2vh">
      <span>任教课程信息(双击行可显示具体学生信息)</span>
      <el-table :data="tableData" border:2px @row-dblclick="handd" >
        <el-table-column prop="id" label="id" width="140">
        </el-table-column>
        <el-table-column prop="kcid" label="课程编号">
        </el-table-column>
        <el-table-column prop="name" label="课程名">
        </el-table-column>
        <el-table-column prop="numstu" label="学生人数">
        </el-table-column>
      </el-table>
      <div>
        <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="pageNum"
            :page-sizes="[5, 10, 40]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total">
        </el-pagination>
      </div>
      </div>
    <div style="margin-top: 50px;background-color: blanchedalmond;border-radius: 2vh;width: 100%;position: relative" v-show="hand" >
      <span>课程{{kcname}}学生信息</span>
      <el-button circle size=mini type="danger" icon="el-icon-circle-close" @click="hand=false" style='position: absolute;right:10px;top:0px;'></el-button>
      <el-table :data="tableDatastu" style="margin-top: 20px" >
        <el-table-column prop="id" label="id" width="140"  >
        </el-table-column>
        <el-table-column prop="sname" label="姓名" width="120">
        </el-table-column>
        <el-table-column prop="kid" label="课程编号">
        </el-table-column>
        <el-table-column prop="kname" label="课程名">
        </el-table-column>
        <el-table-column prop="grade" label="成绩">
        </el-table-column>
      </el-table>
      <div>
        <el-pagination
            @size-change="handleSizeChangestu"
            @current-change="handleCurrentChangestu"
            :current-page="pageNumstu"
            :page-sizes="[5, 10, 40]"
            :page-size="pageSizestu"
            layout="total, sizes, prev, pager, next, jumper"
            :total="totalstu">
        </el-pagination>
      </div>
    </div>
  </div>
</template>
<style>
.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
</style>
<script>

import request from "@/utils/request";
import Aside from "@/components/Aside.vue";
export default {
  name: 'tea',
  data() {
    return {
      handid:'',
      hand:false,
      kcname:'',
      user:{
        id:'',
        name:'',
        spename:''
      },
      tableData: [],
      tableDatastu: [],
      isColl:false,
      wp:200,
      c1:"el-icon-s-fold",
      total:0,
      totalstu:0,
      pageSize:5,
      pageNum:1,
      pageSizestu:5,
      pageNumstu:1,
      dialogVisible: false,
      form:{
        id:null,
        name:null,
        pass:null
      }
    }
  },
  created() {
    if(window.sessionStorage.getItem("teaID")) {
      request.get("http://localhost:9090/tea/mes?id="+window.sessionStorage.getItem("teaID")).then(res => {
        if(res!==null){
          this.user.id = res.id;
          this.user.name = res.name;
          this.user.spename=res.spename;
          this.load();
        }
        else{
          this.$message.error("不存在");
        }
      })
    }
    else{
      this.$message.error("用户未登录");
      this.$router.push("/Login");
    }
  },
  destroyed() {
    window.sessionStorage.clear();
  },
  methods: {
    handd(row,event,column){
      this.handid=row.kcid
      this.loadstu();
      this.kcname=row.name
      this.hand=true;

    },
    dislogin(){
      window.sessionStorage.clear();
      this.$router.push('/login')
    },
    load() {
      request.get("http://localhost:9090/tea/page?pageNum="+this.pageNum+"&pageSize="+this.pageSize+"&id="+this.user.id).then(res => {
        this.tableData = res.data
        this.total=res.total
      })
    },
    loadstu(){
      request.get("http://localhost:9090/tea/viewF?pageNum="+this.pageNumstu+"&pageSize="+this.pageSizestu+"&kid="+this.handid).then(res=>{
        this.tableDatastu=res.data
        this.totalstu=res.total
      })
    },
    handleSizeChange(pageSize){
      this.pageSize=pageSize
      this.load()
    },
    handleCurrentChange(pageNum){
      this.pageNum=pageNum
      this.load()
    },
    handleSizeChangestu(pageSize){
      this.pageSizestu=pageSize
      this.loadstu()
    },
    handleCurrentChangestu(pageNum){
      this.pageNumstu=pageNum
      this.loadstu()
    },
  }
}
</script>
