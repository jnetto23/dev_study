const { ApolloServer, gql } = require("apollo-server");

const usuarios = [{
    id: 1,
    nome: 'Joao Netto',
    email: 'jnetto@fyyb.com.br',
    idade: 28
}, {
    id: 2,
    nome: 'Fernanda Marques',
    email: 'fernanda@email.com',
    idade: 31
}, {
    id: 3,
    nome: 'JJ',
    email: 'jj@email.com',
    idade: 1
}]

const typeDefs = gql`
    # Postos de entrada da API
    type Query {
        ola: String,
        horaAtual: String,
        usuarios: [Usuario],
        usuario(id:ID): Usuario,
        produtoEmDestaque: Produto,
        numerosMegaSena: [Int!]!
    }

    type Usuario {
        id: ID!,
        nome: String!,
        email: String!,
        idade: Int!,
    }

    type Produto {
        nome: String!,
        preco: Float!,
        desconto: Float,
        precoComDesconto: Float
    }
`;

const resolvers = {
    Produto: {
        precoComDesconto(produto) {
            return produto.preco * (1 - ((produto.desconto) ? produto.desconto : 0))
        }
    },

    Query: {
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
            const usuario = usuarios.filter(u => u.id == id);
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
        }
    }
};

const server = new ApolloServer({
    typeDefs,
    resolvers
});

server.listen().then(({ url }) => {
    console.log(`Executando em ${url}`)
});