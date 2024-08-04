import { LightningElement ,wire,track} from 'lwc';
import getPRODUCT from '@salesforce/apex/ProductClassCLR.ProductList';

//import PRODUCTS_IMG from "@salesforce/resourceUrl/ProductsDemo";
//import getPRODUCT_TYPES from '@salesforce/apex/ProductClassCLR.ProductTypes';

export default class ProductsList extends LightningElement {
   
    @track productInfo = [];

    @wire(getPRODUCT)
    products({ data, error }) {
        if (data) {
            this.productInfo = data;
        } else if (error) {
            console.error('Error fetching products:', error);
        }
    }
}