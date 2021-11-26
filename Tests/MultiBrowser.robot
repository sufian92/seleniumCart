*** Settings ***
Library  JSONLibrary
Library    RobotEyes
Documentation  This is some basic info about the whole suite
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/CartApp.robot  # for lower level keywords in test cases
Resource  ../Resources/JsonParser.robot  # for lower level keywords in test cases
Resource  ../Resources/DBReader.robot  # for lower level keywords in test cases
Resource  ../Data/InputData.robot  # for lower level keywords in test case


*** Test Cases ***
do visual check multiple browsers
    FOR     ${BROWSER}    IN    @{BROWSERS_TO_TEST}
            Common.Open In Browser  ${BROWSER}
            CartApp.Go To Application
            Open Eyes    SeleniumLibrary  5
            Capture Full Screen  tolerance=5  name=${BROWSER}
            Compare Images
            Common.End Web Test
    END

user should be able to add to cart from db
   @{products} =  Get Products From db
   CartApp.Go To Application
   CartApp.Add Products to Cart From JSON  @{products}
   CartApp.Verify number of products in cart
   CartApp.Procced To CheckOut
   CartApp.Verify Checkout Page Loaded
   CartApp.Verify Product List From JSON  @{products}
