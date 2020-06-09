const { usuarios } = require('../../data/db')

module.exports = {
    usuarios() {
        return usuarios
    },
    usuario(_, { id }) {
        const sels = usuarios
            .filter(u => u.id === id)
        return sels ? sels[0] : null
    }
}