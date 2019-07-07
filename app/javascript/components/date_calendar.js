const dateCalendar = () => {
  console.log('date');
  let day = document.getElementsByClassName('tableau fourlembach visites')[0].dataset.day;
  let elements = document.querySelectorAll(`.${day}`);
  elements.forEach((item) => {
    item.classList.add("day-color");
  });
}
export { dateCalendar };
