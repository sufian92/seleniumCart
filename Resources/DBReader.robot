*** Settings ***
Library     DatabaseLibrary

*** Variables ***
${dbname} =  'cart'
${dbuser} =  'root'
${dbpasswd} =  'kingkong7'
${dbhost} =  'localhost'
${dbport} =  3306
@{queryResults}

*** Keywords ***

Get Products From db
   Connect To Database Using Custom Params  pymysql  database=${dbname}, user=${dbuser}, password=${dbpasswd}, host=${dbhost}, port=${dbport}

   @{queryResults} =  Query  SELECT ProductName, Quantiry, Price, Total FROM Products
   @{products}  Create List
	FOR    ${result}    IN    @{queryResults}

        ${product} =  Create Dictionary  ProductName=${result}[0]  Quantiry=${result}[1]  Price=${result}[2]  Total=${result}[3]
        Log  ${product}
        Append To List  ${products}  ${product}
    END
    Log  ${products}
    [Return]        ${products}

Truncate DB
    Connect To Database Using Custom Params  pymysql  database=${dbname}, user=${dbuser}, password=${dbpasswd}, host=${dbhost}, port=${dbport}
    Execute SQL String  TRUNCATE TABLE Products