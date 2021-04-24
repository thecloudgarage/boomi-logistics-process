## Create oAuth and enable Google Sheets/Drive API
* Prequisite: Retrive the Boomi Account ID from ATOMSPHERE CONSOLE > SETTINGS > ACCOUNT INFO & SETUP
* Visit https://console.cloud.google.com/apis 
* CREATE PROJECT > DASHBOARD > ENABLE API & SERVICES > SEARCH SHEETS > SELECT GOOGLE SHEETS API > ENABLE
* LEFT HAND MENU > API & SERVICES > DASHBOARD
* DASHBOARD > ENABLE API & SERVICES > SEARCH DRIVE > GOOGLE DRIVE API ENABLE
* LEFT HAND MENU > API & SERVICES > CREDENTIALS
* CONFIGURE CONSENT SCREEN > USER TYPE > EXTERNAL > CREATE
* APP NAME > <ANY_RELEVANT_NAME> > FILL SUPPORT EMAIL AND DEVELOPER CONTACT INFORMATION > NEXT > LEAVE SCOPES AS-IS > LEAVE USERS AS-IS > CREATE
* * LEFT HAND MENU > API & SERVICES > CREDENTIALS > CREATE CREDENTIALS > OAUTH CLIENT ID > APPLICATION TYPE > WEB APPLICATION > GIVE IT A NAME > AUTHORIZED REDIRECT URIs > https://platform.boomi.com/account/<BOOMI-ACCOUNT-ID>/oauth2/callback
* CLICK ON THE GENERATED CREDENTIALS AND RIGHT-HAND SIDE (COPY CLIENT ID, CLIENT SECRET)
* GO BACK TO OAUTH CONSENT SCREEN FROM LEFT HAND MENU AND PUBLISH APP > PUSH TO PRODUCTION > PUBLISH

## Create a sample google sheets
* From the browser go to Google Sheets and login with the ID used to create the above app and creds
* Create a new test sheet and create with some test data (1st row will be column headers)
* Note the spreadsheet ID url/d/<spreadsheet-id>/....

## BOOMI SETUP
* Atomsphere > Build
* New Folder > New Component > Process > Give a name
* Add Start shape > no data
* Connector > Google Sheets > Display Name (something) > Action QUERY (we want to read data and not download the sheet, if you want to download then GET)
* Connection > New > Paste the Client ID & CLIENT SECRET > Generate token > you will see a browser redirect to google auth > Select the account you want to use to generate token
* Since the Google API app was published without verification, you will need to go unsafe on this consent screen > Google hasn't verified this app > advanced > go to boomi.com unsafe
* Grant permissions to boomi > Allow
* Go back to Boomi console and you will see a successful token generation > save > test connection using an atom and upon success > save and close
* Now for Google sheets connector operations > new > click on import > select atom and the connection (create in previous step) > spreadsheet ID > for now leave the sheet title blank as our test spreadsheet has only one sheet. Else we could specify the sheet name if the spreadsheet has multiple sheets > click on the option 1st row as column headers > Initial colum (e.g. A and) Final column (e.g. B) > Next > Object Type: RecordData > Finish > Save and close > Save and close the main connector

## NOW YOU CAN USE THE GOOGLE SHEETS DATA FROM THE SHEETS IN ANY MAP, DISK OR ANY OTHER CONNECTOR
