# Activity API

## Update with invalid data

### PUT /activities/:id.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PUT /activities/1.json</pre>

#### Body

<pre>{"activity":{"athlete_id":null}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 9989d0c3-8ca2-4c08-8e87-3465b72aa11d
X-Runtime: 0.002738
Content-Length: 59</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{"errors":[{"field":"athlete","message":"can't be blank"}]}</pre>
