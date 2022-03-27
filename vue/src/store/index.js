// 创建vuex中最为核心的store
import Vue from 'vue'

import Vuex from 'vuex'
// 创建store之前再使用vuex
Vue.use(Vuex)
// 准备actions 用于响应组件中的动作
const actions = {
    // 两个参数 一个是miniStore  上下文commit  一个是传递的参数value
    // add(context, value) {
    //     context.commit('ADD', value)
    // },
    // 加减可以跳过actions部分 
    // dec(context, value) {
    //     context.commit('DEC', value)
    // },

    addOdd(context, value) {
        if (context.state.sum % 2)
            context.commit('ADD', value)

    },
    addWait(context, value) {
        setTimeout(() => {
            context.commit('ADD', value)
        }, 1000);
    }
}
// mutations 用于操作数据  state
const mutations = {
    ADD(state, value) {
        state.sum = state.sum + value;

    },
    DEC(state, value) {
        state.sum -= value;

    }
}

// 准备state 用于存储数据
const state = {
    sum: 0,
    school: "北大 ",
    subject: "前端"
}
//用于对state中的数据进行加工
const getters = {
    bigSum(state) {
        return state.sum * 10
    }
}


// 创建store
export default new Vuex.Store({
    // 对象的简写形式 重名才能使用
    actions,
    mutations,
    state,
    getters,
})



