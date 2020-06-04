const { usuarios, perfis } = require('../data/db');

module.exports = {
    perfil(usuario) {
        const perfil = perfis.filter(p => p.id === usuario.perfil_id);
        return (perfil) ? perfil[0] : null;         
    }
}