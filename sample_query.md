<!-- Sample CRUD in Elasticsearch -->

# 1. Create
#    +--- Index name
#    |       +--- Type name
#    |       |     +--- Document ID
#    |       |     |
#    V       V     V

### Create a record with ID 1
PUT /library/_doc/1
{
  "title": "Norwegian Wood",
  "name": {
    "first": "Haruki",
    "last": "Murakami"
  },
  "publish_date": "1987-09-04T00:00:00+0900",
  "price": 19.95
}

### Create a record without an ID
POST /library/_doc/
{
  "title": "Kafka on the Shore",
  "name": {
    "first": "Haruki",
    "last": "Murakami"
  },
  "publish_date": "2002-09-12T00:00:00+0900",
  "price": 19.95
}

# 2. Search (Read)

### Retrieve a record with ID 1
GET /library/_doc/1

### Search for records with "Kafka" in the title
GET /library/_search
{
  "query": {
    "match": {
      "title": "Kafka"
    }
  }
}

### Sample search response
{
  "took": 1,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 1,
      "relation": "eq"
    },
    "max_score": 0.60996956,
    "hits": [
      {
        "_index": "library",
        "_id": "X87wepABDtAA5KxfoOXv",
        "_score": 0.60996956,
        "_source": {
          "title": "Kafka on the Shore",
          "name": {
            "first": "Haruki",
            "last": "Murakami"
          },
          "publish_date": "2002-09-12T00:00:00+0900",
          "price": 19.95
        }
      }
    ]
  }
}

# 3. Update

### Update the price of the record with ID 1
POST /library/_update/1
{
  "doc": {
    "price": 29.95
  }
}

# 4. Delete

### Delete the record with ID 1
DELETE /library/_doc/1
