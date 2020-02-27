const insertInput = () => {
  console.log("advisa");
  const options = document.getElementById("options");
  let icon = document.querySelector('.fa-plus-square');
  let counter = 2
    icon.addEventListener("click", (event) => {
      counter = counter + 1;
      console.log(counter);
      options.insertAdjacentHTML("beforeend", `<div class="inline">
          <input placeholder="Option ${counter}" class="option" type="text" name="taxe_sejour[option${counter}]" id="taxe_sejour_option${counter}">
          <div class="input string optional taxe_sejour_tarif${counter}"><input type="number" class="string optional" name="taxe_sejour[tarif${counter}]" id="taxe_sejour_tarif${counter}"></div>
        </div>`);
    });
}
const test = () => {
  let x = document.querySelector('.simple_form.taxe_sejour');
  x.addEventListener("click", (event) => {
    console.log("00", event.currentTarget);
    console.log("01", event.target);
    console.log("02", event.target.id);
  });
}
export { insertInput };
export { test };
