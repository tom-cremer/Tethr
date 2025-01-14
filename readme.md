# Tethr

## 📁 Présentation des Principaux Dossiers

Voici une vue d'ensemble des principaux dossiers de ce projet et leur contenu :

- **`lib/`** : Dossier principal contenant le code source de l'application Flutter. Organisé comme suit :
    - **`Screen/`** : Toutes les pages de l'application, comme `home_screen.dart`, `user_profile_screen.dart`, etc.
    - **`Helpers/`** : Les utilitaires et fonctions réutilisables, *Principe DRY* ou *Don't Repeat Yourself*,
    - **`Styles/`** : Les styles pour la personnalisation de l'application, incluant les couleurs, marges et gradients, etc.
    - **`Widget/`** : Les widgets personnalisés réutilisables (ex. `Wallet`, `Button`, etc.).
    - **`Fonts/`** : Les polices personnalisées utilisées dans l'application.

- **`assets/`** : Contient les fichiers statiques, tels que :
    - **`images/`** : Logos et visuels utilisés dans l'application.
    - **`gifs/`** : Les gifs utilisées dans l'application.


- **`android/`** : Les configurations natives pour Android, comme les manifestes, les fichiers de configuration
  Firebase, etc.

- **`pubspec.yaml`** : Fichier de configuration où sont listées les dépendances Flutter utilisées (ex. `go_router`,
  `qr_code_dart_scan`, `firebase_auth`).

---

## 🚀 Présentation de l'Application

**Tethr** est une application conçue pour permettre aux utilisateurs de partager leurs informations et liens via
un **profil numérique**. Chaque utilisateur dispose d’une "carte profil" unique, qui peut être partagée via
un QR code. L’application répond au besoin croissant de centraliser des informations personnelles
de manière intuitive et sécurisée.

---

## 🌐 Étude de l'Existant

**Applications similaires** :

| Application  | Points forts                                 | Points faibles                                            |
|--------------|----------------------------------------------|-----------------------------------------------------------|
| **Linktree** | Simplicité d'utilisation, nombreux thèmes.   | Fonctionnalités premium limitées en version gratuite.     |
| **HiHello**  | Intégration NFC et carte virtuelle élégante. | Interface parfois confuse pour les nouveaux utilisateurs. |
| **Beacon**   | Personnalisation des profils avancée.        | Moins connu, support limité.                              |

**Ce que Tethr apporte** :

- Gestion des profils avec QR codes.
- Suivi des profils liké et scanné.
---

## 🎯 Public Cible

Tethr s’adresse à des utilisateurs variés :

1. **Professionnels** : Réseautage rapide lors d’événements grâce au QR code.
2. **Étudiants et freelances** : Partager un portfolio ou des liens vers des projets.
3. **Influenceurs** : Centraliser des liens vers différents réseaux sociaux.

---

## 📋 Fonctionnalités

### **Création d’un profil**

- **Récit utilisateur** : *En tant qu’utilisateur, je veux créer un profil avec mes informations pour pouvoir le
  partager facilement.*
- Permet de personnaliser des informations comme le nom, son avatar, les liens, notre carte, etc.

### **Partage de la carte profil**

- **Récit utilisateur** : *En tant qu’utilisateur, je veux partager mon profil via un QR code pour un accès rapide par
  d’autres personnes ayant l'application installé.*
- Partage de la carte profil via un QR code.
### **Scanner un QR code**

- **Récit utilisateur** : *En tant qu’utilisateur, je veux scanner un QR code pour accéder rapidement au profil d’une
  autre personne en étant dans l'app.*
- Intégration avec `qr_code_dart_scan`.

### **Gestion des followers**

- **Récit utilisateur** : *En tant qu’utilisateur, je veux suivre les personnes dont j'ai liké ou scanné retrouver
  facilement plus tard.*
- Suivi des profils liké et scanné (l'ajout par le scan doit étre activé dans les paramètres).

### **Maquettes et illustrations**

Ajoutez ici les maquettes ou captures d’écran des fonctionnalités.

---

## 📈 État d'Avancement

| Fonctionnalité                | Statut     |
|-------------------------------|------------|
| Création d’un profil          | ✅ Terminée |
| Scanner et ajout de followers | ✅ Terminée |
| Ajout des liens               | ✅ Terminée |
| SearchBar                     | ✅ Terminée |


---

## ⚙️ Compilation de l'Application

### **Prérequis**

- Flutter SDK installé.
- Fichier `google-services.json` configuré pour Firebase avec votre clé d'API (Dans le cas de `google-services.json` vous avez juste a remplacer la clé).
- Fichier `firebase_options.dart` configuré pour Firebase avec votre clé d'API.

### **Étapes**

1. Clonez ce dépôt :
   ```bash 
    git clone https://github.com/trans-dam-2024-2025/projet-d-examen-2425-infographie-tom-cremer.git
    ```
2. Ouvrez le dossier du projet dans votre éditeur de code favori.
3. Ajoutez les fichiers `google-services.json` dans le dossier `android/app/`.
4. Ajoutez les fichiers `firebase_options.dart` dans le dossier `lib/`.
5. Installez les dépendances du projet :
   ```bash
   flutter pub get
   ```
6. Exécutez l'application sur un émulateur ou un appareil connecté :
   ```bash
   flutter run
   ```

---
