/* 
    Desafio (https://skylab.rocketseat.com.br/api/files/1566499323808.pdf)

    Transforme os seguintes trechos de código utilizando async/await:
        Funão delay aciona o .then após 1s
        const delay = () => new Promise(resolve => setTimeout(resolve, 1000));
        function umPorSegundo() {
            delay().then(() => {
                console.log('1s');
                delay().then(() => {
                    console.log('2s');
                    delay().then(() => {
                        console.log('3s');
                    });
                })
            });
        }
        umPorSegundo();

        import axios from 'axios';
        function getUserFromGithub(user) {
            axios.get(`https://api.github.com/users/${user}`)
                .then(response => {
                    console.log(response.data);
                })
                .catch(err => {
                    console.log('Usuário não existe');
                })
            }
        getUserFromGithub('diego3g');
        getUserFromGithub('diego3g124123');

        class Github {
            static getRepositories(repo) {
                axios.get(`https://api.github.com/repos/${repo}`)
                    .then(response => {
                        console.log(response.data);
                    })
                    .catch(err => {
                        console.log('Repositório não existe');
                    })
            }
        }
        
        Github.getRepositories('rocketseat/rocketseat.com.br');
        Github.getRepositories('rocketseat/dslkvmskv');

        const buscaUsuario = usuario => {
            axios.get(`https://api.github.com/users/${user}`)
                .then(response => {
                    console.log(response.data);
                })
                .catch(err => {
                    console.log('Usuário não existe');
                });
        }
        
        buscaUsuario('diego3g');
*/

const delay = () => new Promise(resolve => setTimeout(resolve, 1000));
export async function umPorSegundo() {
    await delay();
    console.log('1s');
    await delay();
    console.log('2s');
    await delay();
    console.log('3s');
};

import axios from 'axios';
export async function getUserFromGithub(user) {
    try{
        const { data } = await axios.get(`https://api.github.com/users/${user}`);
        console.log( data ); 
    } catch(err) {
        console.log('Usuário não existe');
    };    
};

export class Github {
    static async getRepositories(repo) {
        try{
            const { data } = await axios.get(`https://api.github.com/repos/${repo}`);
            console.log( data ); 
        } catch(err) {
            console.log('Repositorio não existe');
        };  
    }
}

export const buscaUsuario = async usuario => {
    try{
        const { data } = await axios.get(`https://api.github.com/repos/${usuario}`);
        console.log( data ); 
    } catch(err) {
        console.log('Usuário não existe');
    };
}