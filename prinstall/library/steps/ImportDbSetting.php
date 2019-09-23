<?php

class ImportDbSetting extends Step {

    public function run() {

        return $this->install
                ->query("INSERT INTO `" . DB_PREFIX . "setting` (`store_id`, `group`, `key`, `value`, `serialized`) VALUES (0, 'geoip', 'geoip_setting', 'a:5:{s:8:\"set_zone\";s:1:\"1\";s:15:\"currency_for_ru\";s:1:\"0\";s:15:\"currency_for_ua\";s:1:\"0\";s:12:\"popup_active\";s:1:\"1\";s:17:\"popup_cookie_time\";i:0;}', 1)");
    }
}
