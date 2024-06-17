// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCwRDXKf3llznMX8FP292wfrK67msU97JA",
  authDomain: "recs-c00d5.firebaseapp.com",
  projectId: "recs-c00d5",
  storageBucket: "recs-c00d5.appspot.com",
  messagingSenderId: "530303435793",
  appId: "1:530303435793:web:5c1a45c34d7ace95719db0",
  measurementId: "G-YVYYJHF754",
};

// Initialize Firebase
const app = firebase.initializeApp(firebaseConfig);
const storage = firebase.storage();
var imgFiles = null;
var paperwork = null;
var fileType = null;

/* Get images from user */
document.getElementById("prop-img").addEventListener("change", (event) => {
  getImageFile(event);
});

function getImageFile(e) {
  imgFiles = Array.from(e.target.files);
}

/* Get paperwork from user */
document.getElementById("prop-pw-land").addEventListener("change", (event) => {
  getPaperworkFile(event, "land");
});
document.getElementById("prop-pw-house").addEventListener("change", (event) => {
  getPaperworkFile(event, "house");
});

function getPaperworkFile(e, type) {
  paperwork = e.target.files[0];
  fileType = type;
}

document
  .getElementById("submit-btn")
  .addEventListener("click", uploadPaperwork);

async function uploadPaperwork() {
  const file = paperwork;
  const pwLandContainer = document.querySelector("#land-pw-container");
  const pwHouseContainer = document.querySelector("#house-pw-container");
  pwLandContainer.value = ""; //remove all previous options
  pwHouseContainer.value = ""; //remove all previous options
  var url = null;

  // Storage reference for paperwork file
  const storageRef = storage.ref(`paperwork/${file.name}`);

  try {
    // Upload file to Firebase Storage
    await storageRef.put(file);

    // Get image's URL from storage
    url = await storageRef.getDownloadURL();
    
  } catch (error) {
    console.error("Error uploading zip/pdf file to storage:", error);
  }

  // Let URL be included in form for controller submission
  if(fileType == "land") {
    pwLandContainer.value = url;
  } else {
    pwHouseContainer.value = url;
  }

}

/* Upload images to Firebase storage */
document.getElementById("submit-btn").addEventListener("click", uploadImage);
async function uploadImage() {
  const files = imgFiles;
  const imageUrls = [];
  const imgContainer = document.querySelector("#img-container");
  imgContainer.innerHTML = ""; //remove all previous options
  var url = null;

  for (const file of files) {
    // Storage reference for images
    const storageRef = storage.ref(`images/${file.name}`);

    try {
      // Upload file to Firebase Storage
      await storageRef.put(file);

      // Get image's URL from storage
      url = await storageRef.getDownloadURL();
      imageUrls.push(url);
    } catch (error) {
      console.error("Error pushing images to storage:", error);
    }
  }

  // Push image URLs to form for controller submission
  imageUrls.forEach((url) => {
    const item = document.createElement("input");
    item.type = "checkbox";
    item.value = url;
    item.name = "images";
    item.checked = true;

    const label = document.createElement("label");
    label.textContent = url;

    const checkboxWrapper = document.createElement("div");
    checkboxWrapper.classList.add("checkbox-wrapper");
    checkboxWrapper.appendChild(item);
    checkboxWrapper.appendChild(label);

    imgContainer.appendChild(checkboxWrapper);
  });
}