public class ResumoImovelDTO {
    
    @AuraEnabled
    public String nome;

    @AuraEnabled
    public Decimal valorVenda;

    @AuraEnabled
    public Decimal valorAluguel;

    @AuraEnabled
    public Decimal areaConstruida;

    @AuraEnabled
    public Integer quartos;

    @AuraEnabled
    public Integer banheiros;

    @AuraEnabled
    public Integer suites;

    @AuraEnabled
    public Integer vagas;

    @AuraEnabled
    public String status;

    @AuraEnabled
    public Decimal valorMetroQuadrado;

    @AuraEnabled
    public Decimal valorAnualAluguel;

    @AuraEnabled
    public Boolean altoPadrao;
}