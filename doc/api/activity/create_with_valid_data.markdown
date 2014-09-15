# Activity API

## Create with valid data

### POST /activities.json
### Request

#### Headers

<pre>Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /activities.json</pre>

#### Body

<pre>{"activity":{"athlete_id":1,"started_at":"2001-02-03T04:05:06+07:00","finished_at":"2001-02-03T04:07:06+07:00","elevation_gain":232,"distance":5}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;0d5ae2fd4a2653187f027c7239e0ef66&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fecb864d-9778-4e4b-8c88-51c7eb2aaf62
X-Runtime: 0.009208
Content-Length: 138</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"id":2,"athlete_id":1,"started_at":"2001-02-02T21:05:06.000Z","finished_at":"2001-02-02T21:07:06.000Z","distance":5,"elevation_gain":232}</pre>
