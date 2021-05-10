function add_to_cart(pId, pName, pPrice)
{
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        //nothing in cart
        let products = [];
        let product = {productId: pId, productName: pName, productPrice: pPrice, productQuantity: 1};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
    } else {
        //cart is already present
        let pCart = JSON.parse(cart); //pcart is an array
        //checking whether object is going to added already  in cart or not
        let oldProduct = pCart.find((item) => item.productId == pId);
        if (oldProduct) {
            //increasing only quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1; // updating quantity in Product
            // updating productQuantity 
            //  in pCart using Map
            pCart.map((item) => {
                if (item.productid == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pCart));
        } else {
            // New Product Added
            let product = {productId: pId, productName: pName, productPrice: pPrice, productQuantity: 1};
            pCart.push(product);
            localStorage.setItem("cart", JSON.stringify(pCart));
            //console.log("Product Added");
        }
    }
    updateCart();
}
//update cart
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty");
        $(".cart-items").html("( 0 )"); //Jquery whenever cart is empty cart-items class will have html as "( 0 )"
        $(".cart-body").html("<h3> Cart does Not have any items</h3>");
        $(".checkout-btn ").attr('disabled',true);
    } else {
        //there is something in cart
        $(".cart-items").html(`( ${cart.length} )`);

        let table = `
                 <table class='table'>
         <thread class='thread-light'>
            <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Action</th>
        
            </tr>
        </thread>
        `;
        let totalPrice=0;
        cart.map((item)=> {
            table +=`
                    <tr>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity*item.productPrice}</td>
            <td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
                    </tr>`
            totalPrice +=item.productPrice*item.productQuantity;


        })
        table = table +`
                <tr><td colspan='5' class='text-right font-weight-bold'>Total Price : ${totalPrice}</td></tr>
        </table>`
        $(".cart-body").html(table);//inserting table in cart-body class. cart-body class is used in common_modal.jsp for a div 
         $(".checkout-btn ").attr('disabled',false);
    }
}
// delete item
function deleteItemFromCart(pId)
{ 
    let cart=JSON.parse(localStorage.getItem('cart'));
    let newCart=cart.filter((item => item.productId !=pId))
    localStorage.setItem('cart',JSON.stringify(newCart))
    updateCart();
    
}
function goToCheckout(){
    window.location="checkout.jsp";
    
}

$(document).ready(function () {
    updateCart();
})
