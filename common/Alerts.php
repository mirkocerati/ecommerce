<?php

class Alerts {
    public static function success($message = "") {
        return '<div class="alertPart"><div class="alert alert-success alert-common" role="alert"><i class="tf-ion-thumbsup"></i><span>'.$message.'</span></div></div>';
    }

    public static function info($message = "") {
        return '<div class="alertPart"><div class="alert alert-info alert-common" role="alert"><i class="tf-ion-android-checkbox-outline"></i><span>'.$message.'</span></div></div>';
    }

    public static function warning($message = "") {
        return '<div class="alertPart"><div class="alert alert-warning alert-common" role="alert"><i class="tf-ion-alert-circled"></i><span>'.$message.'</span></div></div>';
    }

    public static function danger($message = "") {
        return '<div class="alertPart"><div class="alert alert-danger alert-common" role="alert"><i class="tf-ion-close-circled"></i><span>'.$message.'</span></div></div>';
    }

    public static function auto(string $message, string $type): string {
        switch(strtolower($type)) {
            case "success":
                return Alerts::success($message);
            case "warning":
                return Alerts::warning($message);
            case "danger":
                return Alerts::danger($message);
            default: return Alerts::info($message);
        }
    }

    /*public static function auto(string $message, AlertType $type)
    {
        return match($type) {
            AlertType::SUCCESS => success($message),
            AlertType::INFO => info($message),
            AlertType::WARNING => warning($message),
            AlertType::DANGER => danger($message)
        };
    }*/
}

?>