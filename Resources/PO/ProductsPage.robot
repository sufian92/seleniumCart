*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PRODUCTS_CONTAINER} =  css=.products
${CART} =  xpath=//td[text() = "Items"]/../td[3]/strong
${CART_ICON} =  css=.cart-icon
${CHECKOUT} =  css=.action-block button
${SEARCH_BAR} =  css=.search-keyword
${SEARCH_BUTTON} =  css=.search-button
${PRODUCT_NAME} =  css=.product-name

*** Keywords ***
Load
    Go To  ${URL}

Verify Page Loaded
    WAIT UNTIL ELEMENT IS VISIBLE  ${PRODUCTS_CONTAINER}

Add Products to Cart
    FOR    ${product}    IN    @{PRODUCTS}
        Add Product to Cart  ${product.ProductName}
    END

Add Products to Cart From JSON
    [Arguments]  @{products}
    FOR    ${product}    IN    @{products}
        Log  ${product}
        Add Product to Cart  ${product.ProductName}
    END

Add Product to Cart
    [Arguments]  ${product}
    @{PRODUCT_ELEMENTS}  Get WebElements  css=.product .product-name
    @{PRODUCT_CART_BUTTONS}  Get WebElements  css=.product .product-action button
    ${index}  Set Variable  0
    ${counter}  set variable  1
    FOR     ${product_element}    IN    @{PRODUCT_ELEMENTS}
            ${text}  get text  ${product_element}
            run keyword if  '${text}'=='${product}'  click button  ${PRODUCT_CART_BUTTONS}[${index}]
            ${index} =  Evaluate  ${index } + ${counter}
    END

Verify number of products in cart
    ${cnt} =  Get length   ${PRODUCTS}
    element text should be  ${CART}  ${cnt}

Procced To CheckOut
    click element  ${CART_ICON}
    wait until element is visible  ${CHECKOUT}
    click button  ${CHECKOUT}

Search Product
    [Arguments]  ${product}
    input text  ${SEARCH_BAR}  ${product}
    click button  ${SEARCH_BUTTON}

Verify Product Is Shown
    [Arguments]  ${product}
    element should contain  ${PRODUCT_NAME}  ${product}
    clear element text  ${SEARCH_BAR}


