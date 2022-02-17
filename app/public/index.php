<?php

use App\Kernel;

echo ini_set( "post_max_size", "500M");
echo ini_set( "upload_max_filesize", "500M");

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};
