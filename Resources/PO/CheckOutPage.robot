*** Settings ***
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${PLACE_ORDER} =  css=.discountAmt ~ button



*** Keywords ***

Verify Page Loaded
    WAIT UNTIL ELEMENT IS VISIBLE  ${PLACE_ORDER}

Verify Product List
    @{PRODUCTS_FROM_TABLE}  Create List
    @{PRODUCT_TABLE}  Get WebElements  css=tbody tr
    @{PRODUCT_NAMES}  Get WebElements  css=.product-name
    @{PRODUCT_QUNTITIES}  Get WebElements  css=.quantity
    @{PRODUCT_PRICES}  Get WebElements  css=tbody tr td:nth-child(4) .amount
    @{PRODUCT_TOTALS}  Get WebElements  css=tbody tr td:nth-child(5) .amount
    ${index}  Set Variable  0
    ${counter}  set variable  1
    FOR     ${product_element}    IN    @{PRODUCT_TABLE}
            ${name}  get text  ${PRODUCT_NAMES}[${index}]
            ${qty}  get text  ${PRODUCT_QUNTITIES}[${index}]
            ${price}  get text  ${PRODUCT_PRICES}[${index}]
            ${total}  get text  ${PRODUCT_TOTALS}[${index}]
            ${PRODUCT} =  Create Dictionary  ProductName=${name}  Quantiry=${qty}  Price=${price}  Total=${total}
            Log  ${PRODUCT}
            Append To List  ${PRODUCTS_FROM_TABLE}  ${PRODUCT}
            ${index} =  Evaluate  ${index } + ${counter}

    END
    Log  ${PRODUCTS}
    Log  ${PRODUCTS_FROM_TABLE}
    lists should be equal  ${PRODUCTS}  ${PRODUCTS_FROM_TABLE}

Verify Product List From JSON
    [Arguments]  @{products}
    @{PRODUCTS_FROM_TABLE}  Create List
    @{PRODUCT_TABLE}  Get WebElements  css=tbody tr
    @{PRODUCT_NAMES}  Get WebElements  css=.product-name
    @{PRODUCT_QUNTITIES}  Get WebElements  css=.quantity
    @{PRODUCT_PRICES}  Get WebElements  css=tbody tr td:nth-child(4) .amount
    @{PRODUCT_TOTALS}  Get WebElements  css=tbody tr td:nth-child(5) .amount
    ${index}  Set Variable  0
    ${counter}  set variable  1
    FOR     ${product_element}    IN    @{PRODUCT_TABLE}
            ${name}  get text  ${PRODUCT_NAMES}[${index}]
            ${qty}  get text  ${PRODUCT_QUNTITIES}[${index}]
            ${price}  get text  ${PRODUCT_PRICES}[${index}]
            ${total}  get text  ${PRODUCT_TOTALS}[${index}]

            ${qty_int} =  Convert To Integer  ${qty}
            ${price_int}  Convert To Integer  ${price}
            ${total_int}  Convert To Integer  ${total}

            ${PRODUCT} =  Create Dictionary  ProductName=${name}  Quantiry=${qty_int}  Price=${price_int}  Total=${total_int}
            Log  ${PRODUCT}
            Append To List  ${PRODUCTS_FROM_TABLE}  ${PRODUCT}
            ${index} =  Evaluate  ${index } + ${counter}

    END
    Log  ${products}
    Log  ${PRODUCTS_FROM_TABLE}
    lists should be equal  ${products}  ${PRODUCTS_FROM_TABLE}
