'use strict';

(function(){
    window.addEventListener('load', () => {

        let opt_qtd = document.querySelector('#qtd');
        opt_qtd.addEventListener('change', () => {
            window.location.href = `./?qtd=${opt_qtd.value}`;
        });

        let pgs = document.querySelectorAll('#pgs a');
        Array.prototype.forEach.call(pgs, (pg) => {
            pg.addEventListener('click', (e) => {
                e.preventDefault();
                if(location.search == "") { 
                    window.location.href = pg.href;
                } else {
                    let link = newLink(pg.href);    
                    window.location.href = link;
                };
            });
        });

        function newLink(uri) {
            let qsAtual = qsForObj();
            let qsLink = qsForObj(uri);
            let qs = Object.assign(qsAtual, qsLink);
            return uri.split("?")[0] + '?' + 
                Object.keys(qs).map(function(key) {
                    return encodeURIComponent(key) + '=' +
                        encodeURIComponent(qs[key]);
                }).join('&');
        };

        function qsForObj(uri = '') {
            let qs = {}; 
            let qsValues = (!uri) ? location.search.slice(1).split("&") : uri.split("?")[1].split("&");
            Array.prototype.forEach.call(qsValues, qsValue => {
                qsValue = qsValue.split('=');
                qs[decodeURIComponent(qsValue[0])] = decodeURIComponent(qsValue[1]) || '';
            });
            return qs;
        };
    });
})();