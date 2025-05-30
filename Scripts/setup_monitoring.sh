#!/bin/bash

# Mise à jour et installation
sudo apt update && sudo apt upgrade -y
sudo apt install -y prometheus prometheus-node-exporter

# Configuration de Prometheus
sudo bash -c 'cat > /etc/prometheus/prometheus.yml' <<EOF
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'PROMETHEUS'
    static_configs:
      - targets: ['192.168.56.60:9090'] 
        labels:
          group: 'monitoring_servers'       

  - job_name: 'SERVER WEB'
    static_configs:
      - targets: ['192.168.56.10:9100', '192.168.56.20:9100', '192.168.56.30:9100' ]
        labels:
          group: 'web_servers'  


  - job_name: 'SERVER BASE DE DONNEE'
    static_configs:
      - targets: ['192.168.56.40:9100', '192.168.56.50:9100']
        labels:
          group: 'database_servers'
EOF

# Redémarrage de Prometheus
sudo systemctl restart prometheus
sudo systemctl enable prometheus

# Installation de Grafana
sudo apt install -y apt-transport-https software-properties-common wget
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt update
sudo apt install -y grafana

# Activation de Grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

# Installation des plugins utiles
sudo grafana-cli plugins install grafana-piechart-panel
sudo grafana-cli plugins install alexanderzobnin-zabbix-app
sudo systemctl restart grafana-server

# Configuration du firewall
sudo ufw allow 3000/tcp  # Grafana
sudo ufw allow 9090/tcp  # Prometheus
sudo ufw enable

# Configuration automatique des dashboards
sleep 10  # Attendre que Grafana soit bien démarré

# Ajout de la source de données Prometheus
curl -X POST "http://admin:admin@localhost:3000/api/datasources" \
  -H "Content-Type: application/json" \
  -d '{
    "name":"Prometheus",
    "type":"prometheus",
    "url":"http://192.168.56.60:9090",
    "access":"proxy",
    "basicAuth":false
  }'

# Importation du dashboard Node Exporter
curl -X POST "http://admin:admin@localhost:3000/api/dashboards/db" \
  -H "Content-Type: application/json" \
  -d '{
    "dashboard": {
      "id": null,
      "uid": null,
      "title": "Node Exporter Server Metrics",
      "tags": ["templated"],
      "timezone": "browser",
      "schemaVersion": 16,
      "version": 0,
      "refresh": "30s",
      "panels": [],
      "templating": {
        "list": []
      },
      "annotations": {
        "list": []
      }
    },
    "folderId": 0,
    "overwrite": false
  }'

echo "Installation du monitoring terminée!"
echo "Accès à Grafana: http://$(hostname -I | awk '{print $1}'):3000"
echo "Identifiants par défaut: admin / admin"