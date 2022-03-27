import Vue from 'vue'
import VueRouter from 'vue-router'
import Manage from '../views/Manage.vue'
Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        // meta:{nickname:"首页"},
        component: Manage,
        redirect:"/login",
        children:[
            {
                //user
                path: '/user',
                name: 'User',
                meta:{nickname:"用户管理"},
                component:()=>import('../components/User.vue'),
            },
            {
                meta:{nickname:"首页"},
                path: '/home',
                name: 'home',
                component:()=>import('../components/Home.vue'),
            },
            {
                path: '/changePwd',
                name: 'changePwd',
                component:()=>import('../components/ChangePwd.vue'),
            },
            {
                path: '/image',
                name: 'image',
                component:()=>import('../components/Image.vue'),
            }
        ]
    },
    {
        path: '/login',
        name: 'login',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/Login.vue')
    },
    // {
    //     path: '/admin',
    //     name: 'admin',
    //     children: [
    //
    //     ]
    //
    // }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})
//路由守卫
router.beforeEach((to,from,next)=>{
    next();
})

export default router
