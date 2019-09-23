<?php

class ImportDbGeoIPTables extends Step {

    public function run() {

        $this->install->queryFromFile('geoip/all.sql');

        return !$this->install->getError();
    }
}
