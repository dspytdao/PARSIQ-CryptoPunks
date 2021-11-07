# PARSIQ-CryptoPunks

We created three PARSIQ Platform Smart Triggers that respond to CryptoPunks directly related on-chain events and follow custom logic to deliver all necessary transaction information about the price action.

Offers for Sale of the limited CryptoPunks collection are particularly vital to traders and collectors. New listings might prove to be an opportunity to profit from the immediate purchase. Meanwhile for traders new sales provide indicators for the demand/supply within the collections as well as for the market, in general.

The Link to the project on PARSIQ: https://portal.parsiq.net/monitoring/projects/6ba2e00f-813c-4f5c-bf36-c5d53cbd7791/triggers

Cryptopunks is the NFT collection of 10000 uniquely generated characters. The collection has a highest market capitalisation and market volume as of Novemeber 4th 2021. 
![image](https://user-images.githubusercontent.com/66903336/140242896-9c339336-e36b-4388-8aa9-56760bf8cd4a.png)

## Simple Walkthrough

1. We created PARSIQ account and created an Empty project instead of a template as it allows us to edit the trigger code.
![image](https://user-images.githubusercontent.com/66903336/140244531-09e16a47-fa12-40f6-bc77-7d139a8be8f4.png)

2. Next, to monitor an NFT collection we need to add its contract ABI in the User stream on PARSIQ platform. [Link to CryptoPunks Contract](https://etherscan.io/address/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb#code) We select the ABI straight from the page or export into RAW/TEXT format and upload to the Platform. ![image](https://user-images.githubusercontent.com/66903336/140627741-bea5116d-0b93-4f4d-af08-6fb4e321223e.png)
 ![image](https://user-images.githubusercontent.com/66903336/140244623-07f2cb8d-c07c-448d-a9d3-809bb6d66600.png) 
3. We also added the events and functions of the contract so that we could use them with ParsiQL to create a trigger. In our instance, we added the events such as PunkOffered, PunkBidEntered and PunkBidWithdrawn![image](https://user-images.githubusercontent.com/66903336/140245677-1355f8de-9bd4-4850-9388-94e4089fc56a.png)
![image](https://user-images.githubusercontent.com/66903336/140245798-6aa9de77-8914-4074-82ac-724fe96604e2.png)

4. We also included transports to get the necessary data. There are four options: Web, Discord, Telegram and Google Sheets. In this project we implemented Web, Telegram and Google Sheets transports.![image](https://user-images.githubusercontent.com/66903336/140609658-ff4d5370-c200-4904-9e4f-1db2d2e38504.png)

5. Furthermore, in our Project we created multiple triggers with ParsiQL, deployed them and added transports. Here are some details on the code and configuration:
![image](https://user-images.githubusercontent.com/66903336/140609712-a9a03f36-60b8-4e35-b46d-0bede069844d.png)
![image](https://user-images.githubusercontent.com/66903336/140251634-7ab5aeeb-613b-4921-8e32-718ae099d980.png)
![image](https://user-images.githubusercontent.com/66903336/140609790-05521031-d2b7-4904-a67f-3b3a9412eb60.png)
![image](https://user-images.githubusercontent.com/66903336/140245287-348d09c4-b07d-4762-b06a-7034bda3d7bd.png)
![image](https://user-images.githubusercontent.com/66903336/140252175-9c2a8c1e-002c-4fe4-9e90-d105efedd367.png)
![image](https://user-images.githubusercontent.com/66903336/140609810-cab8491b-0839-429b-9e9a-47f8c886f0b8.png)
![image](https://user-images.githubusercontent.com/66903336/140252248-16511115-7a69-466d-b81e-96cac41be8a5.png)

6. The results are as following:

We get immediate notifications through a telegram bot in the private channel
![image](https://user-images.githubusercontent.com/66903336/140609836-eb44988a-9017-4802-bb92-17279241a2f8.png)

By using ngrok, we recieve the post request from the triggers. For two out of three trigger we also post the data back on the Platform to update the User Tables with NodeJs.
* [How to use ngrok with Windows and Visual Studio to test webhooks](https://www.twilio.com/docs/usage/tutorials/how-use-ngrok-windows-and-visual-studio-test-webhooks)
```
var express = require('express')
var request = require('request')

var app = express()
app.use(express.json())

app.post('/', function(req, res) {
    console.log(JSON.stringify(req.body));
    var options = {
        'method': 'POST',
        'url': 'https://api.parsiq.net/v1/data/14dff863-0463-45c8-a0a9-6e986d45aed1',
        'headers': {
          'Authorization': 'Bearer 0009e789d7e8d1239073f5b3e402580b2b32ed54aa31874c2c3e6eac3652a759',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify([
          {
            "address": req.body.fromAddress,
            "Punk": req.body.punkIndex,
            "Event":req.body.event
          }
        ])};
    
    request(options);
    res.end();
})
const port = process.env.PORT || 3000

app.listen(port, () => console.log(`Application listening on port ${port}`))
```


We also configured three separate Google Sheet spreadsheets that serve as real time database for CryptoPunks collection.

1. https://docs.google.com/spreadsheets/d/1eld-RtjigW1hW12OzWV9Cguc3Kcyd77OqGe3lLuyRT4/edit?usp=sharing
2. https://docs.google.com/spreadsheets/d/1b5sGe996vq15jrrKPPajlFNpUDM81mpdmyAh0THn1Cw/edit?usp=sharing
3. https://docs.google.com/spreadsheets/d/16aFiahFzQMvKdXnnHTVTDvcknioHmiZqRK8Asr5Kz7c/edit?usp=sharing

## Additional resources
### PARSIQ YouTube Videos

[PARSIQ Use Case: AML Risk Monitoring](https://www.youtube.com/watch?v=BeRhLAI2xf4&t)

[PARSIQ Use Case: Wallet Security Surveillance + Whitelisting](https://www.youtube.com/watch?v=3MFqwuLxtQk)
