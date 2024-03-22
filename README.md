# MOB2 - Calculatrice SwiftUI

## Introduction

Cette application est une calculatrice simple développée avec SwiftUI sous l'architecture MVVM. Elle permet d'effectuer des opérations arithmétiques de base telles que l'addition, la soustraction, la multiplication et la division. Elle propose également une interface utilisateur intuitive et réactive adaptée à tous les appareils iOS.

La calculatrice a été développer avec la version 15.3 de Xcode et IOS 17.2.

## Fonctionnalités

- Opérations arithmétiques de base : addition, soustraction, multiplication, division, pourcentage.
- Supporte la saisie de nombres décimaux.
- Capacité de changer le signe d'un nombre (positif/négatif).
- Répétition de la dernière opération en appuyant sur `=`.
- Limitation à 15 chiffres pour la saisie.
- Ajustement automatique de la taille de la police pour les grands nombres.

## Architecture MVVM

Cette application est conçue en suivant le modèle d'architecture MVVM (Model-View-ViewModel), qui aide à séparer la logique métier de l'interface utilisateur, facilitant ainsi la maintenance et le test du code.

### Composants de l'architecture :

- **Model** : Définit les données et la logique métier de l'application. Dans ce projet, les modèles incluent `CalculatorOperation` qui représente une opération de calcul.

- **View** : La couche View affiche l'interface utilisateur et réagit aux interactions de l'utilisateur. Elle est définie par `ContentView`, qui utilise les données fournies par le ViewModel pour afficher l'état actuel de la calculatrice.

- **ViewModel** : `CalculatorViewModel` agit comme un intermédiaire entre le Model et la View. Il traite la logique métier et les interactions de l'utilisateur, mettant à jour l'état de l'application sans être directement lié à la couche View. Le ViewModel réagit aux actions de l'utilisateur, met à jour le modèle et modifie ses propres propriétés observables, déclenchant ainsi des mises à jour de l'interface utilisateur.

### Flux de données :

1. **Utilisateur Interagit avec la View** : L'utilisateur interagit avec `ContentView`, déclenchant des actions telles que l'entrée de chiffres ou la sélection d'opérations.

2. **View Déclenche des Actions sur le ViewModel** : `ContentView` communique avec `CalculatorViewModel` pour informer des actions de l'utilisateur.

3. **ViewModel Met à Jour le Model** : Le `CalculatorViewModel` exécute la logique métier en fonction des actions de l'utilisateur, mettant à jour les données dans `CalculatorOperation` si nécessaire.

4. **ViewModel Met à Jour la View** : Le `CalculatorViewModel` met à jour ses propriétés @Published, ce qui, grâce à la liaison de données de SwiftUI, met à jour automatiquement l'interface utilisateur dans `ContentView`.

Cette séparation des préoccupations rend le code plus modulaire, plus facile à comprendre et à tester, et améliore la réactivité de l'application en déléguant la logique métier à des composants spécialisés.

## Installation

Pour installer cette application, vous aurez besoin de Xcode installé sur votre machine macOS. Vous pouvez télécharger Xcode depuis l'App Store.

### Étapes d'installation :

1. Clonez le dépôt GitHub sur votre machine locale en utilisant la commande suivante :
   ```bash
   git clone https://github.com/YannickPerret/mob2_calculator
   ```
2. Ouvrez le fichier `Calculatrice.xcodeproj` dans Xcode.
3. Attendez que Xcode finisse d'indexer et de construire les dépendances.

## Lancement

Pour lancer l'application sur un simulateur ou un appareil réel :

1. Sélectionnez le simulateur ou l'appareil cible dans le menu déroulant en haut à gauche de la fenêtre Xcode.
2. Appuyez sur le bouton `Run` (symbole de lecture) ou utilisez le raccourci `Cmd + R`.
3. L'application démarrera dans le simulateur ou sur l'appareil choisi.

## Build

Pour créer un build de l'application :

1. Dans Xcode, allez dans `Product` > `Archive`.
2. Suivez les instructions pour archiver l'application.
3. Une fois l'archive créée, vous pouvez la distribuer via TestFlight ou l'App Store, ou l'exporter pour une installation manuelle.

## Contribution

Si vous souhaitez contribuer à ce projet, n'hésitez pas à créer une pull request ou à ouvrir un issue pour discuter des modifications ou ajouts que vous proposez.

## Licence
Ce projet est sous licence MIT. Pour plus d'informations, veuez consulter le fichier [LICENSE](https://github.com/YannickPerret/mob2_calculator/blob/3dd6fe87b397d1d6045230fe6251abd4e7b5bb8b/LICENSE).

---
