app.state.epq = null

let inventoryValue = null

function selectOnChange(sel) {
  inventoryValue = sel.options[sel.selectedIndex].value
}
function getData() {
  // check inventoryValue
  if (inventoryValue == null) {
    alert('請選擇商品')
    return
  }
  app.getOrder()
}

app.getOrder = async function () {
  try {
    let p = await app.getData(app.cst.API_HOST + "/epq/" + inventoryValue)
    // store to state
    app.state.epq = p.data
    // build totalweight and totalPrice
    // app.mappingData(app.state.eoq)
    console.log('app.state.orderList', app.state.epq)
    app.showData(app.state.epq)
  } catch (error) {
    console.error("error", error)
  }
}

app.showData = function () {
  document.getElementById("epq-current-amount").textContent = app.state.epq[0].currentAmount
  document.getElementById("epq-current-iYearNeed").textContent = app.state.epq[0].iYearNeed
  document.getElementById("epq-current-iYearCost").textContent = app.state.epq[0].iYearCost
  document.getElementById("epq-current-iYearOrderCost").textContent = app.state.epq[0].iYearOrderCost
  document.getElementById("epq-current-epq").textContent = app.state.epq[0].epq
}