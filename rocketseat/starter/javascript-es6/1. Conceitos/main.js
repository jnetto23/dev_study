/*
 * S1E04 - Classes
 */ 

class List {
    constructor(){
        this.data = [];
    }
    add(data) {
        this.data.push(data);
        console.log(this.data);
    }
}
class TodoList extends List {
    constructor() {
        super();
        this.usuario = 'Joao';
    }

    mostraUsuario() {
        console.log(this.usuario);
    }
}

const MinhaLista = new TodoList();
document.getElementById('novotodo').onclick = function() {
    MinhaLista.add("Novo tudo");
}

MinhaLista.mostraUsuario();

/*
    Metodos estaticos
    permitem a instancia de uma nova classe sem utilizar o new
    metodos estaticos não enxergam o resto da class (nem tem acesso ao this);
    Normalmente são metodos auxiliares que recebem e ja retornam alguma informação
 */

// Exemplo utilização de Metodo Estatico
class Matematica {
    static soma(n1, n2) {
        return n1 + n2;
    }
}
console.log(Matematica.soma(1, 2));


/*
 * S1E06 - Operações em Arrays 
 */

 const arr = [1, 3, 4, 5, 8, 9];

 const newArr = arr.map(function(item) {
     return item * 2;
 });

 console.log(newArr);

 const sum = arr.reduce(function(total, next){
    return total + next;
 });

 console.log(sum);

 const filter = arr.filter(function(item) {
    return item % 2 === 0;
 });

console.log(filter);

const find = arr.find(function(item) {
    return item === 4;
});

console.log(find);

/*
 * S1E09 - Desestruturação
 */

 const usuarios1e09 = {
     nome: 'Joao',
     idade: 27,
     endereco: {
         cidade: 'São Paulo',
         estado: 'SP'
     },
 };

 const {nome, idade, endereco: { cidade }} = usuarios1e09;
 console.log(nome, idade, cidade);

 /*
  * S1E10 - Operadores rest/spread 
  */


  console.log('===================================================================');
  // REST - tudo que sobra
  const usuarioS1E10 = {
      nomes1e10: 'Joao',
      idades1e10: 90,
      enderecos1e10: {
          cidades1e10: 'São Paulo',
          estados1e10: 'SP'
      },
  };

  let { nomes1e10, ...resto } = usuarioS1E10;
  console.log(nomes1e10);
  console.log(resto);

  // SPREAD - propagação de valores
  let arr1 = [1, 2, 3];
  let arr2 = [4, 5, 6];
  let arr3 = [...arr1, ...arr2];
  console.log(arr3);