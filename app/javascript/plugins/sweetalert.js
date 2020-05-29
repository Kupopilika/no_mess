import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

const initSweetAlertOnUserIngredient = () => {
  const ingredients = document.querySelectorAll(".sweet-alert");
    console.log(ingredients);
  ingredients.forEach((ingredient)=>{
    console.log(ingredient);
    initSweetalert(`[data-element-id="${ingredient.dataset.elementId}"]`, {
      title: "Êtes-vous sûr de vouloir supprimer cet ingrédient ?",
      text: "Cette action est irréversible",
      icon: "warning"
    }, (value) => {
      if (value) {
        const link = document.querySelector(`#delete-link-${ingredient.dataset.elementId}`);
        link.click();
      }
    });
  })
}

  export { initSweetAlertOnUserIngredient };
