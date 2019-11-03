const dateCalendar = () => {
  console.log('date');
  let day = document.getElementsByClassName('tableau fourlembach visites')[0].dataset.day;
  let elements = document.querySelectorAll(`.${day}`);
  elements.forEach((item) => {
    item.classList.add("day-color");
  });
}

const blockedDates = () => {
  console.log("dates");
  let cells = document.querySelectorAll(".blocked");
  cells.forEach((item) => {
    item.parentNode.classList.add("cell-blocked");
  });
}
const cellToday = () => {
 let today = document.getElementById("today").dataset.today;
 let days = document.querySelectorAll(".date");
 days.forEach((date) => {
  if (date.dataset.day === today) {
    date.parentNode.classList.add("today");
  }
 });
 console.log(today);
}

export { dateCalendar };
export { blockedDates };
export { cellToday };
