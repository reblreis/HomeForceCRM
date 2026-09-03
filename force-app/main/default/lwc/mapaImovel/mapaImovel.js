import { LightningElement, api } from 'lwc';

export default class MapaImovel extends LightningElement {

    @api logradouro;
    @api numero;
    @api bairro;
    @api cidade;
    @api estado;
    @api cep;

    get mapMarkers() {

        if (!this.logradouro || !this.cidade) {
            return [];
        }

        return [
            {
                location: {
                    Street: `${this.logradouro}, ${this.numero || ''}`,
                    City: this.cidade,
                    State: this.estado,
                    PostalCode: this.cep,
                    Country: 'Brasil'
                },

                title: 'Imóvel',

                description:
                    `${this.logradouro}, ${this.numero || ''} - ` +
                    `${this.bairro || ''}, ${this.cidade} - ${this.estado || ''}`
            }
        ];
    }
}