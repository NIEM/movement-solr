FROM solr

#WORKDIR /opt/solr/server/solr/
#ADD . /opt/solr/server/solr/

RUN mkdir /opt/solr/cores/core1
ADD solr_config/core.properties /opt/solr/cores/core1/.
ADD solr_config/niem-xsd /opt/solr/server/solr/.
ADD solr_config/data-config.xml /opt/solr/server/solr/niem-test-xsd/conf/.
ADD solr_config/solrconfig.xml /opt/solr/server/solr/niem-test-xsd/conf/.
ADD solr_config/managed-schema /opt/solr/server/solr/niem-test-xsd/conf/.
