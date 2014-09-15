# Activity API

## Create with invalid data

### POST /activities.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /activities.json</pre>

#### Body

<pre>{"activity":{"elevation_gain":232}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 8ab3a189-cc5d-4d66-9ca3-c1832bb4b8b7
X-Runtime: 0.005068
Content-Length: 59</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{"errors":[{"field":"athlete","message":"can't be blank"}]}</pre>
