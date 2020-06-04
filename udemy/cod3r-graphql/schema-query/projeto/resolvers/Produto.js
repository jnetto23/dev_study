module.exports = {
    precoComDesconto(produto) {
        return produto.preco * (1 - ((produto.desconto) ? produto.desconto : 0))
    }
}