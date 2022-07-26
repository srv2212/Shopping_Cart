import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    connect() {}

    updateValue(event){
        //console.log("Clicked increase quantity");
        event.preventDefault();
        //event.stopPropogation();
        const buttonID = event.params['button'];
        const quantityID = event.params['quantity'];
        const subtotalID = event.params['subtotal'];
        const priceID = event.params['price'];
        const totalID = event.params['total'];
        console.log(buttonID)

        const quantity=document.getElementById(quantityID);
        const subtotal=document.getElementById(subtotalID);
        const price=document.getElementById(priceID);
        const total=document.getElementById(totalID);

        //console.log(subtotal.innerText);
        //console.log(price.innerText);
        //console.log(total.innerText)

        if(buttonID=="inc-button")
            this.incValue(quantity,subtotal,price,total)
        if(buttonID=="dec-button")
            this.decValue(quantity,subtotal,price,total)    

    }

    incValue(quantity,subtotal,price,total) {
        quantity.innerText=parseInt(quantity.innerText)+1;
        subtotal.innerText=parseFloat(subtotal.innerText)+parseFloat(price.innerText);
        total.innerText=parseFloat(total.innerText)+parseFloat(price.innerText);
    }

    decValue(quantity,subtotal,price,total) {
        if (quantity.innerText==1) {
            console.log("Not able to decrease more")
        }
        else {
            quantity.innerText=parseInt(quantity.innerText)-1;
            subtotal.innerText=parseFloat(subtotal.innerText)-parseFloat(price.innerText);
            total.innerText=parseFloat(total.innerText)-parseFloat(price.innerText);
        }
    }

    savingValue(event) {
        event.preventDefault();
        const quantityID = event.params['quantity'];
        const itemID = event.params['id'];

        var quantity = parseInt((document.getElementById(quantityID)).innerText)

        console.log(quantity)

        $.ajax({
            url: "/carts/items/" + itemID,
            dataType: "json",
            contentType: "application/json",
            cache: false,
            type: 'PATCH',
            data: JSON.stringify({quantity: quantity}),
            success: function(post){
                location.reload();
                alert("Saved Successfully");
            },
            error: function(post){
                alert('Error');
            }
            
        });


    }


    
}