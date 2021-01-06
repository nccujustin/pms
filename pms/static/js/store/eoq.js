app.state.eoq = null
let path = "/eoq/"

let inventoryValue = null

function selectOnChange(sel) {
  inventoryValue = sel.options[sel.selectedIndex].value
}
function getData() {
  // check inventoryValue
  if (inventoryValue == null) {
    alert('請選擇原物料')
    return
  }
  app.getOrder()
}

app.getOrder = async function () {
  try {
    let p = await app.getData(app.cst.API_HOST + "/eoq/" + inventoryValue)
    // store to state
    app.state.eoq = p.data
    // build totalweight and totalPrice
    // app.mappingData(app.state.eoq)
    console.log('app.state.orderList', app.state.eoq)
    app.showData(app.state.eoq)
  } catch (error) {
    console.error("error", error)
  }
}

app.showData = function () {
  document.getElementById("eoq-current-amount").textContent = app.state.eoq[0].currentAmount
}