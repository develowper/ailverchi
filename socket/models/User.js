export default {
    name: String,
    surname: String,
    age: {
        type: Number,
        validation: value => value > 0
    },
    gender: {
        type: String,
        validation: value => ['male', 'female', 'other'].includes(value)
    }
}
