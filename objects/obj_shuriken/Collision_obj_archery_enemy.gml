// Code exécuté quand le shuriken entre en collision avec le personnage
if (other == obj_shuriken) {
    // Par exemple, infliger des dégâts ou changer l'animation du joueur
	obj_archery_enemy.state="hit";

    // Vous pouvez aussi ajouter des effets visuels ou sonores ici
    show_message("Vous avez été touché!");

    // Détruire le shuriken après la collision
    instance_destroy();
}
