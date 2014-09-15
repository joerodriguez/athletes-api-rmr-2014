# Athlete API

## Create with valid data

### POST /athletes.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /athletes.json</pre>

#### Body

<pre>{"athlete":{"weight":63,"name":"Peter SAGAN","avatar":"http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/51.jpg"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;c0162bd76b62299402b21ed407ff03ad&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c7ed49cc-673a-46fa-811f-9f9f063f9053
X-Runtime: 0.002818
Content-Length: 103</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"id":1,"name":"Peter SAGAN","weight":63,"avatar":"http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/51.jpg"}</pre>
