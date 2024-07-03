FROM docker.elastic.co/elasticsearch/elasticsearch:8.1.0
RUN elasticsearch-plugin install analysis-kuromoji
