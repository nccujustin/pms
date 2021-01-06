let mockData = {
  "store": 4,
  "data": [
    { "field": 0, "empty": false, "name": "桶裝啤酒", "price": 10, "amount": 1000, "exp": "2010-12-12" },
    { "field": 1, "empty": false, "name": "金牌free", "price": 100, "amount": 100, "exp": "2010-12-12" }
  ]
}

let requestURL = "http://code-server-1.wuhsun.com:8443"
let path = "/api/store/order/add"

let supplier = null
let inputData = []

for (let i = 0; i < 9; i++) {
  inputData.push({ field: i, empty: true })
}


function getCookie(name) {
  let cookieValue = null;
  if (document.cookie && document.cookie !== '') {
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
      const cookie = cookies[i].trim();
      // Does this cookie string begin with the name we want?
      if (cookie.substring(0, name.length + 1) === (name + '=')) {
        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
        break;
      }
    }
  }
  return cookieValue;
}

csrftoken = app.getCookie('csrftoken');

console.log(csrftoken)



function postData(url, data) {
  const request = new Request(
    url,
    {
      body: JSON.stringify(data),
      credentials: 'same-origin',
      method: 'POST',
      headers: {
        "Cache-Control": "no-cache",
        'X-CSRFToken': csrftoken,
        'content-type': 'application/json'
      }
    }
  );
  return fetch(request)
    .then(response => response.json())
}

// ----------------------------------------

function selectOnChange(sel) {
  supplier = sel.options[sel.selectedIndex].value
}

function inputOnchange(e) {
  fieldName = e.name.split('-')[0]
  fieldNum = e.name.split('-')[1]
  ori = inputData[fieldNum]

  if (ori['empty']) {
    ori['empty'] = false
  }

  if (fieldName == 'price' || fieldName == 'weight') {
    ori[fieldName] = parseInt(e.value)
    return
  }
  ori[fieldName] = e.value
}

function send() {
  // if (supplier == null) {
  //   alert("請選擇供應商")
  //   return
  // }

  // TODO : check value if exist

  // d = inputData.filter(x => x.empty != true)

  // let data = {
  //   supplier: supplier,
  //   data: d
  // }
  console.log('sand data', mockData)
  postData(requestURL + path, mockData)
    .then(data => {
      console.log("postData", data)
      if (data.success) {
        window.location.href = '/store/order/'
      }
    })
    .catch(error => console.error("error", error))
}
