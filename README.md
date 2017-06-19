# Usage instructions for the company API
Responses are pretty-printed for readability.

## List all companies
Path: `GET /companies/all`

Possible status codes: `200`

Example usage:
```
$ curl -i http://127.0.0.1:3000/companies/all                                                                                                                                                (master)
HTTP/1.1 200 OK
Content-Type: text/html;charset=utf-8
Content-Length: 190
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Server: WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26)
Date: Mon, 19 Jun 2017 17:37:24 GMT
Connection: Keep-Alive

[
  {
    "id": 1,
    "name": "A cool company"
  },
  {
    "id": 2,
    "name": "Another cool company"
  }
]
```

## Create a company
Path: `/company/create`

Possible status codes: `200`, `400`, `500`

Example usage:

Header `Content-Type: application/json`
```
$ curl -X POST -i http://127.0.0.1:3000/company/create --header Content-Type:application/json -d "{\"cvr\":\"12345679\",\"name\":\"Another cool company\",\"address\":\"Another cool address\",\"city\":\"Aarhus\",\"country\":\"Denmark\",\"phone\":\"+45 12 34 56 98\"}"
HTTP/1.1 200 OK
Content-Type: text/html;charset=utf-8
Content-Length: 228
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Server: WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26)
Date: Mon, 19 Jun 2017 17:46:09 GMT
Connection: Keep-Alive

{
  "id": 2,
  "cvr": 12345679,
  "name": "Another cool company",
  "address": "Another cool address",
  "city": "Aarhus",
  "country": "Denmark",
  "phone": "+45 12 34 56 98",
  "created_at": "2017-06-19T17:46:09.373Z",
  "updated_at": "2017-06-19T17:46:09.373Z"
}
```


## Get company by id
Path: `GET /company/search/:id`

Possible status codes: `200`, `404`

Example usage:
```
$ curl -i http://127.0.0.1:3000/company/search/1
HTTP/1.1 200 OK
Content-Type: text/html;charset=utf-8
Content-Length: 216
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Server: WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26)
Date: Mon, 19 Jun 2017 17:39:57 GMT
Connection: Keep-Alive

{
  "id": 1,
  "cvr": 12345678,
  "name": "A cool company",
  "address": "A cool address",
  "city": "Aarhus",
  "country": "Denmark",
  "phone": "+45 12 34 56 78",
  "created_at": "2017-06-18T14:11:10.778Z",
  "updated_at": "2017-06-18T14:11:10.778Z"
}```
