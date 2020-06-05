const { usuarios, proximoId } = require('../data/db');

module.exports = {
    novoUsuario(_, { nome, email, idade }) {
        const emailExistente = usuarios
            .some(u => u.email === email);
        if(emailExistente) {
            throw new Error('Email cadastrado');
        }
        
        const novo = {
            id: proximoId(),
            nome,
            email, 
            idade,
            perfil_id: 1,
            status: 'ATIVO'
        };

        usuarios.push(novo);
        return novo;
    }
};