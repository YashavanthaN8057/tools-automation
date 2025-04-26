# tools-automation
initial root token: hvs.RyBHhMbWczwhYr17Cec2BTFM
key1 (to unseal): wslJ28ljCGMBIuuTnshyltbVNm+o1Nu0xRB/jRLErx0=


This repo will have all the playbooks needed to install the tools

Vault: 
    1) This is a secret management solution from Hashicorp
    2) Vault cam be accessed by CLI or from the UI ( We will be hosting the secrets via UI or CLI and our Jenkins should read the secrets and supply the needed secrets to them )
        $ vault version
        "Vault v1.19.1 (aa75903ec499b2236da9e7bbbfeb7fd16fa4fd9d), built 2025-04-02T15:43:01Z" 
    
    3) Keeping the security into consideration, VAULT will be sealted by default ( To unseal it we either need 1 or 3 or 5 keys )

Installing Vault:
    Ref: https://developer.hashicorp.com/vault/install

    ```
        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
        sudo yum -y install vault
        sudo systemctl enable vault
        sudo systemctl start vault
        sudo systemctl status vault
    ```

> Prometheus & Grafana

    1) Need a server ( Terraform )
    2) Installation of Prometheus ( Ansible )
    3) Installation of Grafana ( Ansible )
    4) All our servers should have node_exporter installed ( Ansible )

> Prometheus Query for CPU Average that's Idle & Utilized:
` avg by(instance_name) (rate(node_cpu_seconds_total{mode="idle", instance_name="mysql-dev"}[5m])) * 100 ` : Idle 
`100 - (avg by(instance_name) (rate(node_cpu_seconds_total{mode="idle", instance_name="mysql-dev"}[5m])) * 100 )` : Utilized

> Prometheus Query for MEMORY Average that's Idle & Utilized: