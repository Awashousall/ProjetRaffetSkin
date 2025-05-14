<?php
// Récupérer les données JSON envoyées
$data = json_decode(file_get_contents("php://input"), true);

// Vérifier que toutes les données sont présentes
if (isset($data['nom'], $data['prenom'], $data['telephone'], $data['pays'], $data['produits'], $data['total'])) {
    // Connexion à la base de données
    try {
        // Remplacer les valeurs par les informations de ta base de données
        $pdo = new PDO('mysql:host=localhost;dbname=nom_de_la_base', 'utilisateur', 'mot_de_passe');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Préparer la requête pour insérer la commande
        $stmt = $pdo->prepare("INSERT INTO commandes (nom, prenom, telephone, pays, total) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([
            $data['nom'],
            $data['prenom'],
            $data['telephone'],
            $data['pays'],
            $data['total']
        ]);

        // Récupérer l'ID de la commande insérée
        $orderId = $pdo->lastInsertId();

        // Optionnel: Si tu veux aussi enregistrer les produits commandés dans une table séparée 'produits_commande'
        foreach ($data['produits'] as $produit) {
            $stmtProduit = $pdo->prepare("INSERT INTO produits_commande (order_id, produit_id, quantity, price) VALUES (?, ?, ?, ?)");
            $stmtProduit->execute([
                $orderId,
                $produit['id'],
                $produit['quantity'],
                $produit['price']
            ]);
        }

        // Retourner une réponse JSON indiquant que la commande a été enregistrée avec succès
        echo json_encode(['success' => true, 'orderId' => $orderId]);
    } catch (PDOException $e) {
        // En cas d'erreur avec la base de données, afficher un message d'erreur
        echo json_encode(['success' => false, 'message' => 'Erreur de base de données: ' . $e->getMessage()]);
    }
} else {
    // Si des données manquent dans la requête
    echo json_encode(['success' => false, 'message' => 'Données manquantes']);
}
?>
