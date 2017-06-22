NIEM - Movement: Solr
=================

The other repositories include the [Movement - Webapp](https://github.com/NIEM/movement-frontend) and the [Movement - Backend](https://github.com/NIEM/movement-backend).

Prior to coming to this repo, did you happen to catch our [Movement overview](https://github.com/NIEM/Movement)?

Solr ingests the NIEM XSD data. The data is located in ./niem-xsd and can be found on https://www.niem.gov/techhub/niem-model/current-release

Note: Manual updates are required for: 1) Namespace to namespace prefix conversion, as specified in data-config.xml, and 2) Nonparent Types array, as specified in data-config.xml, which can be generated from the movement-backend project node task.

## Got feedback? 
In the spirit of open-source tooling, we have provided a [Scrum board](https://github.com/NIEM/Movement/projects/1) that allows users to keep track of Movement’s issues and enhancements. Anyone can [submit a new issue](https://github.com/NIEM/Movement/issues) for the tool for something they would like to see added or a bug. Once reviewed by the engineering team, issues will be added to the Scrum board's backlog. Developers and tool contributors can then address issues from the backlog and track their status using the Scrum board—providing an Agile approach to development and complete transparency to users.

# Running Solr with Docker

Solr can be run via Docker. To run the Solr locally with Docker, first make sure you have installed and setup the NIEM Movement Docker config:
```
docker network create niem-network
```

Then build and run the Solr container, from the repo's root directory:
```
docker build -t movement-solr .
docker run -dti -p 8983:8983 --name movement-solr --net niem-network movement-solr
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
