*** Settings ***
Library  JSONLibrary

*** Variables ***
${json_file} =  Data/CartItems.json
${json_object}

*** Keywords ***


Get Products From Json
	@{products_from_json} =  Load JSON From File     ${json_file}
	@{products}  Create List
	FOR    ${json_product}    IN    @{products_from_json}
        ${name} =        Get Value From Json     ${json_product}   $..ProductName
        ${qty} =        Get Value From Json     ${json_product}   $..Quantiry
        ${price} =        Get Value From Json     ${json_product}   $..Price
        ${total} =        Get Value From Json     ${json_product}   $..Total
        ${product} =  Create Dictionary  ProductName=${name}[0]  Quantiry=${qty}[0]  Price=${price}[0]  Total=${total}[0]
        Log  ${product}
        Append To List  ${products}  ${product}
    END
    [Return]        ${products}

Get Products With Search Codes
	@{products_from_json} =  Load JSON From File     ${json_file}
	@{products}  Create List
	FOR    ${json_product}    IN    @{products_from_json}
	    ${name} =        Get Value From Json     ${json_product}   $..ProductName
        ${qty} =        Get Value From Json     ${json_product}   $..Quantiry
        ${price} =        Get Value From Json     ${json_product}   $..Price
        ${total} =        Get Value From Json     ${json_product}   $..Total
        @{search_from_json} =        Get Value From Json     ${json_product}   $..search
        @{searches}  Create List
        FOR    ${search}    IN    @{search_from_json}
            ${code_one_json} =        Get Value From Json     ${search}   $..codeOne
            ${code_Two_json} =        Get Value From Json     ${search}   $..codeTwo
            ${code_Three_json} =        Get Value From Json     ${search}   $..codeThree
            ${search} =  Create Dictionary  codeOne=${code_one_json}[0]  codeTwo=${code_Two_json}[0]  codeThree=${code_Three_json}[0]
            Append To List  ${searches}  ${search}
        END
        ${product} =  Create Dictionary  ProductName=${name}[0]  Quantiry=${qty}[0]  Price=${price}[0]  Total=${total}[0]  Search=${searches}
        Append To List  ${products}  ${product}
    END
    Log  ${products}
    [Return]        ${products}
