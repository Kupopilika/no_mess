import $ from 'jquery';
import 'select2';

function addDays(date, days) {
  const copy = new Date(Number(date))
  copy.setDate(date.getDate() + days)
  return copy
}


const initSelect2 = () => {
  $('.select2').select2();
  $('.select2').on('select2:select', function (e) {
    var data = e.params.data.id;
      console.log(data);
  // $.ajax({
  //     type: "GET",
  //     dataType: 'json',
  //     url: "http://localhost:3000/ingredients/expiration", // https://www.no-mess.life/ingredients/expiration
  //     success: function(data) {
  //       data.forEach
    //   },
    // });

    // . innerText = 'Quantité (' + valeur + ')

    fetch("/ingredients/units")
      .then(response => response.json())
      .then((data) => {
        data.forEach((item) => {
          if (Object.keys(item) == e.params.data.id) {
            console.log(Object.values(item)[0]);
            const quantity = document.getElementById("label_quantity");
            quantity.innerText = 'Quantité (' + Object.values(item)[0] + ')';
          }
        });
    });


    fetch("/ingredients/expiration")
      .then(response => response.json())
      .then((data) => {
        data.forEach((item) => {
          if (Object.keys(item) == e.params.data.id) {
            console.log(Object.values(item)[0]);
            const expiration = document.getElementById("user_ingredient_expiration_date");
            const date = new Date();
            const newDate = addDays(date, Object.values(item)[0]);
            console.log(newDate);
            expiration.value = newDate.toLocaleDateString();
          }
        })
    });
  });
};

export { initSelect2 };
