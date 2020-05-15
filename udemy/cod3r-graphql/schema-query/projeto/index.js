const { ApolloServer, gql } = require("apollo-server");

const typeDefs = gql`
    # Postos de entrada da API
    type Query {
        ola: String,
        horaAtual: String,
        usuarioLogado: Usuario,
        produtoEmDestaque: Produto,
        numerosMegaSena: [Int!]!
    }

    type Usuario {
        id: ID!,
        nome: String!,
        email: String!,
        idade: Int!,
        salario: Float,
        vip: Boolean
    }

    type Produto {
        nome: String!,
        preco: Float!,
        desconto: Float,
        precoComDesconto: Float
    }
`;

const resolvers = {
    Usuario: {
        salario(usuario) {
            return usuario.salario_real
        }
    },
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
        usuarioLogado() {
            return {
                id: 1,
                nome: 'Joao Netto',
                email: 'jnetto@fyyb.com.br',
                idade: (parseInt(new Date().getFullYear())  - 1992),
                salario_real: 9999.99,
                vip: true
            }
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