app.state.orderList = null

app.init = function () {

  app.getOrder();
};

app.getOrder = async function () {
  try {
    let p = await app.getData(app.cst.API_HOST + "/material/order/history")
    // store to state
    app.state.orderList = p.data
    // build totalweight and totalPrice
    app.mappingData(app.state.orderList)
    console.log('app.state.orderList', app.state.orderList)
    app.showOrderList(app.state.orderList)
  } catch (error) {
    console.error("error", error)
  }
}

app.mappingData = function (data) {
  for (let id in data) {
    let totalPrice = 0
    let totalWeight = 0
    for (let i = 0; i < data[id].data.length; i++) {
      let orderList = data[id].data[i];
      totalPrice += orderList.price * orderList.weight
      totalWeight += orderList.weight
    }
    data[id].totalPrice = totalPrice
    data[id].totalWeight = totalWeight
  }
}

app.showOrderList = function (data) {
  let container = document.getElementById("marterial-order-table-tr");
  if (!data) {
    console.log('no data')
  } else {
    for (let id in data) {
      let trContainer = app.createElement("tr", {
        atrs: { className: "" }
      }, container);
      // orderID
      let orderIdC = app.createElement("td", {
      }, trContainer);
      app.createElement("a", {
        atrs: {
          href: "/material/order/detail/" + id,
          textContent: id,
          value: id
        }
      }, orderIdC);
      // supplier
      let supplier = app.createElement("td", {
      }, trContainer);
      app.createElement("a", {
        atrs: {
          href: "/material/suppliers/" + data[id].supplier,
          textContent: data[id].supplier,
          value: data[id].supplier
        }
      }, supplier);
      app.createElement("td", {
        atrs: {
          textContent: "$" + data[id].totalPrice,
          value: data[id].totalPrice
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: data[id].totalWeight,
          value: data[id].totalWeight
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: data[id].orderDate,
          value: data[id].orderDate
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: data[id].purchaseDate,
          value: data[id].purchaseDate
        }
      }, trContainer);
    }
  }
}

window.addEventListener("DOMContentLoaded", app.init);
