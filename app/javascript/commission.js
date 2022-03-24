function calculation(){
  const price_input = document.getElementById("item-price")
  const commission = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price_input.addEventListener("keyup" ,()=>{
    const price = price_input.value
    commission.innerHTML = `${ Math.floor(price * 0.1 )}`
    profit.innerHTML = `${Math.ceil(price * 0.9)}`
  })
}
window.addEventListener('load',calculation)