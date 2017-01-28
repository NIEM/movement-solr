NIEM - WIST: Solr
=================

The other repositories include the [WIST - Webapp](https://github.com/NIEMconnects/wist-frontend) and the [WIST - Backend](https://github.com/NIEMconnects/wist-backend).

# Solr Setup

Solr is instantiated and data ingested via Docker. The data is located in ./niem-xsd and can be found on https://www.niem.gov/techhub/niem-model/current-release

To run Solr locally with Docker:

```
docker build -t wist-solr .
docker run -d -p 8983:8983 -t wist-solr
```

