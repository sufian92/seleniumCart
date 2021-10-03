*** Settings ***
Resource  ../Resources/PO/ProductsPage.robot
Resource  ../Resources/PO/CheckOutPage.robot



*** Keywords ***
Go To Application
    ProductsPage.load

Add Products to Cart
    ProductsPage.Verify Page Loaded
    ProductsPage.Add Products to Cart

Add Products to Cart From JSON
    [Arguments]  @{products}
    ProductsPage.Verify Page Loaded
    ProductsPage.Add Products to Cart From JSON  @{products}

Verify number of products in cart
    ProductsPage.Verify number of products in cart


Procced To CheckOut
    ProductsPage.Procced To CheckOut

Verify Product List
    CheckOutPage.Verify Product List

Verify Product List From JSON
    [Arguments]  @{products}
    CheckOutPage.Verify Product List From JSON  @{products}

Verify Checkout Page Loaded
    CheckOutPage.Verify Page Loaded