<?php
header('Content-Type: application/json');

// Enable error reporting for debugging if needed, but disable in production
ini_set('display_errors', 0);
error_reporting(E_ALL);

// Target email
$to_email = "info@mtengineering.com.pk";

// Check if request is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
    exit;
}

// Get POST data
$name = isset($_POST['name']) ? trim($_POST['name']) : '';
$email = isset($_POST['email']) ? trim($_POST['email']) : '';
$phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
$subject = isset($_POST['subject']) ? trim($_POST['subject']) : '';
$message = isset($_POST['message']) ? trim($_POST['message']) : '';

// Validation
if (empty($name) || empty($email) || empty($message)) {
    echo json_encode(['success' => false, 'message' => 'Please fill in all required fields (Name, Email, Message).']);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'Invalid email address.']);
    exit;
}

// 1. Database Logging (SQLite)
$db_file = '/home/mtengineR/leads.sqlite'; // cPanel production
if (strpos(__DIR__, 'f:') === 0 || strpos(__DIR__, 'C:') === 0) {
    $db_file = __DIR__ . '/leads.sqlite'; // Local Windows development
}

$db_success = false;

try {
    $db = new SQLite3($db_file);
    
    // Create table if not exists
    $create_table_query = "CREATE TABLE IF NOT EXISTS leads (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        phone TEXT,
        subject TEXT,
        message TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )";
    $db->exec($create_table_query);
    
    // Insert statement
    $stmt = $db->prepare("INSERT INTO leads (name, email, phone, subject, message) VALUES (:name, :email, :phone, :subject, :message)");
    $stmt->bindValue(':name', $name, SQLITE3_TEXT);
    $stmt->bindValue(':email', $email, SQLITE3_TEXT);
    $stmt->bindValue(':phone', $phone, SQLITE3_TEXT);
    $stmt->bindValue(':subject', $subject, SQLITE3_TEXT);
    $stmt->bindValue(':message', $message, SQLITE3_TEXT);
    
    $stmt->execute();
    $db->close();
    $db_success = true;
} catch (Exception $e) {
    // Database failure should not block the email sending, but we track it
    $db_error = $e->getMessage();
}

// 2. Email Sending
$email_subject = "New Website Lead: " . $subject;
$email_body = "You have received a new contact form submission from mtengineering.com.pk:\n\n";
$email_body .= "Name: $name\n";
$email_body .= "Email: $email\n";
$email_body .= "Phone: $phone\n";
$email_body .= "Subject: $subject\n\n";
$email_body .= "Message:\n$message\n\n";
$email_body .= "Date: " . date('Y-m-d H:i:s') . "\n";

$headers = "From: webmaster@mtengineering.com.pk\r\n";
$headers .= "Reply-To: $email\r\n";
$headers .= "X-Mailer: PHP/" . phpversion();

$email_success = mail($to_email, $email_subject, $email_body, $headers);

if ($email_success) {
    echo json_encode([
        'success' => true, 
        'message' => 'Thank you! Your message has been sent successfully and saved to our database.'
    ]);
} else {
    echo json_encode([
        'success' => false, 
        'message' => 'Failed to send your message. Please check the network and try again, or reach us via WhatsApp.'
    ]);
}
?>
