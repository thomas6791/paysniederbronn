const insertInput = () => {
  console.log("advisa");
  const options = document.getElementById("options");
  let icon = document.querySelector('.fa-plus-square');
    icon.addEventListener("click", (event) => {
      options.insertAdjacentHTML("beforeend", `<div class="inline">
          <input placeholder="Option 2, ex: petits déjeuner" class="option" type="text" name="taxe_sejour[option2]" id="taxe_sejour_option2">
          <div class="input string optional taxe_sejour_tarif2"><input type="number" class="string optional" name="taxe_sejour[tarif2]" id="taxe_sejour_tarif2"></div>
        </div>`);
    });
}
export { insertInput };
