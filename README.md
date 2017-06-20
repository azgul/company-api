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
Path: `GET /company/:id`

Possible status codes: `200`, `404`

Example usage:
```
$ curl -i http://127.0.0.1:3000/company/1
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
}
```


# Considerations
## Authentication
> You don't have to add _authentication_ to your web service, but suggest a protocol/method and discuss your choice.

`Authorization` header is the way to go. Which style depends on the needs. A global API key would be suitable if the 
purpose is to grant access to _everyone_ who wants to access it. Otherwise let users generate their own API key through 
an admin interface.

OAuth could possibly be used for identifying users such that no signup is needed.

## Redundancy
> How can one make the service redundant? Which considerations should one make?

Recently discovered [traefik](https://traefik.io/) which appears great for the task. Automatically discovers Docker 
containers and acts as a reverse proxy for them, also supports load balancing which is required in order to achieve 
redundancy.

Another option to look at could be [nginx](nginx), where auto discovery would 
[also be possible](https://www.nginx.com/blog/service-discovery-in-a-microservices-architecture/).

## Versioning of data
> How can one implement versioning of company data?

Introducing a `revision` column for the `companies` table would do the trick. Of course users would only be allowed to 
edit the latest revision. The `GET /companies/all` endpoint would need to be refactored to only return the latest 
`revision` for each company.

## Search function
> How would you design and implement a search function?

Depends on the needs. Free text search is the most user friendly, so that is an option. If the goal is to let users 
look up by one or more properties, it would look something along the lines of..

`POST /company/search` 
```
{
  "cvr": 12345678,
  "name": "A cool"
}
```
.. where the user interface would send one or more properties that could identify the requested company. The database 
schema would need to be changed to include indexes on the searchable properties.