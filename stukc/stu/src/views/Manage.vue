<template>

  <div style="background-image:linear-gradient(to bottom left,burlywood,beige);;height: 1000px;width: 100%">

    <el-container style="height: 100%; border: 1px solid #eee;font-size:20px;font-family: 仿宋;box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)">
      <el-backtop target=".page-component__scroll .el-scrollbar__wrap"></el-backtop>
      <el-aside :width="wp+'px'"  style="background-color: bisque;height:100%">
          <el-menu
                    :collapse="isColl">
            <div style="border-radius: 10px;background-color: burlywood">
            <el-button plain round class="el-daohan" @click="viewstu=~viewstu" >学生管理</el-button><p/>
            <el-button plain round class="el-daohan" @click="viewtea=~viewtea">老师管理</el-button><p/>
            <el-button plain round class="el-daohan" @click="viewxsxk=~viewxsxk">学生选课管理</el-button><p/>
            <el-button plain round class="el-daohan"  @click="viewkc=~viewkc">课程管理</el-button><p/>
              <el-button plain round class="el-daohan"  @click="viewspe=~viewspe">系管理</el-button><p/>
              <el-button plain round class="el-daohan"  @click="viewfac=~viewfac">专业管理</el-button><p/>
            </div>
            <div style="border-radius: 10px;background-color: burlywood">
            <el-button round type="primary" @click="backup" style="margin-left: 10%">备份</el-button>
            <el-button round type="primary" @click="recovery" style="margin-left: 20%">恢复</el-button>
            </div>
          </el-menu>

      </el-aside>
      <el-container>
        <el-header style="display: flex;background-color:burlywood;border-radius: 10px" >
          <div style="flex: min-content">
            <span :class="c1" style="cursor: pointer" @click="isCo">
            </span>
          </div>
          <i style="font-size: large;font-style: italic;flex: max-content">loveevol</i>
          <el-dropdown style="cursor: pointer"  @command="handleCommand">
           <span class="el-dropdown-link">
   <i class="el-icon-arrow-down el-icon--right"> 个人</i>
  </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="a">个人信息</el-dropdown-item>
              <el-dropdown-item command="d">退出登录</el-dropdown-item>
              <el-dropdown-item command="stu">学生信息管理</el-dropdown-item>
              <el-dropdown-item command="tea">老师</el-dropdown-item>
              <el-dropdown-item command="spe">系</el-dropdown-item>
              <el-dropdown-item command="fac">专业</el-dropdown-item>
              <el-dropdown-item command="xsxk">学生选课</el-dropdown-item>
              <el-dropdown-item command="kc">课程</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </el-header>

        <el-main>
          <el-breadcrumb separator="/">
            <el-breadcrumb-item  >首页</el-breadcrumb-item>
            <el-breadcrumb-item>管理</el-breadcrumb-item>
          </el-breadcrumb>

          <div>
            <el-dialog
                title="提示"
                :visible.sync="dialogVisible"
                width="30%"
                :before-close="handleClose">
              <el-form  class="el-form--inline" label-position="right" label-width="100px">
                <el-form-item label="id">
                  <el-input v-model="form.id"></el-input>
                </el-form-item>
                <el-form-item label="姓名">
                  <el-input v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                  <el-input v-model="form.password"></el-input>
                </el-form-item>
              </el-form>
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="save">确 定</el-button>
      </span>
            </el-dialog>
          </div>
