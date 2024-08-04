import { LightningElement,wire,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import imagesList from '@salesforce/apex/ImgProducts.ImagesList';
export default class ProductimagesLWC extends LightningElement {

    productInfoIMG=[];

    @wire(imagesList)
    products({ data, error }) {
        if (data) {
            this.productInfoIMG = data;
            console.log(" Products ", this.productInfoIMG);
        } else if (error) {
            console.error('Error fetching products:', error);
        }
    }

    handleProductClick(event) {
        // Get the product ID from the clicked product card
        const productId = event.currentTarget.dataset.productId;
        console.log('Clicked Product ID:', productId);

        // Show a toast message with the product ID
        const toastEvent = new ShowToastEvent({
            title: 'Product Clicked',
            message: `Product ID: ${productId}`,
            variant: 'info'
        });
        this.dispatchEvent(toastEvent);
    }
    
    // Tejas First Update PUSH
}