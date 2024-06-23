 /* Set color for different status value */
 const statusElements = document.querySelectorAll(".status-color");
 statusElements.forEach((element) => {
   element.classList.remove(
     "status-reviewing",
     "status-validating",
     "status-unqualified",
     "status-displayed",
     "status-closed",
     "status-handled",
     "status-agency-approving",
     "status-buyer-approving"
   );
 });
 // Display colors according to status value
 statusElements.forEach((element) => {
   const statusValue = element.getAttribute("value");
   switch (statusValue.toLowerCase()) {
    case "assigned": //job status
    case "reviewing":
       element.classList.add("status-reviewing");
       break;
     case "validating":
       element.classList.add("status-validating");
       break;
     case "unqualified":
       element.classList.add("status-unqualified");
       break;
     case "displayed":
     case "closed":
     case "handled":
       element.classList.add("status-displayed");
       break;
     case "agency approving":
     case "buyer approving":
       element.classList.add("status-agency-approving");
       break;
     default:
       break;
   }
 });