<!--学生管理-->
          <transition name="el-zoom-in-center">
          <div v-show="viewstu" style="background-image: linear-gradient(30deg, #ffa118 0 50%, gray 50% 100%);border-radius: 10px;">
            <span style="margin-left: 2%;margin-top: 5%">学生管理</span><p/>
            <el-dialog
                title="提示"
                :visible.sync="dialogVisiblestu"
                width="30%"
                :before-close="handleClose">
              <el-form  class="el-form--inline" label-position="right" label-width="100px">
                <el-form-item label="id">
                  <el-input v-model="formstu.id"></el-input>
                </el-form-item>
                <el-form-item label="姓名">
                  <el-input v-model="formstu.name"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                  <el-input v-model="formstu.password"></el-input>
                </el-form-item>
                <el-form-item label="地址">
                  <el-input v-model="formstu.address"></el-input>
                </el-form-item>
                <el-form-item label="年龄">
                  <el-input v-model="formstu.age"></el-input>
                </el-form-item>
                <el-form-item label="性别">
                  <el-input v-model="formstu.sex"></el-input>
                </el-form-item>
                <el-form-item label="所属专业id">
                  <el-input v-model="formstu.facid"></el-input>
                </el-form-item>
              </el-form>
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblestu = false">取 消</el-button>
      <el-button type="primary" @click="savestu">确 定</el-button>

      </span>
            </el-dialog>
            <el-dialog
                title="确定删除"
                :visible.sync="dialogVisiblestudel"
                width="30%"
                :before-close="handleClose">
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblestudel = false">取 消</el-button>
      <el-button type="primary" @click="realdelstu(id)">确 定</el-button>

      </span>
            </el-dialog>

            <div  style="background: cadetblue;border-radius: 5px;padding: 5px">
              <el-input  v-model="input" style="width: 150px" suffix-icon="el-icon-search" placeholder="请输入id"></el-input>
              <el-button  type="primary" @click="loadstuid" class="el-b" icon="el-icon-search">搜索</el-button>
              <el-button  type="primary" @click="loadstu" class="el-b">返回</el-button>
              <el-button type="primary" @click="dialogVisiblestu = true"  class="el-b">新添</el-button>
            </div>
          <el-table :data="tableDatastu"
                    border
                    height="600"
                    
                    style="font-size: medium"
          >
            <el-table-column prop="id" label="id" width="140"
            >
            </el-table-column>
            <el-table-column prop="name" label="姓名" width="120" >
            </el-table-column>
            <el-table-column prop="password" label="密码">
            </el-table-column>
            <el-table-column prop="address" label="地址">
            </el-table-column>
            <el-table-column label="年龄" prop="age">
            </el-table-column>
            <el-table-column label="性别" prop="sex">
            </el-table-column>
            <el-table-column label="所属专业id" prop="facid">

            </el-table-column>
            <el-table-column >
              <template v-slot="scope">
                <el-button round type="primary" @click="Editstu(scope.row)">编辑</el-button>
                <el-button round type="danger" @click="delstu(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div>
            <el-pagination 
                @size-change="handleSizeChangestu"
                @current-change="handleCurrentChangestu"
                :current-page="pageNumstu"
                :page-sizes="[2, 5, 10, 40]"
                :page-size="pageSizestu"
                layout="total, sizes, prev, pager, next, jumper"
                :total="totalstu">
            </el-pagination>
         </div>
          </div>
          </transition>

          <!--课程管理-->
          <transition name="el-fade-in-linear">
          <div v-show="viewkc">
            <span >课程管理</span><p/>
            <el-dialog
                title="提示"
                :visible.sync="dialogVisiblekc"
                width="30%"
                :before-close="handleClose">
              <el-form  class="el-form--inline" label-position="right" label-width="100px">
                <el-form-item label="id">
                  <el-input v-model="formkc.id"></el-input>
                </el-form-item>
                <el-form-item label="姓名">
                  <el-input v-model="formkc.name"></el-input>
                </el-form-item>
                <el-form-item label="老师id">
                  <el-input v-model="formkc.teaId"></el-input>
                </el-form-item>
                <el-form-item label="学分">
                  <el-input v-model="formkc.xuef"></el-input>
                </el-form-item>
                <el-form-item label="学年">
                  <el-input v-model="formkc.yearD"></el-input>
                </el-form-item>
                <el-form-item label="学期0上1下">
                  <el-input v-model="formkc.yearE"></el-input>
                </el-form-item>
                <el-form-item label="所属系id">
                  <el-input v-model="formkc.speid"></el-input>
                </el-form-item>
              </el-form>
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblekc = false">取 消</el-button>
      <el-button type="primary" @click="savekc">确 定</el-button>

      </span>
            </el-dialog>
            <el-dialog
                title="确定删除"
                :visible.sync="dialogVisiblekcdel"
                width="30%"
                :before-close="handleClose">
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblekcdel = false">取 消</el-button>
      <el-button type="primary" @click="realdelkc(id)">确 定</el-button>

      </span>
            </el-dialog>

            <div  style="background: cadetblue;border-radius: 5px;padding: 5px">
              <el-input  v-model="input" style="width: 150px" suffix-icon="el-icon-search" placeholder="请输入id"></el-input>
              <el-button  type="primary" @click="loadkcid" class="el-b" icon="el-icon-search">搜索</el-button>
              <el-button  type="primary" @click="loadkc" class="el-b">返回</el-button>
              <el-button type="primary" @click="dialogVisiblekc = true"  class="el-b">新添</el-button>
              <el-button type="primary" @click="load2006"  class="el-b">2006选课人数为0</el-button>
            </div>

          <el-table :data="tableDatakc"
                    border
                    height="600"
                    
                    style="font-size: medium"
          >
            <el-table-column prop="id" label="id" width="140"
            >
            </el-table-column>
            <el-table-column prop="name" label="名" width="120" >
            </el-table-column>
            <el-table-column prop="yearD" label="学年">
            </el-table-column>
            <el-table-column label="老师id" prop="teaId">
            </el-table-column>
            <el-table-column prop="yearE" label="学期0上1下">
            </el-table-column>

            <el-table-column label="学分" prop="xuef">
            </el-table-column>
            <el-table-column label="所属系id" prop="speid">
            </el-table-column>
            <el-table-column >
              <template v-slot="scope">
                <el-button round type="primary" @click="Editkc(scope.row)">编辑</el-button>
                <el-button round type="danger" @click="delkc(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div>
            <el-pagination 
                           @size-change="handleSizeChangekc"
                           @current-change="handleCurrentChangekc"
                           :current-page="pageNumkc"
                           :page-sizes="[2, 5, 10, 40]"
                           :page-size="pageSizekc"
                           layout="total, sizes, prev, pager, next, jumper"
                           :total="totalkc">
            </el-pagination>        </div>

          </div>

          </transition>


          <!--学生选课管理-->
          <transition name="el-fade-in">
          <div v-show="viewxsxk" style="border: #42b983;border-radius: 5px;">
            <span >学生选课管理</span><p/>
            <el-dialog
                title="提示"
                :visible.sync="dialogVisiblexsxk"
                width="30%"
                :before-close="handleClose">
              <el-form  class="el-form--inline" label-position="right" label-width="100px">
                <el-form-item label="学生id">
                  <el-input v-model="formxsxk.stuid"></el-input>
                </el-form-item>
                <el-form-item label="课程id">
                  <el-input v-model="formxsxk.kcid"></el-input>
                </el-form-item>
                <el-form-item label="成绩">
                  <el-input v-model="formxsxk.grade"></el-input>
                </el-form-item>
              </el-form>
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblexsxk = false">取 消</el-button>
      <el-button type="primary" @click="savexsxk">确 定</el-button>

      </span>
            </el-dialog>
            <el-dialog
                title="确定删除"
                :visible.sync="dialogVisiblexsxkdel"
                width="30%"
                :before-close="handleClose">
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblexsxkdel = false">取 消</el-button>
      <el-button type="primary" @click="realdelxsxk(id)">确 定</el-button>

      </span>
            </el-dialog>

            <div  style="background: cadetblue;border-radius: 5px;padding: 5px">
              <el-input  v-model="inputstuid" style="width: 150px" suffix-icon="el-icon-search" placeholder="请输入学生id"></el-input>
              <el-input  v-model="inputkcid" style="width: 150px" suffix-icon="el-icon-search" placeholder="请输入课程id"></el-input>
              <el-button  type="primary" @click="loadxsxkid" class="el-b" icon="el-icon-search">搜索</el-button>
              <el-button  type="primary" @click="loadxsxk" class="el-b">返回</el-button>
              <el-button type="primary" @click="dialogVisiblexsxk = true"  class="el-b">新添</el-button>
            </div>

          <el-table :data="tableDataxsxk"
                    border
                    height="600"
                    
                    style="font-size: medium"
          >
            <el-table-column prop="stuid" label="学生id" width="140"
            >
            </el-table-column>
            <el-table-column prop="kcid" label="课程id" width="120" >
            </el-table-column>
            <el-table-column prop="grade" label="成绩">
            </el-table-column>

            <el-table-column >
              <template v-slot="scope">
                <el-button round type="primary" @click="Editxsxk(scope.row)">编辑</el-button>
                <el-button round type="danger" @click="delxsxk(scope.row.stuid,scope.row.kcid)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div>
            <el-pagination 
                           @size-change="handleSizeChangexsxk"
                           @current-change="handleCurrentChangexsxk"
                           :current-page="pageNumxsxk"
                           :page-sizes="[2, 5, 10, 40]"
                           :page-size="pageSizexsxk"
                           layout="total, sizes, prev, pager, next, jumper"
                           :total="totalxsxk">
            </el-pagination>        </div>
          </div>
          </transition>

          <!--老师管理          -->

          <transition name="el-zoom-in-top">
          <div v-show="viewtea">
            <span >老师管理</span><p/>
            <el-dialog
                title="提示"
                :visible.sync="dialogVisibletea"
                width="30%"
                :before-close="handleClose">
              <el-form  class="el-form--inline" label-position="right" label-width="100px">
                <el-form-item label="id">
                  <el-input v-model="formtea.id"></el-input>
                </el-form-item>
                <el-form-item label="姓名">
                  <el-input v-model="formtea.name"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                  <el-input v-model="formtea.password"></el-input>
                </el-form-item>
                <el-form-item label="地址">
                  <el-input v-model="formtea.address"></el-input>
                </el-form-item>
                <el-form-item label="年龄">
                  <el-input v-model="formtea.age"></el-input>
                </el-form-item>
                <el-form-item label="性别">
                  <el-input v-model="formtea.sex"></el-input>
                </el-form-item>
                <el-form-item label="职称">
                  <el-input v-model="formtea.jobt"></el-input>
                </el-form-item>
                <el-form-item label="所属系id">
                  <el-input v-model="formtea.speid"></el-input>
                </el-form-item>
              </el-form>
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisibletea = false">取 消</el-button>
      <el-button type="primary" @click="savetea">确 定</el-button>

      </span>
            </el-dialog>
            <el-dialog
                title="确定删除"
                :visible.sync="dialogVisibleteadel"
                width="30%"
                :before-close="handleClose">
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisibleteadel = false">取 消</el-button>
      <el-button type="primary" @click="realdeltea(id)">确 定</el-button>
      </span>
            </el-dialog>

            <div   class="jianbian">
              <el-input  v-model="input" style="width: 200px" suffix-icon="el-icon-search" placeholder="请输入id"></el-input>

              <el-button  type="primary" @click="loadteaid">搜索</el-button>
              <el-button  type="primary" @click="loadtea">返回</el-button>
              <el-button type="primary" @click="dialogVisibletea = true" >新添</el-button>
            </div>

          <el-table :data="tableDatatea"
                    height="600"
                    
                    style="font-size: medium"
          >
            <el-table-column prop="id" label="id" width="140"
            >
            </el-table-column>
            <el-table-column prop="name" label="姓名" width="120">
            </el-table-column>
            <el-table-column prop="password" label="密码">
            </el-table-column>
            <el-table-column prop="address" label="地址">
            </el-table-column>
            <el-table-column label="年龄" prop="age">
            </el-table-column>
            <el-table-column label="性别" prop="sex">
            </el-table-column>
            <el-table-column label="职称" prop="jobt">
            </el-table-column>
            <el-table-column label="所属系id" prop="speid">
            </el-table-column>
            <el-table-column >
              <template v-slot="scope">
                <el-button type="primary" @click="Edittea(scope.row)">编辑</el-button>
                <el-button type="danger" @click="deltea(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div>
            <el-pagination 
                           @size-change="handleSizeChangetea"
                           @current-change="handleCurrentChangetea"
                           :current-page="pageNumtea"
                           :page-sizes="[2, 5, 10, 40]"
                           :page-size="pageSizetea"
                           layout="total, sizes, prev, pager, next, jumper"
                           :total="totaltea">
            </el-pagination>        </div>
          </div>
          </transition>
          
          
