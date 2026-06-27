<?php

header('Content-Type: application/json');

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($uri === '/health') {
    echo json_encode(['status' => 'healthy']);
} else {
    echo json_encode(['service' => 'php-laravel', 'status' => 'running']);
}
