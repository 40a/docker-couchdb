FROM inclusivedesign/centos

WORKDIR /etc/ansible/playbooks

COPY provisioning/*.yml /etc/ansible/playbooks/

RUN ansible-galaxy install -fr requirements.yml && \
    ansible-playbook container.yml --tags "install,configure"

COPY provisioning/start.sh /usr/local/bin/start.sh

RUN chmod 755 /usr/local/bin/start.sh

EXPOSE 5984

ENTRYPOINT ["/usr/local/bin/start.sh"]