<!--          系管理-->



          <transition name="el-zoom-in-left">
            <div v-show="viewspe">
              <span >系管理</span><p/>
              <el-dialog
                  title="提示"
                  :visible.sync="dialogVisiblespe"
                  width="30%"
                  :before-close="handleClose">
                <el-form  class="el-form--inline" label-position="right" label-width="100px">
                  <el-form-item label="id">
                    <el-input v-model="formspe.id"></el-input>
                  </el-form-item>
                  <el-form-item label="系名">
                    <el-input v-model="formspe.name"></el-input>
                  </el-form-item>
                </el-form>
                <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblespe = false">取 消</el-button>
      <el-button type="primary" @click="savespe">确 定</el-button>

      </span>
              </el-dialog>
              <el-dialog
                  title="确定删除"
                  :visible.sync="dialogVisiblespedel"
                  width="30%"
                  :before-close="handleClose">
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblespedel = false">取 消</el-button>
      <el-button type="primary" @click="realdelspe(id)">确 定</el-button>
      </span>
              </el-dialog>

              <div   class="jianbian">
                <el-input  v-model="input" style="width: 200px" suffix-icon="el-icon-search" placeholder="请输入id"></el-input>

                <el-button  type="primary" @click="loadspeid">搜索</el-button>
                <el-button  type="primary" @click="loadspe">返回</el-button>
                <el-button type="primary" @click="dialogVisiblespe = true" >新添</el-button>
              </div>

              <el-table :data="tableDataspe"
                        height="600"

                        style="font-size: medium"
              >
                <el-table-column prop="id" label="id" width="140"
                >
                </el-table-column>
                <el-table-column prop="name" label="系名" width="120">
                </el-table-column>

                <el-table-column >
                  <template v-slot="scope">
                    <el-button type="primary" @click="Editspe(scope.row)">编辑</el-button>
                    <el-button type="danger" @click="delspe(scope.row.id)">删除</el-button>
                  </template>
                </el-table-column>
              </el-table>
              <div>
                <el-pagination
                    @size-change="handleSizeChangespe"
                    @current-change="handleCurrentChangespe"
                    :current-page="pageNumspe"
                    :page-sizes="[2, 5, 10, 40]"
                    :page-size="pageSizespe"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="totalspe">
                </el-pagination>        </div>
            </div>
          </transition>

          <!--          专业管理-->



          <transition name="el-zoom-in-top">
            <div v-show="viewfac">
              <span >专业管理</span><p/>
              <el-dialog
                  title="提示"
                  :visible.sync="dialogVisiblefac"
                  width="30%"
                  :before-close="handleClose">
                <el-form  class="el-form--inline" label-position="right" label-width="100px">
                  <el-form-item label="id">
                    <el-input v-model="formfac.id"></el-input>
                  </el-form-item>
                  <el-form-item label="专业名">
                    <el-input v-model="formfac.name"></el-input>
                  </el-form-item>
                  <el-form-item label="所属系id">
                    <el-input v-model="formfac.speid"></el-input>
                  </el-form-item>
                </el-form>
                <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblefac = false">取 消</el-button>
      <el-button type="primary" @click="savefac">确 定</el-button>

      </span>
              </el-dialog>
              <el-dialog
                  title="确定删除"
                  :visible.sync="dialogVisiblefacdel"
                  width="30%"
                  :before-close="handleClose">
              <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisiblefacdel = false">取 消</el-button>
      <el-button type="primary" @click="realdelfac(id)">确 定</el-button>
      </span>
              </el-dialog>

              <div   class="jianbian">
                <el-input  v-model="input" style="width: 200px" suffix-icon="el-icon-search" placeholder="请输入id"></el-input>

                <el-button  type="primary" @click="loadfacid">搜索</el-button>
                <el-button  type="primary" @click="loadfac">返回</el-button>
                <el-button type="primary" @click="dialogVisiblefac = true" >新添</el-button>
              </div>

              <el-table :data="tableDatafac"
                        height="600"

                        style="font-size: medium"
              >
                <el-table-column prop="id" label="id" width="140"
                >
                </el-table-column>
                <el-table-column prop="name" label="专业名" width="120">
                </el-table-column>
                <el-table-column prop="speid" label="所属系id" width="120">
                </el-table-column>

                <el-table-column >
                  <template v-slot="scope">
                    <el-button type="primary" @click="Editfac(scope.row)">编辑</el-button>
                    <el-button type="danger" @click="delfac(scope.row.id)">删除</el-button>
                  </template>
                </el-table-column>
              </el-table>
              <div>
                <el-pagination
                    @size-change="handleSizeChangefac"
                    @current-change="handleCurrentChangefac"
                    :current-page="pageNumfac"
                    :page-sizes="[2, 5, 10, 40]"
                    :page-size="pageSizefac"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="totalfac">
                </el-pagination>        </div>
            </div>
          </transition>

     </el-main>

      </el-container>
    </el-container>
    <i style="margin-left: 30%">loveevol</i>
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
.el-b{
  border-radius: 5px;
  margin-left:10px;
  font-family: 宋体;

}
.el-daohan{
  border-radius:10px;height: 100px;width: 100% ;font-size: large;margin-top: 2px;
  background-color: cornflowerblue;
}
.jianbian{
  background-image: linear-gradient(to bottom right,burlywood,#B3C0D1);
  border-radius: 5px;padding: 5px;
}
</style>
<script>

import request from "@/utils/request";
import Aside from "@/components/Aside.vue";
export default {
  name: 'Manage',
  components:{
    Aside
  },
  data() {
    return {
      input:'',
      inputstuid:'',
      inputkcid:'',
      tableData: [],
      tableDatastu: [],
      tableDatatea: [],
      isColl:false,
      dialogVisibleteadel:false,
      wp:200,
      viewstu:false,
      search:'',
      c1:"el-icon-s-fold",
      total:0,
      totaltea:0,
      totalstu:0,
      pageSize:10,
      pageNum:1,
      pageSizestu:10,
      pageNumstu:1,
      pageSizetea:10,
      pageNumtea:1,
      dialogVisible: false,
      delidstu:'',
      dialogVisiblestu: false,
      dialogVisiblestudel: false,
      dialogVisibletea: false,
      viewtea:false,
      delidtea:'',

      viewxsxk:false,
      tableDataxsxk: [],
      totalxsxk:0,
      pageSizexsxk:10,
      pageNumxsxk:1,
      delidxsxkkc:'',
      delidxsxkstu:'',
      dialogVisiblexsxk: false,
      dialogVisiblexsxkdel: false,
      formxsxk:{
        stuid:'' ,
        kcid:'',
        grade:''
      },

      viewkc:false,
      tableDatakc: [],
      totalkc:0,
      pageSizekc:10,
      pageNumkc:1,
      delidkc:'',
      dialogVisiblekc: false,
      dialogVisiblekcdel: false,
      formkc:{
        id:'' ,
        name:'',
        yearD:'',
        yearE:'',
        teaId:'',
        xuef:'',
        speid:null
      },
      
      viewspe:false,
      tableDataspe: [],
      totalspe:0,
      pageSizespe:10,
      pageNumspe:1,
      delidspe:'',
      dialogVisiblespe: false,
      dialogVisiblespedel: false,
      formspe:{
        id:'' ,
        name:''
      },

      viewfac:false,
      tableDatafac: [],
      totalfac:0,
      pageSizefac:10,
      pageNumfac:1,
      delidfac:'',
      dialogVisiblefac: false,
      dialogVisiblefacdel: false,
      formfac:{
        id:'' ,
        name:'',
        speid:''
      },


      form:{
        id:null,
        name:null,
        password:null
      },
      formstu:{
        id:null,
        name:null,
        password:null,
        address:'',
        age:'',
        sex:'',
        facid:null
      },
      formtea:{
        id:null,
        name:null,
        password:null,
        address:'',
        age:'',
        sex:'',
        speid:'',
        jobt:''
      },
      user:{
        id:null,
        name:null,
      }
    }
  },
  created() {
    if(window.sessionStorage.getItem("admID")){
      request.get("http://localhost:9090/user/mes?id="+window.sessionStorage.getItem("admID")).then(res => {
        if(res!==null){
          this.user.id = res.id;
          this.user.name = res.name;
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
    windows.sessionStorage.clear()
  },
  methods: {
    load2006(){
      request.get("http://localhost:9090/user/view2006").then(res=>{
        this.tableDatakc=res;
      })
    },
    backup(){
      request.post("http://localhost:9090/user/backup").then(res=>{
        if(res) {
          this.$alert("备份成功")
        }
          else{
            this.$alert("备份失败")
          }

      })
    },
    recovery(){
      request.post("http://localhost:9090/user/reco").then(res=>{
        if(res) {
          this.$alert("恢复成功")
        }
        else{
          this.$alert("恢复失败")
        }

      })
    },
    load(){
      this.loadstu();
      this.loadxsxk();
      this.loadtea();
      this.loadkc();
      this.loadspe();
      this.loadfac()
    },
    delfac(id){
      this.delidfac=id;
      this.dialogVisiblefacdel=true;
    },
    realdelfac(){
      request.delete("http://localhost:9090/user/fac/"+this.delidfac).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadfac();
        }
        else{
          this.$message.error("失败");
        }
      })
      this.delidfac=''
      this.dialogVisiblefacdel=false
    },
    savefac(){
      request.post("http://localhost:9090/user/fac/ins",this.formfac).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadfac();
        }
        else{
          this.$message.error("失败");
        }
        this.dialogVisible=false;
      })
    },
    Editfac(row){
      this.formfac=row;
      this.dialogVisiblefac=true;
    },
    loadfac(){

      request.get("http://localhost:9090/user/pagefac?pageNum="+this.pageNumfac+"&pageSize="+this.pageSizefac).then(res=>{
        this.tableDatafac=res.data
        this.totalfac=res.total
      })
    },
    loadfacid(){
      request.get("http://localhost:9090/user/pagefacid?id="+this.input).then(res=>{
        if(res.total!=0){
          this.tableDatafac=res.data
          this.totalfac=res.total
        }
        else {
          this.$message.error("未查询到")
        }
      });
    },
    handleSizeChangefac(pageSize){
      this.pageSizefac=pageSize
      this.loadfac()
    },
    handleCurrentChangefac(pageNum){
      this.pageNumfac=pageNum
      this.loadfac()
    },





    delspe(id){
      this.delidspe=id;
      this.dialogVisiblespedel=true;
    },
    realdelspe(){
      request.delete("http://localhost:9090/user/spe/"+this.delidspe).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadspe();
        }
        else{
          this.$message.error("失败");
        }
      })
      this.delidspe=''
      this.dialogVisiblespedel=false
    },
    savespe(){
      request.post("http://localhost:9090/user/spe/ins",this.formspe).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadspe();
        }
        else{
          this.$message.error("失败");
        }
        this.dialogVisible=false;
      })
    },
    Editspe(row){
      this.formspe=row;
      this.dialogVisiblespe=true;
    },
    loadspe(){

      request.get("http://localhost:9090/user/pagespe?pageNum="+this.pageNumspe+"&pageSize="+this.pageSizespe).then(res=>{
        this.tableDataspe=res.data
        this.totalspe=res.total
      })
    },
    loadspeid(){
      request.get("http://localhost:9090/user/pagespeid?id="+this.input).then(res=>{
        if(res.total!=0){
          this.tableDataspe=res.data
          this.totalspe=res.total
        }
        else {
          this.$message.error("未查询到")
        }
      });
    },
    handleSizeChangespe(pageSize){
      this.pageSizespe=pageSize
      this.loadspe()
    },
    handleCurrentChangespe(pageNum){
      this.pageNumspe=pageNum
      this.loadspe()
    },



    delxsxk(stuid,kcid){
      this.delidxsxkstu=stuid;
      this.delidxsxkkc=kcid;
      this.dialogVisiblexsxkdel=true;
    },
    realdelxsxk(){
      request.delete("http://localhost:9090/user/xsxk/del?stuid="+this.delidxsxkstu+"&kcid="+this.delidxsxkkc).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadxsxk();
        }
        else{
          this.$message.error("失败");
        }
      })
      this.delidxsxk=''
      this.dialogVisiblexsxkdel=false
    },
    savexsxk(){
      request.post("http://localhost:9090/user/xsxk/ins",this.formxsxk).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadxsxk();
        }
        else{
          this.$message.error("失败");
        }
        this.dialogVisible=false;
      })
    },
    Editxsxk(row){
      this.formxsxk=row;
      this.dialogVisiblexsxk=true;
    },
    loadxsxk(){

      request.get("http://localhost:9090/user/pagexsxk?pageNum="+this.pageNumxsxk+"&pageSize="+this.pageSizexsxk).then(res=>{
        this.tableDataxsxk=res.data
        this.totalxsxk=res.total
      })
    },
    loadxsxkid(){
      request.get("http://localhost:9090/user/pagexsxkid?stuid="+this.inputstuid+"&kcid="+this.inputkcid).then(res=>{
        if(res.total!=0){
          this.tableDataxsxk=res.data
          this.totalxsxk=res.total
        }
        else {
          this.$message.error("未查询到")
        }
      });
    },
    handleSizeChangexsxk(pageSize){
      this.pageSizexsxk=pageSize
      this.loadxsxk()
    },
    handleCurrentChangexsxk(pageNum){
      this.pageNumxsxk=pageNum
      this.loadxsxk()
    },
    
    
    
    

    delkc(id){
      this.delidkc=id;
      this.dialogVisiblekcdel=true;
    },
    realdelkc(){
      request.delete("http://localhost:9090/user/kc/"+this.delidkc).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadkc();
        }
        else{
          this.$message.error("失败");
        }
      })
      this.delidkc=''
      this.dialogVisiblekcdel=false
    },
    savekc(){
      request.post("http://localhost:9090/user/kc/ins",this.formkc).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadkc();
        }
        else{
          this.$message.error("失败");
        }
        this.dialogVisible=false;
      })
    },
    Editkc(row){
      this.formkc=row;
      this.dialogVisiblekc=true;
    },
    loadkc(){

      request.get("http://localhost:9090/user/pagekc?pageNum="+this.pageNumkc+"&pageSize="+this.pageSizekc).then(res=>{
        this.tableDatakc=res.data
        this.totalkc=res.total
      })
    },
    loadkcid(){
      request.get("http://localhost:9090/user/pagekcid?id="+this.input).then(res=>{
        if(res.total!=0){
          this.tableDatakc=res.data
          this.totalkc=res.total
        }
        else {
          this.$message.error("未查询到")
        }
      });
    },
    handleSizeChangekc(pageSize){
      this.pageSizekc=pageSize
      this.loadkc()
    },
    handleCurrentChangekc(pageNum){
      this.pageNumkc=pageNum
      this.loadkc()
    },



    handleCommand(command) {
      if(command==="d") this.dislogin();
      if(command==="tea"){
        this.viewtea=~this.viewtea;
        this.viewstu=false;
        this.viewxsxk=false;
        this.viewspe=false;
        this.viewfac=false;
        this.viewkc=false;
      }
      if(command==="stu"){
        this.viewtea=false;
        this.viewstu=~this.viewstu;
        this.viewxsxk=false;
        this.viewspe=false;
        this.viewfac=false;
        this.viewkc=false;
      }
      if(command==="xsxk"){
        this.viewtea=false;
        this.viewstu=false;
        this.viewxsxk=~this.viewxsxk;
        this.viewspe=false;
        this.viewfac=false;
        this.viewkc=false;
      }
      if(command==="fac"){
        this.viewtea=false;
        this.viewstu=false;
        this.viewxsxk=false;
        this.viewspe=false;
        this.viewfac=~this.viewfac;
        this.viewkc=false;
      }
      if(command==="spe"){
        this.viewtea=false;
        this.viewstu=false;
        this.viewxsxk=false;
        this.viewspe=~this.viewspe;
        this.viewfac=false;
        this.viewkc=false;
      }
      if(command==="kc"){
        this.viewtea=false;
        this.viewstu=false;
        this.viewxsxk=false;
        this.viewkc=~this.viewkc;
        this.viewspe=false;
        this.viewfac=false;
      }
    },
    dislogin(){
      window.sessionStorage.clear();
      this.$router.push('/login')
    },
    isCo() {
      this.isColl=!this.isColl;
      if(this.isColl){
        this.wp=0;
      }
      else
        this.wp=200;
    },
    exporT(){
      request.get("http://localhost:9090/user/export")
    },
    imporT(){
      request.post("http://localhost:9090/user/import")
    },
    delstu(id){
      this.delidstu=id;
      this.dialogVisiblestudel=true;
    },
    realdelstu(){
      request.delete("http://localhost:9090/user/stu/"+this.delidstu).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadstu();
        }
        else{
          this.$message.error("失败");
        }
      })
      this.delidstu=''
      this.dialogVisiblestudel=false
    },
    deltea(id){
      this.delidtea=id;
      this.dialogVisibleteadel=true;
    },
    realdeltea(){
      request.delete("http://localhost:9090/user/tea/"+this.delidtea).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadtea();
        }
        else{
          this.$message.error("失败");
        }
      })
      this.delidtea=''
      this.dialogVisibleteadel=false
    },
    savestu(){
      request.post("http://localhost:9090/user/stu/ins",this.formstu).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadstu();
        }
        else{
          this.$message.error("失败");
        }
        this.dialogVisible=false;
      })
    },
    savetea(){
      request.post("http://localhost:9090/user/tea/ins",this.formtea).then(res=>{
        if(res){
          this.$message.success("成功");
          this.loadtea();
        }
        else{
          this.$message.error("失败");
        }
        this.dialogVisible=false;
      })
    },
    Editstu(row){
      this.formstu=row;
      this.dialogVisiblestu=true;
    },
    Edittea(row){
      this.formtea=row;
      this.dialogVisibletea=true;
    },

    loadstu(){
      request.get("http://localhost:9090/user/pagestu?pageNum="+this.pageNumstu+"&pageSize="+this.pageSizestu).then(res=>{
        this.tableDatastu=res.data
        this.totalstu=res.total
      })
    },
    loadstuid(){
      request.get("http://localhost:9090/user/pagestuid?id="+this.input).then(res=>{
        if(res.total!=0){
          this.tableDatastu=res.data
          this.totalstu=res.total
        }
        else {
          this.$message.error("未查询到")
        }
      })
    },
    loadteaid(){
      request.get("http://localhost:9090/user/pageteaid?id="+this.input).then(res=>{
        if(res.total!=0){
          this.tableDatatea=res.data
          this.totaltea=res.total
        }
        else {
          this.$message.error("未查询到")
        }
      })
    },
    loadtea(){
      request.get("http://localhost:9090/user/pagetea?pageNum="+this.pageNumtea+"&pageSize="+this.pageSizetea).then(res=>{
        this.tableDatatea=res.data
        this.totaltea=res.total
      })
    },
   
    handleSizeChangestu(pageSize){
      this.pageSizestu=pageSize
      this.loadstu()
    },
    handleCurrentChangestu(pageNum){
      this.pageNumstu=pageNum
      this.loadstu()
    },
    handleSizeChangetea(pageSize){
      this.pageSizetea=pageSize
      this.loadtea()
    },
    handleCurrentChangetea(pageNum){
      this.pageNumtea=pageNum
      this.loadtea()
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
    }
  }
}
</script>
