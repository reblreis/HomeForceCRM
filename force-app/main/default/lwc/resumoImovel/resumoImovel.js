import { LightningElement, wire } from 'lwc';
import buscarPrimeiroImovel from '@salesforce/apex/ImovelController.buscarPrimeiroImovel';

export default class ResumoImovel extends LightningElement {

    imovel;

    @wire(buscarPrimeiroImovel)
    carregarImovel({ data, error }){

        if(data){
            this.imovel = data;
        } else if(error){
            console.error(error);
        }
    }

}