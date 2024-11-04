export const state = () => ({
    counter: 0
})

export const getters = {
    getCounter(state) {
        return state.counter
    }
}

export const mutations = {
    increment(state) {
        state.counter++
    }
}

export const actions = {
    async fetchCounter({state}) {
        // make request
        const res = {data: 10};
        state.counter = res.data;
        return res.data;
    },
    nuxtServerInit({commit}, {req}) {
        if (req.session.user) {
            commit('user', req.session.user)
        }
    }
}
