# Athlete API

## Update with invalid data

### PUT /athletes/:id.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PUT /athletes/1.json</pre>

#### Body

<pre>{"athlete":{"name":"b"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 9f6e119d-6c30-4acb-8114-5cb545a3d101
X-Runtime: 0.004756
Content-Length: 80</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{"errors":[{"field":"name","message":"is too short (minimum is 3 characters)"}]}</pre>
