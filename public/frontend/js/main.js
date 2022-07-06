//product section
(() => {
    $token = $('meta[name="csrf_token"]').attr('content');

    // add to cart
    $('button#add-to-cart').click(async function (e) {
        e.preventDefault();
        $product_id = $(this).data('product-id');

        try {
            $(this).attr('disabled', true).find('span.text').text('Please Wait...')

            const response = await axios({
                method: 'POST',
                url: `/cart/${$product_id}/add`,
                data: {
                    _token: $token,
                    productQuantity: $('input[name="product-quantity"]').val() ?? 1
                }
            })
            const cartCount = response.data.cartCount
            $('span#cart-count').text(cartCount)
            $(this).removeClass('btn-outline-success').addClass('btn-success').find('span.text').text('Added to Cart');

            Swal.fire({
                text: 'Item has been added to your shopping cart',
                showConfirmButton: false,
                color: 'white',
                imageAlt: 'success-icon',
                imageUrl: `${window.location.origin}/frontend/images/misc/added-to-cart.png`,
                imageHeight: 75,
                background: 'rgba(0,0,0,0.6)',
                backdrop: `
                    rgba(0,0,0,0)
                `
            })
        } catch (error) {
            $(this).find('span.text').text('Add to Cart');
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: error.response.data,
                footer: '<a href="#">Why do I have this issue?</a>'
              })
        } finally {
            $(this).attr('disabled', false);
        }
    });

    // buy now
    $('button#buy-now').click(async function (e) {
        e.preventDefault();

        $product_id = $(this).data('product-id');

        try {
            $(this).attr('disabled', true).find('span.text').text('Please Wait...')

            const response = await axios({
                method: 'POST',
                url: `/cart/${$product_id}/buy`,
                data: {
                    _token: $token,
                    productQuantity: $('input[name="product-quantity"]').val()
                }
            })
            window.location.href = `${window.location.origin}/cart`

        } catch (error) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: error.response.data,
                footer: '<a href="#">Why do I have this issue?</a>'
              })
        } finally {
            $(this).attr('disabled', false).find('span.text').text('Buy Now');
        }
    });

    //increment/decrement product quantity when clicking the button
    $('div.product-modify-quantity').find('button').click(function (e) {
        e.preventDefault();

        $input_product_quantity = 'input[name="product-quantity"]'
        $product_quantity = parseInt($($input_product_quantity).val())

        if ($(this).attr('id') == "button-plus") {
            $($input_product_quantity).val($product_quantity + 1)
            return
        }

        //perform button-minus
        if ($product_quantity == 1) return
        $($input_product_quantity).val($product_quantity - 1)

    });

    //when directly modifying the input field
    $('input[name="product-quantity"]').change(function (e) {
        e.preventDefault();

        if (!$.isNumeric($(this).val())) {
            $(this).val(1);
        }
    });

    //to change displayed image in product section
    $('span.item-thumb').click(function (e) {
        e.preventDefault();
        $photo_name = $(this).data('photo')
        $('img#main-thumbnail').attr('src', `/frontend/images/items/${$photo_name}`);

    });

})();


(() => {

    $token = $('meta[name="csrf_token"]').attr('content')

    const updateQuantity = async (cartData) => {

        $input_product_quantity = `input[name="product-quantity[${$(cartData).data('id')}]"]`

        let cart = {
            id: $(cartData).data('id'),
            previousQuantity: parseInt($($input_product_quantity).val()),
            quantity: function () {
                return $(cartData).attr('id') == "button-plus" ? this.previousQuantity + 1 : this.previousQuantity - 1
            }
        }

        try {
            $(`button[data-id="${cart.id}"]`).attr('disabled', true)
            $($input_product_quantity).attr('disabled', true);

            const response = await axios({
                method: 'POST',
                url: `cart/${cart.id}/update-quantity`,
                data: {
                    _token: $token,
                    _method: 'put',
                    productQuantity: cart.quantity()
                }
            })

            const cartCount = response.data.cartCount,
                itemQuantity = response.data.itemQuantity
            $($input_product_quantity).val(itemQuantity);
            $('span#cart-count').text(cartCount)

        } catch (error) {
            alert('ayayayay! :(')
            console.log(error)
        } finally {
            $(`button[data-id="${cart.id}"]`).attr('disabled', false)
            $($input_product_quantity).attr('disabled', false);
        }
    }

    $('div.cart-modify-quantity').find('button').click(function (e) {
        e.preventDefault();
        updateQuantity(this)
    });
})();
