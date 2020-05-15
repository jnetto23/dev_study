const { ApolloServer, gql } = require("apollo-server");

const typeDefs = gql`
    # Postos de entrada da API
    type Query {
        ola: String,
        horaAtual: String
    }
`;

const resolvers = {
    Query: {
        ola() {
            return 'Basta retornar uma string';
        },
        horaAtual() {
            return `${new Date().toLocaleString()}`;
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