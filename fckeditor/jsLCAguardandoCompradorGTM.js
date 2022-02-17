$(document).ready(function () {
    $('.paginacao_lista_casamento').children('span').children('a').click(function () {
        var currentPage = $('.paginacao_lista_casamento').children('span').children('span').html();
        var nextPage = $(this).html();
        var eventAction = '';

        if ($(this).attr('disabled') != 'disabled') {
            if (nextPage == '...') {
                nextPage = 'Próximas 5';
                eventAction = 'Usou Paginação';
            }

            if (nextPage == 'Anterior' && parseInt(currentPage) > 1) {
                nextPage = (parseInt(currentPage) - 1).toString();
            }
            else if (nextPage == 'Próximo') {
                nextPage = (parseInt(currentPage) + 1).toString();
            }

            if (parseInt(currentPage) < parseInt(nextPage)) {
                eventAction = 'Usou Paginação - Aumentou';
            }
            else if (parseInt(currentPage) > parseInt(nextPage)) {
                eventAction = 'Usou Paginação - Reduziu';
            }

            dataLayer.push({
                'event': 'trackWeddingListAdministration',
                'eventCategory': 'Administração de Lista - Lista de Casamento',
                'eventLabel': 'Página de Destino - ' + nextPage + '',
                'eventAction': eventAction
            });
        }
    });

    $("[id*=lbtAtualizar]").live("click", function () {

        var productId = $(this).attr('idproduto').trim();
        var prodCurrentQty = $(this).attr('qtdProduto').trim();
        var prodQty = $(this).closest('li').find('[id*=div_quant_prod]').find('[id*=txtQtd]').attr('value');

        if (parseInt(prodCurrentQty) != parseInt(prodQty)) {
            dataLayer.push({
                'event': 'trackWeddingListAdministration',
                'eventCategory': 'Administração de Lista - Lista de Casamento',
                'eventLabel': 'ID do Produto - ' + productId + '',
                'eventAction': 'Alterou Quantidade Produto',
                'eventValue': prodQty
            });
        }
    });

    $("[id*=hpkBought]").live("click", function () {

        dataLayer.push({
            'event': 'trackWeddingListAdministration',
            'eventCategory': 'Administração de Lista - Lista de Casamento',
            'eventLabel': 'Visualização de Produtos Ganhos',
            'eventAction': 'Visualizou Produtos Ganhos'
        });
    });

    $("[id*=hpkChange]").live("click", function () {

        dataLayer.push({
            'event': 'trackWeddingListAdministration',
            'eventCategory': 'Administração de Lista - Lista de Casamento',
            'eventLabel': 'Visualização de Produtos Resgatados',
            'eventAction': 'Visualizou Produtos Resgatados'
        });
    });

    $("[id*=hpkCredits]").live("click", function () {

        dataLayer.push({
            'event': 'trackWeddingListAdministration',
            'eventCategory': 'Administração de Lista - Lista de Casamento',
            'eventLabel': 'Visualização de Extrato',
            'eventAction': 'Visualizou Informações de Extrato'
        });
    });

    $("[id*=hpkTracking]").live("click", function () {

        dataLayer.push({
            'event': 'trackWeddingListAdministration',
            'eventCategory': 'Administração de Lista - Lista de Casamento',
            'eventLabel': 'Visualização de Acompanhamento de Pedido',
            'eventAction': 'Visualizou Informações Acompanhamento'
        });
    });

    $("[id*=lbtAddProduct]").live("click", function () {

        dataLayer.push({
            'event': 'trackWeddingListAdministration',
            'eventCategory': 'Administração de Lista - Lista de Casamento',
            'eventLabel': 'Clique "Adicionar Mais Produtos"',
            'eventAction': 'Clicou em "Adicionar Mais Produtos"'
        });
    });
});