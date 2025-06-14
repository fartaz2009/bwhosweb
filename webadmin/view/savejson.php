<?php
    session_start();
    require_once("../configuration/connection.php");

    // Helper function to validate and sanitize URL
    function buildImageUrl($path, $file) {
        $baseUrl = rtrim(str_replace("/view/index.php", "", $_SERVER['HTTP_REFERER']), "/");
        if (!$baseUrl || !filter_var($baseUrl, FILTER_VALIDATE_URL)) {
            $baseUrl = "http://192.168.88.8/alexai"; // Fallback URL
        }
        return $baseUrl . "/upload/" . $path . "/" . basename($file);
    }

    try {
        // Fetch app settings
        $query = "SELECT * FROM `app_settings`";
        $result = mysqli_query($mysqli, $query) or die(mysqli_error($mysqli));
        $master_array = [];
        $navigation_style = "";

        if (mysqli_num_rows($result) > 0) {
            foreach ($result as $val) {
                $value = json_decode($val['value']);
                if (json_last_error() !== JSON_ERROR_NONE) {
                    throw new Exception("Invalid JSON in app_settings: " . $val['key']);
                }
                $master_array[$val['key']] = $value;
                if ($val['key'] == 'appconfiguration') {
                    $navigation_style = $value->navigationStyle ?? "";
                }
            }
        }

        // Determine menu condition
        $condition = ($navigation_style == 'sidedrawer_bottom_navigation')
            ? "'" . implode("','", ['sidedrawer', 'bottom_navigation']) . "'"
            : "'$navigation_style'";

        // Fetch menu
        $menu_query = "SELECT * FROM `menu` WHERE `type` IN ($condition)";
        $menu_result = mysqli_query($mysqli, $menu_query) or die(mysqli_error($mysqli));
        $records = [];

        if (mysqli_num_rows($menu_result) > 0) {
            while ($row = mysqli_fetch_assoc($menu_result)) {
                $row['image'] = buildImageUrl("menu", $row['image']);
                $records[] = $row;
            }
            $master_array['menu_style'] = array_values(buildtree($records));
        }

        // Build tree function
        function buildtree($src_arr, $parent_id = 0, $tree = []) {
            foreach ($src_arr as $idx => $row) {
                if ($row['parent_id'] == $parent_id) {
                    $tree[$row['id']] = $row;
                    unset($src_arr[$idx]);
                    $tree[$row['id']]['children'] = array_values(buildtree($src_arr, $row['id']));
                }
            }
            ksort($tree);
            return $tree;
        }

        // Fetch left header icons
        $left_query = "SELECT * FROM `left_header_icon`";
        $left_result = mysqli_query($mysqli, $left_query) or die(mysqli_error($mysqli));
        $records = [];

        if (mysqli_num_rows($left_result) > 0) {
            while ($row = mysqli_fetch_assoc($left_result)) {
                $records[] = $row;
            }
            $master_array['header_icon']['lefticon'] = $records;
        }

        // Fetch right header icons
        $right_query = "SELECT * FROM `right_header_icon`";
        $right_result = mysqli_query($mysqli, $right_query) or die(mysqli_error($mysqli));
        $records = [];

        if (mysqli_num_rows($right_result) > 0) {
            while ($row = mysqli_fetch_assoc($right_result)) {
                $records[] = $row;
            }
            $master_array['header_icon']['righticon'] = $records;
        }

        // Fetch walkthrough
        $walkthrough_query = "SELECT * FROM `walkthrough`";
        $walkthrough_result = mysqli_query($mysqli, $walkthrough_query) or die(mysqli_error($mysqli));
        $walkthrough_records = [];

        if (mysqli_num_rows($walkthrough_result) > 0) {
            while ($row = mysqli_fetch_assoc($walkthrough_result)) {
                $row['image'] = buildImageUrl("walkthrough", $row['image']);
                $walkthrough_records[] = $row;
            }
            $master_array['walkthrough'] = $walkthrough_records;
        }

        // Fetch floating buttons
        $floating_button_query = "SELECT * FROM `floating_button`";
        $floating_button_result = mysqli_query($mysqli, $floating_button_query) or die(mysqli_error($mysqli));
        $floating_button_records = [];

        if (mysqli_num_rows($floating_button_result) > 0) {
            while ($row = mysqli_fetch_assoc($floating_button_result)) {
                $row['image'] = buildImageUrl("floatingbutton", $row['image']);
                $floating_button_records[] = $row;
            }
            $master_array['floating_button'] = $floating_button_records;
        }

        // Fetch tabs
        $tabs_query = "SELECT * FROM `tabs`";
        $tabs_result = mysqli_query($mysqli, $tabs_query) or die(mysqli_error($mysqli));
        $tabs_records = [];

        if (mysqli_num_rows($tabs_result) > 0) {
            while ($row = mysqli_fetch_assoc($tabs_result)) {
                $row['image'] = buildImageUrl("tabs", $row['image']);
                $tabs_records[] = $row;
            }
            $master_array['tabs'] = $tabs_records;
        }

        // Fetch user agent
        $user_agent_query = "SELECT * FROM `user_agent`";
        $user_agent_result = mysqli_query($mysqli, $user_agent_query) or die(mysqli_error($mysqli));
        $user_agent_records = [];

        if (mysqli_num_rows($user_agent_result) > 0) {
            while ($row = mysqli_fetch_assoc($user_agent_result)) {
                $user_agent_records[] = $row;
            }
            $master_array['user_agent'] = $user_agent_records;
        }

        // Fetch pages
        $pages_query = "SELECT * FROM `pages`";
        $pages_result = mysqli_query($mysqli, $pages_query) or die(mysqli_error($mysqli));
        $pages_records = [];

        if (mysqli_num_rows($pages_result) > 0) {
            while ($row = mysqli_fetch_assoc($pages_result)) {
                $row['image'] = buildImageUrl("pages", $row['image']);
                $pages_records[] = $row;
            }
            $master_array['pages'] = $pages_records;
        }

        // Save JSON
        if ($_SESSION['user'] != "demo@admin.com") {
            $newJsonString = json_encode($master_array, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
            if (json_last_error() !== JSON_ERROR_NONE) {
                throw new Exception("Failed to encode JSON: " . json_last_error_msg());
            }
            file_put_contents('../upload/app_config.json', $newJsonString);
            $_SESSION['success'] = "JSON updated successfully";
        } else {
            $_SESSION['error'] = "Demo User Don't have permission for this action.";
        }
    } catch (Exception $e) {
        $_SESSION['error'] = "Error: " . $e->getMessage();
    }

    header("Location: ../index.php");
    exit;
    ?>
