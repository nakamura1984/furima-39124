window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const priceContent = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceInput.addEventListener("input", ()  => {
    const addTaxPrice = Math.floor(priceInput.value * 0.1);
    priceContent.innerHTML = addTaxPrice;
    profit.innerHTML = priceInput.value - addTaxPrice;
  })
});