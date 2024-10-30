// Import the functions you need from the SDKs you need
import {initializeApp} from "firebase/app";
import {getAnalytics} from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDTSd8Wy_4Gr3UYC-YBlwcMDml86IwWbEc",
    authDomain: "socket-fbbdb.firebaseapp.com",
    projectId: "socket-fbbdb",
    storageBucket: "socket-fbbdb.appspot.com",
    messagingSenderId: "962599905809",
    appId: "1:962599905809:web:701b526f337f56d2ed1fb0",
    measurementId: "G-CNHR64RNT9"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
