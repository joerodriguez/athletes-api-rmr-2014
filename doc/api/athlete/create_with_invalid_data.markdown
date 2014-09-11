# Athlete API

## Create with invalid data

### POST /athletes.json
### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /athletes.json</pre>

#### Body

<pre>athlete[weight]=155&athlete[name]=a</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: a8806b24-f3e5-49c1-8dc3-4f4bd31d2fd2
X-Runtime: 0.007065
Content-Length: 80</pre>

#### Status

<pre>400 Bad Request</pre>

#### Body

<pre>{"errors":[{"field":"name","message":"is too short (minimum is 3 characters)"}]}</pre>
