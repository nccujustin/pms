let path = "/store/order/add"

let store = null
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
  store = sel.options[sel.selectedIndex].value
}

function inputOnchange(e) {
  fieldName = e.name.split('-')[0]
  fieldNum = e.name.split('-')[1]
  ori = inputData[fieldNum]

  if (ori['empty']) {
    ori['empty'] = false
  }

  if (fieldName == 'price' || fieldName == 'amount') {
    ori[fieldName] = parseInt(e.value)
    return
  }
  ori[fieldName] = e.value
}

function send() {
  if (store == null) {
    alert("請選擇商店")
    return
  }

  // TODO : check value if exist

  d = inputData.filter(x => x.empty != true)

  let data = {
    store: store,
    data: d
  }
  console.log('sand data', data)
  postData(app.cst.API_HOST + path, data)
    .then(data => {
      console.log("postData", data)
      if (data.success) {
        window.location.href = '/store/order/'
      }
    })
    .catch(error => console.error("error", error))
}
