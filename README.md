# PARSIQ-CryptoPunks

We created PARSIQ Platform Smart Triggers that react to CryptoPunks directly related on-chain events and follow custom logic to deliver all necessary transaction information about the price action.

Offers for Sale of the limited CryptoPunks collection are particularly vital to traders and collectors. New listings might prove to be an opportunity to profit from the immediate purchase. While for traders new sales provide indicators for the health of demand/supply within the collections as well as for the market, in general.

The Link to the project on PARSIQ: https://portal.parsiq.net/monitoring/projects/6ba2e00f-813c-4f5c-bf36-c5d53cbd7791/triggers

Cryptopunks is the NFT collection of 10000 uniquely generated characters. The collection has a highest market capitalisation and market volume as of Novemeber 4th 2021. 
![image](https://user-images.githubusercontent.com/66903336/140242896-9c339336-e36b-4388-8aa9-56760bf8cd4a.png)

## Simple Walkthrough

1. We created PARSIQ account and created an Empty project instead of a template as it allows us to edit the trigger code.
![image](https://user-images.githubusercontent.com/66903336/140244531-09e16a47-fa12-40f6-bc77-7d139a8be8f4.png)

2. Next, to monitor an NFT collection we need to add its contract ABI in the User stream on PARSIQ platform. [Link to CryptoPunks Contract](https://etherscan.io/address/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb#code)![image](https://user-images.githubusercontent.com/66903336/140244623-07f2cb8d-c07c-448d-a9d3-809bb6d66600.png) 
3. We also added the events and functions of the contract so that we could use them with ParsiQL to create a trigger. In our instance, we added the events such as PunkOffered, PunkBidEntered and PunkBidWithdrawn![image](https://user-images.githubusercontent.com/66903336/140245677-1355f8de-9bd4-4850-9388-94e4089fc56a.png)
![image](https://user-images.githubusercontent.com/66903336/140245798-6aa9de77-8914-4074-82ac-724fe96604e2.png)

4. We also included preferred transports to get the necessary data. There are four options: Web, Discord, Telegram and Google Sheets. In this project we implemented both Telegram and Google Sheets transports.![image](https://user-images.githubusercontent.com/66903336/140244988-802f2a80-2891-4296-b05a-2d1980c34216.png)![image](https://user-images.githubusercontent.com/66903336/140248078-da40363b-b7f3-42ae-bf3e-af89f2f0208a.png)

5. Furthermore, in our Project we created multiple triggers with ParsiQL, deployed them and added transports. Here are some details on the code and configuration:
![image](https://user-images.githubusercontent.com/66903336/140245135-0fb95114-583a-47b8-86f0-8916d27031f5.png)
![image](https://user-images.githubusercontent.com/66903336/140251634-7ab5aeeb-613b-4921-8e32-718ae099d980.png)
![image](https://user-images.githubusercontent.com/66903336/140245247-786fa2bd-9805-41fb-b281-b7ccf7fbbb90.png)
![image](https://user-images.githubusercontent.com/66903336/140245287-348d09c4-b07d-4762-b06a-7034bda3d7bd.png)
![image](https://user-images.githubusercontent.com/66903336/140252175-9c2a8c1e-002c-4fe4-9e90-d105efedd367.png)
![image](https://user-images.githubusercontent.com/66903336/140252248-16511115-7a69-466d-b81e-96cac41be8a5.png)

6. The results are as following:
![image](https://user-images.githubusercontent.com/66903336/140245930-f13d5142-a84e-4bb4-a668-1d66c857c8f4.png)
![image](https://user-images.githubusercontent.com/66903336/140245977-f45f38d5-fa97-40eb-9705-d8802006d427.png)

## Next Steps

To further develop and grow the project we propose to build a web app that takes these signals and combines external data such as the one from Opensea to assist traders and collectors.

