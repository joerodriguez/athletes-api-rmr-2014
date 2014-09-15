# Activity API

## Update with valid data

### PUT /activities/:id.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PUT /activities/1.json</pre>

#### Body

<pre>{"activity":{"elevation_gain":354}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: e7d6e4a9-aed2-4736-878e-171d8c81036f
X-Runtime: 0.004749
Content-Length: 139</pre>

#### Status

<pre>202 Accepted</pre>

#### Body

<pre>{"id":1,"athlete_id":1,"started_at":"2001-02-02T21:05:06.000Z","finished_at":"2001-02-02T21:05:06.000Z","distance":56,"elevation_gain":354}</pre>
