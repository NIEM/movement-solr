NIEM - WIST: Solr
=================

The other repositories include the [WIST - Webapp](https://github.com/NIEMconnects/wist-frontend) and the [WIST - Backend](https://github.com/NIEMconnects/wist-backend).

Solr is ingests the NIEM XSD data. The data is located in ./niem-xsd and can be found on https://www.niem.gov/techhub/niem-model/current-release

# Running Solr with Docker

Solr can be run via Docker. To run the Solr locally with Docker, first make sure you have installed and setup the NIEM WIST Docker config:
```
docker network create niem-network
docker run -dti -p 27017:27017 --name wist-mongo --net niem-network
```

Then build and run the Solr container, from the repo's root directory:
```
docker build -t wist-solr .
docker run -dti -p 8983:8983 --name wist-solr --net niem-network wist-solr
```

# Native Solr Setup

Just getting started with Solr? Consider checking out this quick synopsis to learn more: http://www.solrtutorial.com/index.html

0) Requirements: JRE 1.8 or higher

1) Solr is available from the Solr website at http://lucene.apache.org/solr/. For Linux/Unix/OSX systems, download the .tgz file. For Microsoft Windows systems, download the .zip file. When getting started, all you need to do is extract the Solr distribution archive to a directory of your choosing, e.g. C:/

2) On Command Line/Terminal, go to your solr/bin directory, and run the command solr start

3) Check to make sure solr is running with solr status

4) Create a core to be able to index and search. From solr/bin run solr create -c dhsniem

5) Drag and drop the files from this repo, dhsniem/solr_config, and drop into /solr-6.2.0/server/solr/niem-test-xsd/conf. Replace the existing files

6) Hit the url (either via a browser, curl, or another tool): http://localhost:8983/solr/dhsniem/dataimport?command=full-import. Note: Hit it twice to get the data response back.

7) Start the dhsniem app, npm start if you have not already and verify results are returned.

8) To stop solr, from solr/bin run solr stop -all
