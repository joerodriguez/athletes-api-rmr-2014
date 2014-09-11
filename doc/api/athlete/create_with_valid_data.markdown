# Athlete API

## Create with valid data

### POST /athletes.json
### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /athletes.json</pre>

#### Body

<pre>athlete[weight]=155&athlete[name]=John+Jackson&athlete[avatar]=http%3A%2F%2Fwhat.jpg</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;8b7ca1b78414179df0554f045d06c246&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f61cd5d7-e46c-42fd-a1d4-851a468d8de8
X-Runtime: 0.004151
Content-Length: 70</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"id":1,"name":"John Jackson","weight":155,"avatar":"http://what.jpg"}</pre>
