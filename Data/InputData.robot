*** Variables ***
@{_tmp_chrome}
    ...  browserName: chrome

@{_tmp_chrome}
    ...  browserName: chrome
@{_tmp_firefox}
    ...  browserName: firefox
@{_tmp_edge}
    ...  browserName: MicrosoftEdge


${BROWSER} =  headlesschrome
${URL} =  https://rahulshettyacademy.com/seleniumPractise/#/
${CAPABILITIES}     ${EMPTY.join(${_tmp})}
${CAPABILITIESCHROME}     ${EMPTY.join(${_tmp_chrome})}
${CAPABILITIESFIREFOX}     ${EMPTY.join(${_tmp_firefox})}
${CAPABILITIESEDGE}     ${EMPTY.join(${_tmp_edge})}
${remote_url}       http://18.118.211.236:30641/wd/hub
&{PRODUCT_ONE}  ProductName=Cauliflower - 1 Kg  Quantiry=1  Price=60  Total=60
&{PRODUCT_TWO}  ProductName=Beetroot - 1 Kg  Quantiry=1  Price=32  Total=32
&{PRODUCT_THREE}  ProductName=Brinjal - 1 Kg  Quantiry=1  Price=35  Total=35
@{PRODUCTS} =  ${PRODUCT_ONE}  ${PRODUCT_TWO}  ${PRODUCT_THREE}
@{BROWSERS_TO_TEST} =  'chrome'  'edge'  'firefox'