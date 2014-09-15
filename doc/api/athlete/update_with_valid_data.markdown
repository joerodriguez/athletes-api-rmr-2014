# Athlete API

## Update with valid data

### PUT /athletes/:id.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PUT /athletes/1.json</pre>

#### Body

<pre>{"athlete":{"name":"Raphael MAJKA"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: b4c2e9dc-75de-4280-8be8-f38f9829fde9
X-Runtime: 0.003117
Content-Length: 105</pre>

#### Status

<pre>202 Accepted</pre>

#### Body

<pre>{"id":1,"name":"Raphael MAJKA","weight":59,"avatar":"http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/34.jpg"}</pre>
