import api from './api';
import Axios from 'axios';

class App {
    constructor() {
        this.repositories = [];
        this.formEl  = document.getElementById('repo-form');
        this.inputEl = document.querySelector('#repo-form input[name=repository]');
        this.listEl  = document.getElementById('repo-list');
        this.registerHandlers();
    }

    registerHandlers() {
        this.formEl.onsubmit = (e) => this.addRepository(e);
    }
    
    setLoading(loading = true) {
        if(loading) {
            let loadingEl = document.createElement('span');
            loadingEl.appendChild(document.createTextNode('Carregando...'));
            loadingEl.setAttribute('id', 'loading');
            this.formEl.appendChild(loadingEl);
        } else {
            document.getElementById('loading').remove();
        }

    }

    async addRepository(e) {
        e.preventDefault();
        const repoInput = this.inputEl.value;
        
        if(repoInput.lenght === 0) return;

        this.setLoading();
        try {
            const response = await api.get(`repos/${repoInput}`);
            const {name, description, owner: { html_url, avatar_url }} = response.data;
    
            this.repositories.push({
                key: repoInput,
                name,
                description,
                avatar_url,
                html_url 
            });
            
            this.inputEl.value = '';
    
            this.render();
            
        } catch (error) {
            alert('O repositório não existe');
        }
        this.setLoading(false);
    }

    render() {
        this.listEl.innerHTML = '';
        this.repositories.forEach(({name, description, avatar_url, html_url}) => {
            let img = document.createElement('img');
            img.setAttribute('src', avatar_url );
            img.setAttribute('alt', 'Image Repository GitHub');
            img.setAttribute('title', name);

            let title = document.createElement('strong');
            title.appendChild(document.createTextNode(name));

            let desc = document.createElement('p');
            desc.appendChild(document.createTextNode(description));

            let link = document.createElement('a');
            link.appendChild(document.createTextNode('Acessar'));
            link.setAttribute('href', html_url);
            link.setAttribute('target', '_blank');

            let listItem = document.createElement('li');
            listItem.appendChild(img);
            listItem.appendChild(title);
            listItem.appendChild(desc);
            listItem.appendChild(link);

            this.listEl.appendChild(listItem);
        });
    }
}

new App();