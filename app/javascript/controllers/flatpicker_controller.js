import flatpickr from "flatpickr";

const startDateInput = document.getElementById('booking_start_time');
const endDateInput = document.getElementById('booking_end_time');

if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#post-booking-dates').dataset.unavailable)
endDateInput.disabled = true

flatpickr(startDateInput, {
  disable: unavailableDates,
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  altInput: true,
  altFormat: "F j, Y H:i",
});

console.log('Controller Connected')
startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: unavailableDates,
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    altInput: true,
    altFormat: "F j, Y H:i",
    });
  })
};
