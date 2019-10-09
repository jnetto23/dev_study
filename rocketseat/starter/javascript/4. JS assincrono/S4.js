function exibir(dom, data) {
    var d = document.getElementById(dom);
    
    var img = document.createElement('img');
    img.setAttribute('src', data.avatar_url);

    var div = document.createElement('div');
    div.style.display = 'flex';
    div.style.flexDirection = 'column';

    var name = document.createElement('span');
    var nameTxt = document.createTextNode(`Name: ${data.name}`);
    name.appendChild(nameTxt);

    var bio = document.createElement('span');
    var bioTxt = document.createTextNode(`Bio: ${data.bio}`);
    bio.appendChild(bioTxt);

    var location = document.createElement('span');
    var locationTxt = document.createTextNode(`Location: ${data.location}`);
    location.appendChild(locationTxt);

    d.appendChild(img);
    d.appendChild(div);
    div.appendChild(name);
    div.appendChild(bio);
    div.appendChild(location);

}
// Aula S4E01 - Requisições Ajax
var xhr = new XMLHttpRequest();

xhr.open('GET', 'https://api.github.com/users/nodejs');
xhr.send(null);

xhr.onreadystatechange = function () {
    if(xhr.readyState === 4) {
        exibir('e1',JSON.parse(xhr.responseText));
    }
}
// Aula S4E02 - Promisses
var minhaPromisse = function() {
    return new Promise(function(resolve, reject){
        var xhr2 = new XMLHttpRequest();
        xhr2.open('GET', 'https://api.github.com/users/reactjs');
        xhr2.send(null);

        xhr2.onreadystatechange = function () {
            if(xhr2.readyState === 4) {
                if(xhr2.status === 200) {
                    resolve(JSON.parse(xhr2.responseText));
                } else {
                    reject('Erro na Requisição');
                }
            }
        }
    });
}

minhaPromisse()
    .then(function(resolve){
        exibir('e2', resolve);
    })
    .catch(function(reject){
        console.error(reject);
    });

// Aula S4E03 - Axios
axios.get('https://api.github.com/users/reactnative')
    .then(function(resolve){
        exibir('e3', resolve.data);
    })
    .catch(function(reject){
        console.error(reject);
    });
