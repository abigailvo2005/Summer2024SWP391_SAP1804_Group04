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
    "status-buyer-approving",
    "status-denied",
    "status-connected"
  );
});
// Display colors according to status value
statusElements.forEach((element) => {
  const statusValue = element.getAttribute("value");
  switch (statusValue.toLowerCase()) {
    case "assigned": //job status
      element.classList.add("status-reviewing");
      break;
    case "validating":
    case "reviewing":
    case "created":
    case "marketed":
      element.classList.add("status-validating");
      break;
    case "denied":
    case "unqualified":
    case "fail":
    case "cancelled":
      element.classList.add("status-unqualified");
      break;
    case "connected":
    case "displayed":
    case "closed":
    case "handled":
    case "accepted":
    case "active":
    case "successful":
    case "connected":
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
