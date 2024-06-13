import { LightningElement, api } from 'lwc';

export default class CarTile extends LightningElement {
    @api car = {}

    handleTileClick(){
        this.dispatchEvent(new CustomEvent('selected', {
            detail : this.car.Id
        }))
    }
}