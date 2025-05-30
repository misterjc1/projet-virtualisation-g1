# Projet de Virtualisation et Supervision - M1 Informatique IBAM

## Contexte

Dans un environnement informatique où la **haute disponibilité**, la **résilience** et la **supervision** sont des enjeux majeurs, ce projet vise à concevoir et 
déployer une **infrastructure virtuelle automatisée**, **modulable** et **tolérante aux pannes**.

Réalisé dans le cadre du module *Virtualisation et Cloud Computing* du **Master 1 Informatique** à l’IBAM.

---

## Objectifs du projet

- Déployer une **application web distribuée** sur plusieurs machines virtuelles.
- Mettre en place un **équilibrage de charge (Load Balancing)** via **Nginx**.
- Configurer une **base de données MySQL avec réplication** maître/esclave.
- Implémenter un **système de supervision** avec **Prometheus** et **Grafana**.

---

## Technologies utilisées

| Domaine               | Outils / Langages             |
|-----------------------|-------------------------------|
| **Virtualisation**    | Vagrant, VirtualBox           |
| **Provisioning**      | Bash                          |
| **Services Web**      | Apache, Nginx                 |
| **Base de données**   | MySQL (avec réplication)      |
| **Supervision**       | Prometheus, Grafana           |

---

## Supervision avec Grafana

Un dossier `metrics-graphana` est fourni dans le projet.  
Il contient un fichier `Node Exporter Server Metrics-1748481075093.json` qui correspond à un **dashboard préconfiguré Grafana**, permettant de **visualiser les métriques système** collectées par **Node Exporter** sur les différentes machines virtuelles.

Pour l’utiliser :
1. Importez le fichier `.json` dans Grafana.
2. Configurez la source de données Prometheus.
3. Visualisez les métriques système de chaque nœud (CPU, RAM, disque, etc.).

---

## Vidéo de démonstration

Une vidéo explicative du projet est disponible ici :  
 [Voir la démonstration du projet](https://drive.google.com/file/d/1UvhRC4aUrblPF6nM3HJn3b89WAwppuC1/view?usp=sharing)

---



