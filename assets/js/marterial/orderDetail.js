app.state.orderDetail = null
app.totalPrice = null
app.orderNumber = null
app.totalPrice = null

app.init = function () {

  app.getPath();

  app.getOrder();
};

app.getPath = function () {
  let path = window.location.pathname.split('/')
  let len = path.length - 1
  app.orderNumber = path[len]
  document.getElementsByClassName("current-order-detail-number")[0].textContent = app.orderNumber
}

app.getOrder = async function () {
  try {
    // get params
    let p = await app.getData(app.cst.API_HOST + "/material/order/detail/" + app.orderNumber)
    console.log('p', p)
    // store to state
    app.state.orderDetail = p.data
    // build totalweight and totalPrice
    app.countData(app.state.orderDetail)
    console.log('app.totalPrice', app.totalPrice)
    app.showPrice()
    app.showOrderList(app.state.orderDetail)
  } catch (error) {
    console.error("error", error)
  }
}

app.countData = function (data) {
  for (let i = 0; i < data.length; i++) {
    let orderList = data[i];
    app.totalPrice += orderList.price * orderList.weight
  }
}

app.showPrice = function () {
  document.getElementsByClassName("order-detail-total-price-label")[0].textContent = "$" + app.totalPrice
}

app.showOrderList = function (data) {
  let container = document.getElementById("marterial-order-detail-table-tr");
  if (!data) {
    console.log('no data')
  } else {
    for (let i = 0; i < data.length; i++) {
      console.log(data[i])
      let trContainer = app.createElement("tr", {
        atrs: { className: "" }
      }, container);
      app.createElement("td", {
        atrs: {
          textContent: data[i].inventoryName,
          value: data[i].inventoryName
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: "$" + data[i].price,
          value: data[i].price
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: data[i].weight,
          value: data[i].weight
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: "$" + data[i].price * data[i].weight,
          value: data[i].price * data[i].weight
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: data[i].EXP,
          value: data[i].EXP
        }
      }, trContainer);
      app.createElement("td", {
        atrs: {
          textContent: data[i].origin,
          value: data[i].origin
        }
      }, trContainer);
    }
  }
}

window.addEventListener("DOMContentLoaded", app.init);
