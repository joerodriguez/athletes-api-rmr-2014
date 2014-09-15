# Activity API

## List for specific athlete

### GET /activities.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /activities.json?athlete_id=1</pre>

#### Query Parameters

<pre>athlete_id: 1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;a6e12ea47f98eecc904d3cfe1b44764d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 023919f9-5221-4b12-9e17-80e7a0ca997a
X-Runtime: 0.011705
Content-Length: 142</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[{"id":1,"athlete_id":1,"started_at":"2001-02-02T21:05:06.000Z","finished_at":"2001-02-02T21:05:06.000Z","distance":56,"elevation_gain":2320}]</pre>
