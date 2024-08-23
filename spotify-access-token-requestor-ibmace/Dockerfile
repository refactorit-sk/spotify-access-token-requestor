FROM refactoritskibm/ace:12.0.12.4

# Copy the BAR files into /tmp and process them:
#
# - Each file is compiled to ensure faster server startup
# - The files are unpacked into the server work directory
# - Once all files are in place, the work directory is optimized to speed up server start
# - The contents are made world-writable to allow for random userids at runtime
#
# The results of the commands can be found in the /tmp/deploys file.
#
ARG PASSWORD
ARG HOSTNAME
#ENV LICENSE=accept

COPY *.bar /tmp
COPY --chmod=777 --chown=aceuser:mqbrkrs server.conf.yaml /home/aceuser/ace-server/
COPY --chown=aceuser:mqbrkrs --chmod=777 ./ssl/$HOSTNAME/*.pfx /tmp
COPY --chown=aceuser:mqbrkrs --chmod=777 ./ssl/*.jks /tmp

RUN export LICENSE=accept \
    && . /opt/ibm/ace-12/server/bin/mqsiprofile \
    && set -x  \
    && ibmint deploy --input-bar-file /tmp/SpotifyAccessTokenRequestor.bar --output-work-directory /home/aceuser/ace-server/ 2>&1 | tee -a /tmp/deploys \
    && mqsisetdbparms -w /home/aceuser/ace-server/ -n brokerKeystore::password -u ignore -p $PASSWORD
#    && chmod -R ugo+rwx /home/aceuser/ \
#    && chmod -R ugo+rwx /var/mqsi/

USER aceuser:mqbrkrs

# Expose ports.  7600, 7800, 7843 for ACE;
EXPOSE 7600 7800 7843

# Set entrypoint to run the server
ENTRYPOINT ["bash", "-c", ". /opt/ibm/ace-12/server/bin/mqsiprofile && IntegrationServer --name spotify-access-token-requestor-ibmace --work-dir /home/aceuser/ace-server"]
