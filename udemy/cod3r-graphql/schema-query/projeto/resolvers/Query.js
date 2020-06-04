const { usuarios, perfis } = require('../data/db');

module.exports = {
    ola() {
        return 'Basta retornar uma string';
    },
    horaAtual() {
        return `${new Date().toLocaleString()}`;
    },
    usuarios() {
        return usuarios;
    },
    usuario(_, { id }) {
        const usuario = usuarios.filter(u => u.id === id);
        return (usuario) ? usuario[0] : null; 
    },
    produtoEmDestaque() {
        return {
            nome: 'Produto 1',
            preco: 100.00,
            desconto: 0.5
        }
    },
    numerosMegaSena() {
        const crescente = (a, b) => a - b;
        let numeros = [];

        function adicionar() {
            let n = (parseInt(Math.random() * 60 + 1));
            if(numeros.indexOf(n) > 0) {
                adicionar();
            } else {
                numeros.push(n);
            }
        };

        while(numeros.length <= 6) {
            adicionar();
        };
            
        return numeros.sort(crescente);
    },
    perfis() {
        return perfis;
    },
    perfil(_, { id }) {
        const perfil = perfis.filter(p => p.id === id);
        return (perfil) ? perfil[0] : null;
    }
}