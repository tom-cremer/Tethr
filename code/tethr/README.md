# Tethr

## 📁 Présentation des Principaux Dossiers

Voici une vue d'ensemble des principaux dossiers de ce projet et leur contenu :

**`dto/`** : Dossier contenant les Data Transfer Object (DTO) utilisée comme modèle pour structurer la base de données.
**`push_data_firestore/`** : Dossier contenant une simple application Flutter pour ajouter/supprimé les données à Firestore.
**`tethr/`** : Dossier racine de l'application.
- **`lib/`** : Dossier principal contenant le code source de l'application Flutter. Organisé comme suit :
    - **`Screen/`** : Toutes les pages de l'application, comme `home_screen.dart`, `user_profile_screen.dart`, etc.
    - **`Helpers/`** : Les utilitaires et fonctions réutilisables, *Principe DRY* ou *Don't Repeat Yourself*,
    - **`Styles/`** : Les styles pour la personnalisation de l'application, incluant les couleurs, marges et gradients,
      etc.
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

## Welcome & Onboarding 
![Onboarding](https://tethr.tomcremer.be/images/gifs/Onboarding.gif)

## Enregistrement de l'utilisateur
![Register](https://tethr.tomcremer.be/images/gifs/Register.gif)

## Home & Profile
![HomeProfile](https://tethr.tomcremer.be/images/gifs/HomeProfile.gif)

## Ajout de liens
![Addlink](https://tethr.tomcremer.be/images/gifs/Addlink.gif) 

## Achat de style de carte
![Buying](https://tethr.tomcremer.be/images/gifs/Buying.gif)  

# Edit de la carte
## Edit du style de la carte
![EditCard](https://tethr.tomcremer.be/images/gifs/EditCard.gif)  
## Edit des informations
![EditScreen](https://tethr.tomcremer.be/images/gifs/EditScreen.gif)

## Follow
![Follow](https://tethr.tomcremer.be/images/gifs/Follow.gif)

## Scan dans l'application
![ScanInApp](https://tethr.tomcremer.be/images/gifs/ScanInApp.gif)

# Le Meilleur pour la fin ! 

Le deeplink ! Cela fut compliqué de le mettre en place mais le résultat est là !  
Lorsque nous scannons un QR code, et que nous l'ourvrons dans un navigateur, nous sommes redirigé vers le profil de la personne dans l'application si elle est installé!

## Voici un exemple ⬇️
![Deeplink2](https://tethr.tomcremer.be/images/gifs/Deeplink2.gif) 

Si cela vous intéresse, voici quelques liens utiles : 
- [Google Assert Deeplink](https://developers.google.com/digital-asset-links/tools/generator?source=post_page-----5189281a7377--------------------------------)
 Trés utile pour vérifier si votre deeplink est bien configuré.
- [Flutter Deeplink](https://pub.dev/packages/app_links)
  Package utilisé pour mettre en place l'écoute du deeplink en plus de [GoRouter](https://pub.dev/packages/go_router) pour la navigation.

# Autres liens utiles
- [Create Custom Icons](https://yawarosman.medium.com/how-to-add-custom-icons-to-your-flutter-application-ea3f2ea62b9a)

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
- Fichier `google-services.json` configuré pour Firebase avec votre clé d'API (Dans le cas de `google-services.json`
  vous avez juste a remplacer la clé).
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
