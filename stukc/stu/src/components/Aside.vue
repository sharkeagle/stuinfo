

<template>
    <el-menu  style="background-color: bisque;"
              :collapse="isColl">
        <el-button type="text" style="height: 30px;width: 100% ;font-size: large;margin-top: 10px"@click="viewstu=true">学生管理</el-button><p/>
      <el-button type="text" style="height: 30px;width: 100% ;font-size: large;margin-top: 10px">老师管理</el-button><p/>
      <el-button type="text" style="height: 30px;width: 100% ;font-size: large;margin-top: 10px">学生选课管理</el-button><p/>
      <el-button type="text" style="height: 30px;width: 100% ;font-size: large;margin-top: 10px">课程管理</el-button><p/>
    </el-menu>
</template>
<script>
export default {
  name: 'Aside',
  props: {
    isColl: Boolean,
    viewstu: Boolean
  }
}
</script>
<style >
</style>
