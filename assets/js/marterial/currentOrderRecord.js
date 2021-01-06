const requestURL = "http://code-server.wuhsun.com:8443"
const path = "/material/order/list"

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

const csrftoken = getCookie('csrftoken');

function getData(url) {
  const request = new Request(
    url,
    {
      credentials: 'same-origin',
      method: 'GET',
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

async function fetchData() {
  try {
    let p = await getData(requestURL + path)
    console.log('p', p)
  } catch (error) {
    console.error("error", error)
  }
}

fetchData()

// app.ajax("post", app.cst.API_HOST + "/user/signin", data, {}, function (req) {
//   let result = JSON.parse(req.responseText);
//   if (result.error) {
//     console.log("fb 登入 failed", result.error);
//   } else {
//     console.log("fb 登入成功", result);
//     app.state.auth = result.data;
//     app.state.provider = result.data.user.provider;
//     if (window.location.href.indexOf("profile") > -1) {
//       // 顯示 Profile 給使用者看
//       app.initProfile(app.state.auth);
//     }
//     app.showMemberIcon(app.state.auth);
//   }
// });


window.addEventListener("DOMContentLoaded", app.init);
