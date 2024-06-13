import CAR_PLACE_HOLDER from '@salesforce/resourceUrl/placeHolder';
import { LightningElement, api } from 'lwc';
// Example :- import TRAILHEAD_LOGO from '@salesforce/resourceUrl/trailhead_logo';

export default class PlaceHolder extends LightningElement {

    @api message
    placeHolderImg = CAR_PLACE_HOLDER
}