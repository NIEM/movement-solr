FROM solr
MAINTAINER Sam Rubin "smrubin"

# Start solr and create core called dhsniem
RUN /opt/solr/bin/solr start && \
    /opt/solr/bin/solr create_core -c dhsniem

# Copy over the niem data
COPY niem-xsd/ /opt/solr/niem-xsd

# Copy over and overwrite config data for the new dhsniem core
COPY solr_config/data-config.xml /opt/solr/server/solr/dhsniem/conf/.
COPY solr_config/solrconfig.xml /opt/solr/server/solr/dhsniem/conf/.
COPY solr_config/managed-schema /opt/solr/server/solr/dhsniem/conf/.

# Change ownership of the directory to the user solr
USER root
RUN chown -R solr /opt/solr/server/solr
USER solr

# Restart solr, retrieve status, and perform full import
# TODO: Move these commands to a shell script, copy to server and then run
# TODO: Use a loop to check status of the core startup and the import insted of using sleep commands, see example here: https://docs.docker.com/compose/startup-order/
RUN /opt/solr/bin/solr start && \
    /opt/solr/bin/solr status && \
    sleep 10 && \
    curl http://localhost:8983/solr/dhsniem/dataimport?command=full-import && \
    sleep 50
