navigator.nfc.watch((message) => {
  if (message.data[0].recordType != 'empty') {
    alert('Read message written by ' + message.url);
    processMessage(message);
  }
});

function processMessage(message) {
  for (let record of message.data) {
    switch (record.recordType) {
      case "text":
        alert('Data is text: ' + record.data);
        break;
      case "url":
        alert('Data is URL: ' + record.data);
        break;
      case "json":
        alert('JSON data: ' + record.data.myProperty.toString());
        break;
      // case "opaque":
      //   if (record.mediaType == 'image/png') {
      //     var img = document.createElement("img");
      //     img.src = URL.createObjectURL(new Blob(record.data, record.mediaType));
      //     img.onload = function() {
      //       window.URL.revokeObjectURL(this.src);
      //     };
      //   }
        break;
    }
  }