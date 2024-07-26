import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/Manage.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Manage',
    component: ()=>import('../views/Manage.vue'),
    child:[
      {
        path:'/Aside',
        name:'Aside',
        component:()=>import('../components/Aside.vue')
      }
    ]
  },
  {
    path:'/login',
    name:'Login',
    component:()=>import('../views/login.vue')

  },
  {
    path:'/stu',
    name:'stu',
    component:()=>import('../views/stu.vue'),

  },
  {
    path:'/tea',
    name:'tea',
    component:()=>import('../views/tea.vue'),

  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,

})

// router.beforeEach((to,from,next)=> {
//   if (to.path === '/Login') return next();
//   //获取token
//   const tokenStr1 = window.sessionStorage.getItem('token1');
//   const tokenStr2 = window.sessionStorage.getItem('token2');
//   const tokenStr3 = window.sessionStorage.getItem('token3');
//   if ((tokenStr1 && to.path==='/')||(tokenStr2 && to.path==='/stu')||(tokenStr3 && to.path==='/tea')) return next();
//   return  next('/Login');
// })
export default router
