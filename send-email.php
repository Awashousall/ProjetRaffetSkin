<?php
// Inclure PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';  // Assurez-vous que le chemin est correct

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer et sécuriser les données du formulaire
    $nom = htmlspecialchars(trim($_POST['nom']));
    $prenom = htmlspecialchars(trim($_POST['prenom']));
    $email = htmlspecialchars(trim($_POST['email']));
    $panier = htmlspecialchars(trim($_POST['panier']));

    // Validation des champs
    if (empty($nom) || empty($prenom) || empty($email) || empty($panier)) {
        echo '<div style="color: red; font-weight: bold;">Tous les champs doivent être remplis.</div>';
        exit;
    }

    // Vérification du format de l'email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo '<div style="color: red; font-weight: bold;">L\'adresse email est invalide.</div>';
        exit;
    }

    // Préparer le contenu de l'email
    $to = 'awasall@esp.sn';  // Destinataire
    $subject = 'Nouvelle commande';
    $message = "
    Une nouvelle commande a été passée !\n\n
    Nom : $nom\n
    Prénom : $prenom\n
    Email : $email\n\n
    Contenu du panier :\n
    $panier
    ";

    // Créer une instance de PHPMailer
    $mail = new PHPMailer(true);
    
    try {
        // Configuration SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'awasall@esp.sn';  // Votre adresse email
        $mail->Password = 'fwsu fedo xhim aqgj';  // Votre mot de passe d'application
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Destinataire
        $mail->setFrom('noreply@tonsite.com', 'Votre Site');
        $mail->addAddress($to);

        // Contenu de l'email
        $mail->isHTML(false);
        $mail->Subject = $subject;
        $mail->Body    = $message;

        // Envoi de l'email
        $mail->send();
        
        // Message de succès avec du CSS
        echo '<div style="position: fixed; top: 0; left: 0; width: 100%; 
                    background-color: #ffe6f0; color: #d63384; 
                    text-align: center; padding: 15px; 
                    font-size: 24px; font-weight: bold; z-index: 9999;">
                Commande envoyée avec succès.
              </div>';
    } catch (Exception $e) {
        echo '<div style="color: red; font-weight: bold;">
                Erreur lors de l\'envoi de la commande : ' . $mail->ErrorInfo . '
              </div>';
    }
}
?>
