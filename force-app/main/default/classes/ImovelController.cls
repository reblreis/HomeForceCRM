public with sharing class ImovelController {

    @AuraEnabled(cacheable=true)
    public static Imovel__c buscarImovel(Id imovelId){

        return [
            SELECT Id,
                   Name,
                   Logradouro__c,
                   ValorVenda__c,
                   ValorAluguel__c,
                   AreaConstruida__c,
                   QuantidadeQuartos__c,
                   QuantidadeBanheiros__c,
                   QuantidadeSuites__c,
                   QuantidadeVagas__c,
                   Status__c
            FROM Imovel__c
            WHERE Id = :imovelId
            LIMIT 1
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Imovel__c buscarPrimeiroImovel(){

        return[
            SELECT Id,
                    Name,
                    ValorVenda__c,
                    ValorAluguel__c,
                    AreaConstruida__c,
                    QuantidadeQuartos__c,
                    QuantidadeBanheiros__c,
                    QuantidadeSuites__c,
                    QuantidadeVagas__c,
                    Status__c
            FROM Imovel__c
            ORDER BY CreatedDate
            LIMIT 1
        ];
    }

    @AuraEnabled(cacheable=true)
    public static ResumoImovelDTO buscarResumoImovel(){

        Imovel__c imovel = [
            SELECT Id,
                    Name,
                    ValorVenda__c,
                    ValorAluguel__c,
                    AreaConstruida__c,
                    QuantidadeQuartos__c,
                    QuantidadeBanheiros__c,
                    QuantidadeSuites__c,
                    QuantidadeVagas__c,
                    Status__c
            FROM Imovel__c
            ORDER BY CreatedDate
            LIMIT 1
        ];

        ResumoImovelDTO resumo = new ResumoImovelDTO();

        resumo.nome = imovel.Name;
        resumo.ValorVenda = imovel.ValorVenda__c;
        resumo.valorAluguel = imovel.ValorAluguel__c;
        resumo.areaConstruida = imovel.AreaConstruida__c;
        resumo.quartos = Integer.valueOf(imovel.QuantidadeQuartos__c);
        resumo.banheiros = Integer.valueOf(imovel.QuantidadeBanheiros__c);
        resumo.suites = Integer.valueOf(imovel.QuantidadeSuites__c);
        resumo.vagas = Integer.valueOf(imovel.QuantidadeVagas__c);
        resumo.status = imovel.Status__c;

        resumo.valorMetroQuadrado = AvaliacaoImovelService.calcularValorMetroQuadrado(imovel);
        resumo.valorAnualAluguel = AvaliacaoImovelService.calcularValorAnualAluguel(imovel);

        resumo.altoPadrao = AvaliacaoImovelService.isAltoPadrao(imovel);

        return resumo;
    }
}