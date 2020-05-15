const { ApolloServer, gql } = require("apollo-server");

const typeDefs = gql`
    # Postos de entrada da API
    type Query {
        ola: String
    }
`;

const resolvers = {
    Query: {
        ola() {
            return 'Basta retornar uma string';
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