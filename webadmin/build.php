```php
<?php
session_start();

if (empty($_SESSION['user'])) {
    header('Location: login.php');
    die;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['build_type'])) {
    $build_type = $_POST['build_type'];
    $build_dir = "/home/bwhos/flutter_builds/";
    $log_dir = "/home/bwhos/flutter_builds/logs/";
    $project_dir = "/var/www/html/alexai/webflutter/";

    if (!file_exists($log_dir)) {
        mkdir($log_dir, 0775, true);
    }

    $output_file = $build_type === 'alexai' ? "alexai_test.apk" : "alexai_test.apk";
    $log_file = $log_dir . $build_type . "_" . date("YmdHis") . ".log";

    $command = "cd $project_dir && flutter clean && flutter pub get && flutter build apk --release > $log_file 2>&1";
    exec($command, $output, $return_var);

    if ($return_var === 0) {
        $apk_path = $project_dir . "build/app/outputs/flutter-apk/app-release.apk";
        if (file_exists($apk_path)) {
            copy($apk_path, $build_dir . $output_file);
            $_SESSION['success'] = "Build $build_type completed successfully!";
        } else {
            $_SESSION['error'] = "Build $build_type failed: APK not found.";
        }
    } else {
        $_SESSION['error'] = "Build $build_type failed. Check log for details.";
    }

    header('Location: view/index.php');
    exit;
} else {
    $_SESSION['error'] = "Invalid request.";
    header('Location: view/index.php');
    exit;
}
