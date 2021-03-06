*** Settings ***
Library  JSONLibrary
Library    RobotEyes
Documentation  This is some basic info about the whole suite
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/CartApp.robot  # for lower level keywords in test cases
Resource  ../Resources/JsonParser.robot  # for lower level keywords in test cases
Resource  ../Resources/DBReader.robot  # for lower level keywords in test cases
Resource  ../Data/InputData.robot  # for lower level keywords in test case
Test Setup  Common.Begin Web Test Grid
Test Teardown  Common.End Web Test



*** Test Cases ***

user should be able to add to cart
   CartApp.Go To Application
   CartApp.Add Products to Cart
   CartApp.Verify number of products in cart
   CartApp.Procced To CheckOut
   CartApp.Verify Checkout Page Loaded
   CartApp.Verify Product List


user should be able to add to cart from json
   @{products} =  Get Products From Json
   CartApp.Go To Application
   CartApp.Add Products to Cart From JSON  @{products}
   CartApp.Verify number of products in cart
   CartApp.Procced To CheckOut
   CartApp.Verify Checkout Page Loaded
   CartApp.Verify Product List From JSON  @{products}


user should be able to search
   @{searches} =  Get Products With Search Codes


Sample visual regression test case  # Name of the example test case
    CartApp.Go To Application
    Open Eyes    SeleniumLibrary  5
    Capture Full Screen
    Compare Images

