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
let datesSelect = () => {

  console.log("date Select");
  const calendar = document.querySelector(".calendars");
  let days = calendar.querySelectorAll(".day");
  days.forEach((day) => {
    day.addEventListener("click", (event) => {
      let array = [];
      //const dayselected = { dateString: "", dateNumber: 0}

      function dayselected(date) {
        this.date = date;
        this.number = Date.parse(date);
      }
      let y = "";
      console.log(event.currentTarget);
      let x = new dayselected(event.currentTarget.firstElementChild.dataset.day);
      debugger;
    });
  });
}

export { dateCalendar };
export { blockedDates };
export { cellToday };
export { datesSelect };
