@isTest
private class AvaliacaoImovelServiceTest {

    @testSetup
    static void criarDadosTeste() {

        Imovel__c imovel = new Imovel__c(
            Name = 'Apartamento Copacabana',
            ValorVenda__c = 1250000,
            ValorAluguel__c = 4500,
            AreaConstruida__c = 110,
            QuantidadeQuartos__c = 3,
            QuantidadeBanheiros__c = 2,
            QuantidadeSuites__c = 1,
            QuantidadeVagas__c = 1,
            Status__c = 'Disponível'
        );

        insert imovel;
    }

    @isTest
    static void deveCalcularValorMetroQuadrado(){

        Imovel__c imovel = [
            SELECT ValorVenda__c, AreaConstruida__c FROM Imovel__c LIMIT 1
        ];

        Decimal resultado = AvaliacaoImovelService.calcularValorMetroQuadrado(imovel);

        System.assertEquals(Decimal.valueOf('11363.64'), resultado);
    }

    @isTest
    static void deveRetornarTrueQuandoImovelForAltoPadrao(){

        Imovel__c imovel = [
            SELECT ValorVenda__c FROM Imovel__c LIMIT 1
        ];

        imovel.ValorVenda__c = 2500000;

        Boolean resultado = AvaliacaoImovelService.isAltoPadrao(imovel);

        System.assertEquals(true, resultado);
    }

    @isTest
    static void deveRetornarFalseQuandoImovelNaoForAltoPadrao() {

        Imovel__c imovel = [
            SELECT ValorVenda__c FROM Imovel__c LIMIT 1];

        imovel.ValorVenda__c = 850000;

        Boolean resultado = AvaliacaoImovelService.isAltoPadrao(imovel);

        System.assertEquals(false, resultado);
    }

    @isTest
    static void deveCalcularValorAnualAluguel(){

        Imovel__c imovel = [
            SELECT ValorAluguel__c FROM Imovel__c LIMIT 1];

        Decimal resultado = AvaliacaoImovelService.calcularValorAnualAluguel(imovel);

        System.assertEquals(54000, resultado);
    }

    @isTest
    static void deveGerarResumoImovel(){

        Imovel__c imovel = [
        SELECT Name, ValorVenda__c, ValorAluguel__c, AreaConstruida__c FROM Imovel__c LIMIT 1];

        String resumo = AvaliacaoImovelService.gerarResumoImovel(imovel);

        System.assert(resumo.contains('Valor de Venda'));
    }

    @isTest
    static void deveRetornarZeroQuandoAreaForZero(){

        Imovel__c imovel = new Imovel__c();

        imovel.ValorVenda__c = 1000000;
        imovel.AreaConstruida__c = 0;

        Decimal resultado =
            AvaliacaoImovelService.calcularValorMetroQuadrado(imovel);

        System.assertEquals(0, resultado);
    }

    @isTest
    static void deveRetornarFalseQuandoImovelForNulo(){

        Boolean resultado =
            AvaliacaoImovelService.isAltoPadrao(null);

        System.assertEquals(false, resultado);
    }

    @isTest
    static void deveRetornarZeroQuandoValorVendaForNulo(){

        Imovel__c imovel = new Imovel__c();

        imovel.AreaConstruida__c = 100;

        Decimal resultado =
            AvaliacaoImovelService.calcularValorMetroQuadrado(imovel);

        System.assertEquals(0, resultado);
    }

    @isTest
    static void deveRetornarZeroQuandoAreaForNula(){

        Imovel__c imovel = new Imovel__c();

        imovel.ValorVenda__c = 1000000;

        Decimal resultado =
            AvaliacaoImovelService.calcularValorMetroQuadrado(imovel);

        System.assertEquals(0, resultado);
    }
}