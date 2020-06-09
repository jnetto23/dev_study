const usuarios = require('./usuario');
const perfis = require('./perfil');

module.exports = {
    ...usuarios,
    ...perfis
}