# Usage instructions for the company API

## List all companies
Path: `GET /companies/all`

Example response:
```
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "A cool company"
    }
  ]
}
```

## Create a company
Path: `/company/create`

Example request:

Header `Content-Type: application/json`
```
{
  "cvr": "12345679",
  "name": "Another cool company",
  "address": "Another cool address",
  "city": "Aarhus",
  "country": "Denmark",
  "phone": "+45 12 34 56 98"
}
```

Example response:
```
{
  "success": true,
  "data": {
    "id": 5,
    "cvr": 12345679,
    "name": "Another cool company",
    "address": "Another cool address",
    "city": "Aarhus",
    "country": "Denmark",
    "phone": "+45 12 34 56 98",
    "created_at": "2017-06-18T14:52:48.809Z",
    "updated_at": "2017-06-18T14:52:48.809Z"
  }
}
```


## Get company by id
Path: `GET /company/search/:id`

Example response:
```
{
  "success": true,
  "data": {
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
}
```
