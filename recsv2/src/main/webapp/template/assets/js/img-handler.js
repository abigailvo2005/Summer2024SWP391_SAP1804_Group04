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
if($("#prop-img")) {
  $("#prop-img").on("change", function (event)  {
    getImageFile(event);
  })
}

function getImageFile(e) {
  imgFiles = Array.from(e.target.files);
}

/* Get paperwork from user */
$("#prop-pw-land").on("change", function (event) {
  getPaperworkFile(event, "land");
});
$("#prop-pw-house").on("change", function (event) {
  getPaperworkFile(event, "house");
});

function getPaperworkFile(e, type) {
  paperwork = e.target.files[0];
  fileType = type;
}

async function uploadPaperwork() {
  const file = paperwork;
  const storageRef = storage.ref(`paperwork/${file.name}`);
  const pwLandContainer = document.getElementById("land-pw-container");
  const pwHouseContainer = document.getElementById("house-pw-container");

  try {
    // Upload the file
    await storageRef.put(file);

    // Get the download URL
    const url = await storageRef.getDownloadURL();
    console.log("pw: " + url);

    // Set the URL value in the form
    if (fileType === "land") {
      pwLandContainer.setAttribute("value", url);
    } else {
      pwHouseContainer.setAttribute("value", url);
    }
  } catch (error) {
    console.error("Error uploading file:", error);
  }
  console.log("successfully upload all paperwork");
}

async function uploadImage() {
  const files = imgFiles; // Make sure this is an array of file objects
  const imageUrls = [];
  const imgContainer = document.querySelector("#img-container");
  imgContainer.innerHTML = "";

  const uploadPromises = files.map(async (file) => {
    const storageRef = storage.ref(`images/${file.name}`);
    await storageRef.put(file);
    const url = await storageRef.getDownloadURL();
    imageUrls.push(url);

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

  await Promise.all(uploadPromises);
  console.log("successfully upload all images");
}

/* Get images from user */
if($("#submit-btn")) {
  $("#submit-btn").on("click", async function (event)  {
    submitRequest(event);
  })
}



async function submitRequest(event) {
  event.preventDefault(); //Stop form from default submitting

  console.log("inside submit request");

  //disable button while uploading file
  const submitButton = document.querySelector("#submit-btn");
  submitButton.disabled = true;

  // Upload images and paperwork
  await Promise.all([uploadImage(), uploadPaperwork()]);

  // Check if all fields have values
  if (document.querySelector("form").checkValidity()) {
    console.log("after get form");
    const propertyNameInput = document.querySelector("#prop-name");
    const nameError = document.querySelector(".error-name");
    const area = document.getElementById("area").value;
    const price = document.getElementById("price").value;
    const areaNumber = parseFloat(area);
    const priceNumber = parseFloat(price);
    const minPrice = areaNumber * 20000000;
    const maxPrice = areaNumber * 50000000;
    // No errors on start up
    nameError.classList.add("hidden"); //clear all errors first

    if (priceNumber < minPrice || priceNumber > maxPrice) {
      Swal.fire({
        title: "Are you sure about this price?",
        text: "Current price might be too high or too low for this property.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes",
      }).then((result) => {
        if (!result.isConfirmed) {
          Swal.fire({
            title: "Choose another price.",
            icon: "success",
          });
          document.getElementById("price").value = "";
          submitButton.disabled = false;
        } else {
          {
            if (propertyNameInput.value.length > 32) {
              //Check if property's name is longer than 32 characters
              nameError.classList.remove("hidden");
              return;
            }

            // Submit form
            document.querySelector("form").submit();
          }
        }
      });
    } else {
      document.querySelector("form").reportValidity();
    }
  }
}

/* function to update paperwork */
if($("#submit-land-btn") || $("#submit-house-btn")) {
  $("#submit-land-btn").on("click", async function (event)  {
    changePaperwork(event);
  })
  $("#submit-house-btn").on("click", async function (event)  {
    changePaperwork(event);
  })
}

async function changePaperwork(event) {
  console.log("changing pw");
  event.preventDefault(); //Stop form from default submitting
  const file = paperwork;
  const storageRef = storage.ref(`paperwork/${file.name}`);
  const pwLandContainer = document.getElementById("land-pw-container");
  const pwHouseContainer = document.getElementById("house-pw-container");

  try {
    // Upload the file
    await storageRef.put(file);

    // Get the download URL
    const url = await storageRef.getDownloadURL();
    console.log("pw: " + url);

    // Set the URL value in the form
    if (fileType === "land") {
      pwLandContainer.setAttribute("value", url);
      pwHouseContainer.setAttribute("value", "none");

      //submit form after save url successfully
      $("#form-change-land-pw").submit();
    } else {
      pwHouseContainer.setAttribute("value", url);

      //submit form after save url successfully
      $("#form-change-house-pw").submit();
    }
  } catch (error) {
    console.error("Error uploading file:", error);
  }
  console.log("successfully upload all paperwork");
}
