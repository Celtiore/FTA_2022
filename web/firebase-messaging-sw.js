importScripts('https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js');

const firebaseConfig = {
  apiKey: "AIzaSyCkfpHKR3y1nDnIBq_Go--RmGf3pQx3U0g",
  authDomain: "foodtrucks-addict.firebaseapp.com",
  projectId: "foodtrucks-addict",
  storageBucket: "foodtrucks-addict.appspot.com",
  messagingSenderId: "929604283",
  appId: "1:929604283:web:0cbb8a1918008a32087f9e",
  measurementId: "G-Y5P5W0BPWT"
};
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

/*messaging.onMessage((payload) => {
console.log('Message received. ', payload);*/
messaging.onBackgroundMessage(function (payload) {
  console.log('Received background message ', payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
  };

  self.registration.showNotification(notificationTitle,
    notificationOptions);
});

