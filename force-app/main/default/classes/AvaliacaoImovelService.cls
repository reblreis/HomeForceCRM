public with sharing class AvaliacaoImovelService {
    
    public static Decimal calcularValorMetroQuadrado(Imovel__c Imovel) {

        if(imovel == null){
            return 0;
        }

        if(imovel.AreaConstruida__c == null || imovel.AreaConstruida__c == 0){
            return 0;
        }

        if(imovel.ValorVenda__c == null){
            return 0;
        }

        Decimal valorMetroQuadrado = imovel.ValorVenda__c / imovel.AreaConstruida__c;

        return valorMetroQuadrado.setScale(2);
    }

    public static Boolean isAltoPadrao(Imovel__c imovel){

        if(imovel == null){
            return false;
        }

        if(imovel.ValorVenda__c == null){
            return false;
        }

        return imovel.ValorVenda__c >= 2000000;
    }

    public static Decimal calcularValorAnualAluguel(Imovel__c imovel){

        if(imovel == null){
            return 0;
        }

        if(imovel.ValorAluguel__c == null){
            return 0;
        }

        return imovel.ValorAluguel__c * 12;
    }

    public static String gerarResumoImovel(Imovel__c imovel){

        if(imovel == null){
            return 'Imóvel não informado.';
        }

        Decimal valorMetro = calcularValorMetroQuadrado(imovel);

        String categoria = isAltoPadrao(imovel) ? 'Alto Padrão' : 'Padrão';

        return 'Resumo do Imóvel\n' +
                '-----------------------------\n' +
                'Valor de Venda: R$ ' + imovel.ValorVenda__c + '\n' +
                'Valor por m²: R$ ' + valorMetro + '\n' +
                'Categoria: ' + categoria;
    }
}