# Athlete API

## Create with invalid data

### POST /athletes.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /athletes.json</pre>

#### Body

<pre>{"athlete":{"weight":155,"name":"a"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: d646270f-287e-4e3a-ae23-bb726fc1e131
X-Runtime: 0.003155
Content-Length: 80</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{"errors":[{"field":"name","message":"is too short (minimum is 3 characters)"}]}</pre>
