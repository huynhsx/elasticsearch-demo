# Elasticsearch with Docker

This guide will walk you through setting up Elasticsearch with Docker, using Docker Compose, and running queries using Dev Tools.

## Table of Contents

1. [Usage](#usage)
2. [Starting Docker](#starting-docker)
3. [Running Queries in Dev Tools](#running-queries-in-dev-tools)

## Usage

This setup uses Docker to run Elasticsearch and Kibana, allowing you to quickly set up a local environment for development and testing.

## Starting Docker
### 1. Build the Docker images and start the services:
```bash
docker-compose up --build
```

### 2. Access Elasticsearch and Kibana:
- Elasticsearch: [http://localhost:9200](http://localhost:9200)
- Kibana Dev Tools: [http://localhost:5601/app/dev_tools#/console](http://localhost:5601/app/dev_tools#/console)

## Running Queries in Dev Tools
Once Kibana is up and running, you can use the Dev Tools to interact with Elasticsearch.

Sample CRUD Operations in Elasticsearch
### 1. Create
#### Create a record with ID 1
```json
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
```
#### Create a record without an ID
```json
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
```

### 2. Search (Read)
#### Retrieve a record with ID 1
```json
GET /library/_doc/1
```

#### Search for records with "Kafka" in the title
```json
GET /library/_search
{
  "query": {
    "match": {
      "title": "Kafka"
    }
  }
}
```
Sample search response
```json
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
```

### 3. Update
#### Update a record with ID 1
```json
POST /library/_update/1
{
  "doc": {
    "price": 24.95
  }
}
```

### 4. Delete
#### Delete a record with ID 1
```json
DELETE /library/_doc/1
```

