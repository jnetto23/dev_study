const { ApolloServer, gql } = require("apollo-server");

const typeDefs = gql`
    # Postos de entrada da API
    type Query {
        ola: String,
        horaAtual: String
        usuarioLogado: Usuario
    }

    type Usuario {
        id: ID!,
        nome: String!,
        email: String!,
        idade: Int!,
        salario: Float,
        vip: Boolean
    }
`;

const resolvers = {
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
                salario: 9999.99,
                vip: true
            }
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