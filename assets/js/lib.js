// initialize app structure
let app = {
  state: {
    cart: null, auth: null, provider: null
  }, evts: {},
  cst: {
    API_HOST: "http://code-server.wuhsun.com:8443/api",
    token: ""
  }
};

app.getCookie = function (name) {
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

app.cst.token = app.getCookie('csrftoken');

app.getDate = function (url) {
  const request = new Request(
    url,
    {
      credentials: 'same-origin',
      method: 'GET',
      headers: {
        "Cache-Control": "no-cache",
        'X-CSRFToken': app.cst.token,
        'content-type': 'application/json'
      }
    }
  );
  return fetch(request)
    .then(response => response.json())
}


app.postDate = function (url, data) {
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

// core operations
app.get = function (selector) {
  return document.querySelector(selector);
};

app.getAll = function (selector) {
  return document.querySelectorAll(selector);
};

app.beforeCreateElement = function (tagName, settings, parentElement) {
  let obj = document.createElement(tagName);
  if (settings.atrs) { app.setAttributes(obj, settings.atrs); }
  if (settings.stys) { app.setStyles(obj, settings.stys); }
  if (settings.evts) { app.setEventHandlers(obj, settings.evts); }
  if (parentElement instanceof Element) { parentElement.insertBefore(obj, obj.nextSibling); }
  // element.parentNode.insertBefore(newElement, element.nextSibling);

  return obj;
};

app.createElement = function (tagName, settings, parentElement) {
  let obj = document.createElement(tagName);
  if (settings.atrs) { app.setAttributes(obj, settings.atrs); }
  if (settings.stys) { app.setStyles(obj, settings.stys); }
  if (settings.evts) { app.setEventHandlers(obj, settings.evts); }
  if (parentElement instanceof Element) { parentElement.appendChild(obj); }
  return obj;
};

app.modifyElement = function (obj, settings, parentElement) {
  if (settings.atrs) {
    app.setAttributes(obj, settings.atrs);
  }
  if (settings.stys) {
    app.setStyles(obj, settings.stys);
  }
  if (settings.evts) {
    app.setEventHandlers(obj, settings.evts);
  }
  if (parentElement instanceof Element && parentElement !== obj.parentNode) {
    parentElement.appendChild(obj);
  }
  return obj;
};

app.setStyles = function (obj, styles) {
  for (let name in styles) {
    obj.style[name] = styles[name];
  }
  return obj;
};

app.setAttributes = function (obj, attributes) {
  for (let name in attributes) {
    obj[name] = attributes[name];
  }
  return obj;
};

app.setEventHandlers = function (obj, eventHandlers, useCapture) {
  for (let name in eventHandlers) {
    if (eventHandlers[name] instanceof Array) {
      for (let i = 0; i < eventHandlers[name].length; i++) {
        obj.addEventListener(name, eventHandlers[name][i], useCapture);
      }
    } else {
      obj.addEventListener(name, eventHandlers[name], useCapture);
    }
  }
  return obj;
};

app.ajax = function (method, src, args, headers, callback) {
  let req = new XMLHttpRequest();
  if (method.toLowerCase() === "post") { // post through json args
    req.open(method, src);
    req.setRequestHeader("Content-Type", "application/json");
    app.setRequestHeaders(req, headers);
    req.onload = function () {
      callback(this);
    };
    req.send(JSON.stringify(args));
  } else { // get through http args
    req.open(method, src + "?" + args);
    app.setRequestHeaders(req, headers);
    req.onload = function () {
      callback(this);
    };
    req.send();
  }
};

app.setRequestHeaders = function (req, headers) {
  for (let key in headers) {
    req.setRequestHeader(key, headers[key]);
  }
};

app.getParameter = function (name) {
  let result = null, tmp = [];
  window.location.search.substring(1).split("&").forEach(function (item) {
    tmp = item.split("=");
    if (tmp[0] === name) {
      result = decodeURIComponent(tmp[1]);
    }
  });
  return result;
};

// loading
app.showLoading = function () {
  app.get("#loading").style.display = "block";
};

app.closeLoading = function () {
  app.get("#loading").style.display = "none";
};
