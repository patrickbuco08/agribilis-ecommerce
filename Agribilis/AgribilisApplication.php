<?php

namespace Agribilis;

use Illuminate\Foundation\Application as BaseApplication;

class AgribilisApplication extends BaseApplication
{
    /**
     * Get the path to the application "app" directory.
     *
     * @param  string  $path
     * @return string
     */
    public function path($path = '')
    {
        $appPath = $this->appPath ?: $this->basePath.DIRECTORY_SEPARATOR.'AgriBilis';

        return $appPath.($path ? DIRECTORY_SEPARATOR.$path : $path);
    }

}
