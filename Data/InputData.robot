*** Variables ***
@{_tmp}
    ...  browserName: chrome

${BROWSER} =  chrome
${URL} =  https://rahulshettyacademy.com/seleniumPractise/#/
${CAPABILITIES}     ${EMPTY.join(${_tmp})}
${remote_url}       http://3.145.6.54:30641/wd/hub
&{PRODUCT_ONE}  ProductName=Cauliflower - 1 Kg  Quantiry=1  Price=60  Total=60
&{PRODUCT_TWO}  ProductName=Beetroot - 1 Kg  Quantiry=1  Price=32  Total=32
&{PRODUCT_THREE}  ProductName=Brinjal - 1 Kg  Quantiry=1  Price=35  Total=35
@{PRODUCTS} =  ${PRODUCT_ONE}  ${PRODUCT_TWO}  ${PRODUCT_THREE}