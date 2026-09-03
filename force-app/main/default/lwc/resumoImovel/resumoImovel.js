import { LightningElement, wire } from 'lwc';
import buscarResumoImovel from '@salesforce/apex/ImovelController.buscarResumoImovel';

export default class ResumoImovel extends LightningElement {

    resumo;

    @wire(buscarResumoImovel)
    carregarResumo({ data, error }) {

        if (data) {
            this.resumo = data;
        } else if (error) {
            console.error('Erro ao buscar resumo do imóvel:', error);
        }
    }
}