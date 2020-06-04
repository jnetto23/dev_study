const usuarios = [{
    id: 1,
    nome: 'Joao Netto',
    email: 'jnetto@fyyb.com.br',
    idade: 28,
    perfil_id: 1,
    status: 'ATIVO'
}, {
    id: 2,
    nome: 'Fernanda Marques',
    email: 'fernanda@email.com',
    idade: 31,
    perfil_id: 2,
    status: 'INATIVO'
}, {
    id: 3,
    nome: 'JJ',
    email: 'jj@email.com',
    idade: 1,
    perfil_id: 2,
    status: 'BLOQUEADO'
}];

const perfis = [{
    id: 1,
    nome: 'Administrador'
}, {
    id: 2,
    nome: 'Comum'
}];

module.exports = { usuarios, perfis };