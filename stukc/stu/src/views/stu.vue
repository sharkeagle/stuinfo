<template>
  <div style="height:100vh;width:100%;background-image: linear-gradient(to bottom right,#B3C0D1,#42b983) ;overflow: scroll;font-family: 黑体">
        <el-header style="border-radius: 20px">
          <div style="width: 40%;margin-left: 40%;font-size: large;">学生页面</div>
        </el-header>
        <el-main>
          <div style="background: cadetblue;border-radius: 5px;padding: 5px;margin-top: 5%">
          <el-button round type="primary" @click="dislogin" >退出登录</el-button>
          <el-button round type="primary" @click="showxc=~showxc">选课</el-button>
          <el-button round type="primary" @click="dialogVisible=true">查询学分</el-button>
          </div>
          <div style="border-radius:5px;background-color: darkgray">
            <el-descriptions title="用户信息" style="border-radius: 5px">
              <el-descriptions-item label="用户名">{{user.name}}</el-descriptions-item>
              <el-descriptions-item label="id">{{user.id}}</el-descriptions-item>
              <el-descriptions-item label="居住地">{{user.address}}</el-descriptions-item>
            </el-descriptions>
          </div>
          <el-collapse-transition>
          <div>
            <el-dialog
                title="提示"
                :visible.sync="dialogVisible"
                width="30%"
                :before-close="handleClose">
              <el-form  class="el-form--inline" label-position="right" label-width="100px">
                <el-form-item label="学年">
                  <el-input v-model="form.yD"></el-input>
                </el-form-item>
                <el-select v-model="form.yE" placeholder="学期" style="margin-top: 10px;width: 100%">
                  <el-option label="上学期" value=0></el-option>
                  <el-option label="下学期" value=1></el-option>
                </el-select>
              </el-form>
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="selc">确 定</el-button>
              </span></el-dialog>
          </div>
          </el-collapse-transition>
          <div>
          <span>已选课程信息</span>
          <el-table :data="tableData" >
            <el-table-column prop="id" label="id" width="140">
            </el-table-column>
            <el-table-column prop="sname" label="姓名" width="120">
            </el-table-column>
            <el-table-column prop="kid" label="课程编号">
            </el-table-column>
            <el-table-column prop="kname" label="课程名">
            </el-table-column>
            <el-table-column prop="grade" label="成绩">
          </el-table-column>
            <el-table-column prop="tname" label="任课老师">
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
            </el-pagination> </div>
          <el-collapse-transition>
          <div style="padding-top: 60px" v-show="showxc">
          <span v-show="showxc">选课登记</span>
          <el-table :data="tableDatak" v-show="showxc">
            <el-table-column prop="id" label="课程编号" width="140">
            </el-table-column>
            <el-table-column prop="name" label="课程名" width="120">
            </el-table-column>
            <el-table-column prop="yearD" label="课程学年">
            </el-table-column>
            <el-table-column prop="yearE" label="学期0:上学期，1下学期">
            </el-table-column>
            <el-table-column prop="teaId" label="老师编号">
            </el-table-column>
            <el-table-column prop="xuef" label="学分">
            </el-table-column>
            <el-table-column prop="tname" label="任课老师">
            </el-table-column>
            <el-table-column >
              <template v-slot="scope">
                <el-button type="primary" @click="Edit(scope.row)">选课</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div v-show="showxc">
            <el-pagination
                @size-change="handleSizeChangek"
                @current-change="handleCurrentChangek"
                :current-page="pageNumk"
                :page-sizes="[5, 10, 40]"
                :page-size="pageSizek"
                layout="total, sizes, prev, pager, next, jumper"
                :total="totalk">
            </el-pagination> </div>
          </div>
          </el-collapse-transition>
          </div>
        </el-main>
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
export default {
  name: 'Manage',
  data() {
    return {
      flowers:["海棠","桂花"],
      tableData: [],
      tableDatak: [],
      isColl:false,
      wp:200,
      c1:"el-icon-s-fold",
      total:0,
      totalk:0,
      pageSize:5,
      pageSizek:5,
      pageNum:1,
      pageNumk:1,
      dialogVisible: false,
      grade1:0.,
      showxc:false,
      form:{
        id:'',
        yD:'',
        yE:''
      },
      formxsxk:{
        stuid:'',
        kcid:'',
        grade:''
      },
      user:{
        id:null,
        name:null,
        address:null
      }
    }
  },
  created() {
    if(window.sessionStorage.getItem("stuID")) {
      request.get("http://localhost:9090/stu/mes?id="+window.sessionStorage.getItem("stuID")).then(res => {
          if(res!==null){
            this.user.id = res.id;
            this.user.name = res.name;
            this.user.address=res.address;
            this.loadstu();
            this.loadk();
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
  destroyed(){
    window.sessionStorage.clear();
  },
  methods: {
    dislogin(){
      window.sessionStorage.clear();
      this.$router.push('/login')
    },
    Edit(row){
      this.formxsxk.stuid=this.user.id;
      this.formxsxk.kcid=row.id;
      this.formxsxk.grade=null;
      request.post("http://localhost:9090/stu/insrY",this.formxsxk).then(res=>{
        if(res){
          this.loadstu();
          this.$alert("选课成功");
        }
        else{
          this.$alert("选课失败");
        }
      })
    },
    handleSizeChange(pageSize){
      this.pageSize=pageSize
      this.loadstu()
    },
    handleCurrentChange(pageNum){
      this.pageNum=pageNum
      this.loadstu()
    },
    handleSizeChangek(pageSize){
      this.pageSizek=pageSize
      this.loadk()
    },
    handleCurrentChangek(pageNum){
      this.pageNumk=pageNum
      this.loadk()
    },
    loadstu(){
      request.get("http://localhost:9090/stu/viewF?pageNum="+this.pageNum+"&pageSize="+this.pageSize+"&id="+this.user.id).then(res=>{
        this.tableData=res.data
        this.total=res.total
      })
    },
    loadk(){
      request.get("http://localhost:9090/stu/viewK?pageNum="+this.pageNumk+"&pageSize="+this.pageSizek).then(res=>{
        this.tableDatak=res.data
        this.totalk=res.total
      })
    },
    selc(){
      request.get("http://localhost:9090/stu/grade?sID="+this.user.id+"&yD="+this.form.yD+"&yE="+this.form.yE).then(res => {
        if(res)this.grade1=res;
        else this.grade1=0.;
        this.$alert("总学分是"+this.grade1);
      })
      this.grade1=0.;
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
    }
  ,
  }
}
</script>
