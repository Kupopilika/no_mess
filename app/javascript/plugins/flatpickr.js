import flatpickr from "flatpickr";

const initDate = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    dateFormat: "d/m/Y"
  });
}

export { initDate };
