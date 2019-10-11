// Antes de Async/Await
const minhaPromise = () => new Promise((resolve, reject) => {
    setTimeout(() => { resolve('OK') }, 2000)
});

minhaPromise()
    .then(response => {
        console.log(response);
    })
    .catch(reject => {
        console.error(reject);
    });

// Com Async/Await
async function executaPromise() {
    const response = await minhaPromise();
    console.log(response);
};

executaPromise(); 

// Trabalhando com axios;

import axios from 'axios';
class Api {
    static async getUserInfo(username) {
        try{
            const response = await axios.get(`https://api.github.com/users/${username}`);
            console.log(response);
        }catch(err) {
            console.warn('usuário inexistente');
        }
    }
}

Api.getUserInfo('jnetto23');
Api.getUserInfo('jnetto23123132131');

// Resposta do Desafio
import * as desafio from './desafio';
//Consultas colocadas dentro de um setTimeout para não misturar com as funcões acima;
setTimeout(async () => {
    console.log('========================================================================')
    console.log('Function 1: ');
    await desafio.umPorSegundo();
    console.log('Function 2: ');
    await desafio.getUserFromGithub('diego3g');
    await desafio.getUserFromGithub('diego3g124123');
    console.log('Function 3: ');
    await desafio.Github.getRepositories('rocketseat/rocketseat.com.br');
    await desafio.Github.getRepositories('rocketseat/dslkvmskv');
    console.log('Function 4: ');
    await desafio.buscaUsuario('diego3g');
}, 5000);