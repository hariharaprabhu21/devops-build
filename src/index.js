import React from 'react';
import ReactDOM from 'react-dom/client'; // Use the correct import from react-dom
import App from './App';  // Ensure this path is correct

// Make sure to use createRoot to render the app
const root = ReactDOM.createRoot(document.getElementById('root')); 
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
