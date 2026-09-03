@isTest
private class ImovelControllerTest {
    
    @isTest
    static void criarDados(){

        Imovel__c imovel = new Imovel__c(
            Name = 'Casa Barra',
            ValorVenda__c = 1800000,
            AreaConstruida__c = 200,
            Status__c = 'Disponível'
        );

        insert imovel;
    }

    @isTest
    static void deveBuscarImovel(){

        Imovel__c imovel = [
            SELECT Id
            FROM Imovel__c
            LIMIT 1
        ];

        Imovel__c resultado =
            ImovelController.buscarImovel(imovel.Id);

        System.assertEquals(imovel.Id, resultado.Id);
    }
}