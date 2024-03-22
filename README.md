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

Voici votre documentation adaptée pour refléter le nouveau flux de données, y compris l'intégration du formateur de nombres personnalisé :

## Architecture MVVM

L'application de calculatrice est structurée selon le modèle MVVM (Model-View-ViewModel), favorisant la séparation de la logique métier de l'interface utilisateur et améliorant ainsi la maintenabilité et la testabilité du code.

### Composants de l'architecture :

- **Model** : Comprend des éléments comme `CalculatorOperation` qui définissent les données et la logique métier. Le modèle `Calculator` effectue les calculs et détermine les résultats des opérations.

- **View** : `ContentView` représente la couche View, affichant l'interface utilisateur et réagissant aux interactions. Elle observe le ViewModel pour se mettre à jour en fonction de l'état actuel de la calculatrice.

- **ViewModel** : `CalculatorViewModel` sert de lien entre la View et le Model. Il gère les interactions de l'utilisateur, exécute la logique métier via le Model, et met à jour ses propriétés observables pour refléter les changements dans la View.

### Flux de données :

1. **Interaction de l'Utilisateur avec la View** : L'utilisateur interagit avec `ContentView`, qui capture les actions comme l'entrée de chiffres ou la sélection d'opérations.

2. **La View Informe le ViewModel** : `ContentView` transmet les actions de l'utilisateur à `CalculatorViewModel`.

3. **Le ViewModel Traite la Logique Métier** : `CalculatorViewModel` traite les actions, interagit avec `Calculator` pour les calculs nécessaires et utilise `NumberFormatter` pour formater les résultats.

4. **Mise à Jour du ViewModel et Réflexion dans la View** : Le `CalculatorViewModel` met à jour ses propriétés `@Published`, et grâce à la liaison de données, `ContentView` reflète ces changements, actualisant l'affichage pour l'utilisateur.

5. **Formatage des Nombres** : `NumberFormatter` est utilisé pour arrondir et formater les nombres, assurant que les résultats sont affichés de manière appropriée (par exemple, arrondissant à 5 chiffres après la virgule et évitant l'affichage de zéros superflus).

Cette structure MVVM facilite la gestion et l'évolution de l'application en isolant la logique métier et en permettant à la View de rester simple et concentrée sur la présentation.

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
