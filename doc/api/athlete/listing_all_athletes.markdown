# Athlete API

## Listing all athletes

### GET /athletes.json
### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /athletes.json</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;1e9112bdf97052834b58198caf201f90&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 133e2668-3a2a-4c3b-ab6d-0142854a9bd3
X-Runtime: 0.010051
Content-Length: 62</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[{"id":1,"name":"Brendan Benson","weight":null,"avatar":null}]</pre>
