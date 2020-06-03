import * as ScanditSDK from "scandit-sdk";
import { fetchWithToken } from "../utils/fetch_with_token";



const initScandit = () => {
  const scanner = document.getElementById("scandit-barcode-picker");
  //console.log(scanner.dataset.scanditKey);
  if(scanner){
    ScanditSDK.configure(scanner.dataset.scanditKey, {
      engineLocation: "https://unpkg.com/scandit-sdk@4.6.0/build"
      });
    ScanditSDK.BarcodePicker.create(scanner, {
      playSoundOnScan: true,
      vibrateOnScan: true,
    }).then(function (barcodePicker) {
      // barcodePicker is ready here to be used (rest of the tutorial code should go here)
      const scanSettings = new ScanditSDK.ScanSettings({
        blurryRecognition: true,
        gpuAcceleration: true,
        enabledSymbologies: ["ean13"],
        codeDuplicateFilter: 4000
      });
      barcodePicker.applyScanSettings(scanSettings);
      barcodePicker.on("scan", function(scanResult) {
        console.log(scanResult.barcodes[0].data)
        const result = scanResult.barcodes[0].data;

        fetchWithToken("/ingredients", {
          method: "POST",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ ean: result})
        }).then(response => response.json())
          .then((data) => {
            console.log(data)
            window.location = '/user_ingredients/new?'
          });


        // const url = `https://world.openfoodfacts.org/api/v0/product/${result}.json`;
        // console.log(url);

        // fetch(url, {
        //   method: 'GET',
        // })
        // .then(response => response.json())
        // .then((data) => {
        //   console.log(data)
        //   console.log(data.product.image_url)
        //   console.log(data.product.product_name)
        //   console.log(data.product.quantity)
        // });


      })
    });
  }
}



export { initScandit }
