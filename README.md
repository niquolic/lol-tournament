# League of Legends Teams

Cette application permet de gérer des équipes, des joueurs et des matchs pour un univers inspiré de League of Legends.

## Modèles

### Team
- **Description** : Représente une équipe.
- **Attributs** :
  - `name` : Nom de l'équipe.
- **Associations** :
  - A plusieurs `players`.
  - Est associée à plusieurs `matches` en tant qu'équipe à domicile ou à l'extérieur.

### Player
- **Description** : Représente un joueur appartenant à une équipe.
- **Attributs** :
  - `first_name` : Prénom du joueur.
  - `last_name` : Nom de famille du joueur.
  - `role` : Rôle du joueur (Top, Jungle, Mid, ADC, Support).
- **Associations** :
  - Appartient à une `team`.

### Match
- **Description** : Représente un match entre deux équipes.
- **Attributs** :
  - `date` : Date du match.
- **Associations** :
  - Appartient à une `home_team` (équipe à domicile).
  - Appartient à une `away_team` (équipe à l'extérieur).
  - A un `result`.

### Result
- **Description** : Représente le résultat d'un match.
- **Attributs** :
  - `home_team_score` : Score de l'équipe à domicile.
  - `away_team_score` : Score de l'équipe à l'extérieur.
- **Associations** :
  - Appartient à un `match`.

---

## Dépendances

Voici les principales dépendances utilisées dans ce projet :

- **Ruby** : `~> 8.0.2`
- **Rails** : `~> 8.0.2`
- **PostgreSQL** : Utilisé comme base de données.
- **Tailwind CSS** : Pour le style.
- **Stimulus** et **Turbo** : Pour les interactions front-end.
- **Puma** : Serveur web.
- **Kamal** : Pour le déploiement en conteneur Docker.

Pour plus de détails, consultez le fichier [Gemfile](Gemfile).

---

## Installation et Configuration

### Prérequis
- Ruby installé (version compatible avec le projet).
- PostgreSQL installé et configuré.
- Node.js et Yarn pour gérer les dépendances front-end.

### 1. Cloner le dépôt

```bash
git clone https://github.com/niquolic/lol-tournament.git
cd lol-tournament
```

### 2. Installer les dépendances

Assurez-vous que vous avez `Ruby`, `Bundler`, `PostgreSQL` et `Yarn` installés.

```bash
bundle install
yarn install
```

### 3. Configurer la base de données PostgreSQL

Vérifiez que PostgreSQL est démarré :

```bash
brew services start postgresql
```

Créer et configurer la base de données :

```bash
rails db:create
rails db:migrate
rails db:seed
```

---

## Lancer l'application

Démarrer le serveur Rails :

```bash
rails server
```

Puis rendez-vous sur [http://localhost:3000](http://localhost:3000) pour découvrir l’application