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
  let dates = [{ "date": "", "number": "" }, { "date": "", "number": 0}];
  days.forEach((day) => {
    day.addEventListener("click", (event) => {
      let dateInput = event.currentTarget.firstElementChild.dataset.day;
      let numberInput = Date.parse(dateInput);
      let start = document.getElementById("contact_start").value;
      let end = document.getElementById("contact_end").value;

      if ( dates[0].date === "" ) {
        dates[0].date = dateInput;
        dates[0].number = Date.parse(dates[0].date);
        console.log(dates);
      }
      else if(dates[0].date !== "" && dates[1].date === "" && numberInput > dates[0].number) {
        //debugger;
        dates[1].date = dateInput;
        dates[1].number = numberInput;
        console.log(dates);
      }
      //else if(dates[0].date !== "" && numberInput < dates[0].number) {
      //  dates[0].date = dateInput;
      //  dates[0].number = numberInput;
      //  console.log(dates);
      //}
      else if (dates[0].date !== "" && dates[1].date !== "") {
        // Si la date entrée est plus proche de dates[0] que dates[1]
        if(numberInput - dates[0].number < dates[1].number - numberInput) {
          //debugger;
          dates[0].date = dateInput;
          dates[0].number = numberInput;
        }
        else {
          //debugger;
          dates[1].date = dateInput;
          dates[1].number = numberInput;
        }
      }
      else {
        console.log(dates);
      }
      document.getElementById("contact_start").value = dates[0].date;
      document.getElementById("contact_end").value = dates[1].date;
    });
  });
}

export { dateCalendar };
export { blockedDates };
export { cellToday };
export { datesSelect };
