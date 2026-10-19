@isTest
private class ImovelControllerTest {

    @testSetup
    static void criarDados() {
        Imovel__c imovel = new Imovel__c(
            Name = 'Casa Barra',
            ValorVenda__c = 1800000,
            ValorAluguel__c = 2500,
            AreaConstruida__c = 200,
            QuantidadeQuartos__c = 3,
            QuantidadeBanheiros__c = 2,
            QuantidadeSuites__c = 1,
            QuantidadeVagas__c = 2,
            Status__c = 'Disponível'
        );

        insert imovel;
    }

    @isTest
    static void deveBuscarImovel() {
        Imovel__c imovel = [
            SELECT Id
            FROM Imovel__c
            WHERE Name = 'Casa Barra'
            LIMIT 1
        ];

        Test.startTest();
        Imovel__c resultado =
            ImovelController.buscarImovel(imovel.Id);
        Test.stopTest();

        System.assertEquals(imovel.Id, resultado.Id);
        System.assertEquals('Casa Barra', resultado.Name);
    }

    @isTest
    static void deveBuscarPrimeiroImovel() {
        Test.startTest();
        Imovel__c resultado =
            ImovelController.buscarPrimeiroImovel();
        Test.stopTest();

        System.assertNotEquals(null, resultado);
        System.assertEquals('Casa Barra', resultado.Name);
    }

    @isTest
    static void deveBuscarResumoImovel() {
        Test.startTest();
        ResumoImovelDTO resumo =
            ImovelController.buscarResumoImovel();
        Test.stopTest();

        System.assertNotEquals(null, resumo);
        System.assertEquals('Casa Barra', resumo.nome);
        System.assertEquals(1800000, resumo.valorVenda);
        System.assertEquals(2500, resumo.valorAluguel);
        System.assertEquals(200, resumo.areaConstruida);
        System.assertEquals(3, resumo.quartos);
        System.assertEquals(2, resumo.banheiros);
        System.assertEquals(1, resumo.suites);
        System.assertEquals(2, resumo.vagas);
        System.assertEquals('Disponível', resumo.status);
        System.assertEquals(9000, resumo.valorMetroQuadrado);
        System.assertEquals(30000, resumo.valorAnualAluguel);
        System.assertEquals(false, resumo.altoPadrao);
    }
}