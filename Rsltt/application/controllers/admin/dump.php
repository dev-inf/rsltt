<?php

class Admin_Dump_Controller extends Base_Controller {

    public function action_index() {
        Bundle::start('mysqldump-php');
        $conn = Config::get('database.connections.mysql');

        $filename = time() . ".sql";
        $filepath = "storage/work/sql/";

        $this->lc_delete($filepath);

        $dump = new MySQLDump();
        $dump->host = $conn['host'];
        $dump->user = $conn['username'];
        $dump->pass = $conn['password'];
        $dump->db = $conn['database'];
        $dump->filename = $filepath . $filename;
        $dump->start();

        return "Backup complete.";
    }
    
    public function action_restore() {
        Bundle::start('mysqldump-php');
        $conn = Config::get('database.connections.mysql');

        $filename = time() . ".sql";
        $filepath = "storage/work/sql/";

        $this->lc_delete($filepath);

        $dump = new MySQLDump();
        $dump->host = $conn['host'];
        $dump->user = $conn['username'];
        $dump->pass = $conn['password'];
        $dump->db = $conn['database'];
        $dump->filename = $filepath . $filename;
        $dump->start();

        return "Backup complete.";
    }

    private function lc_delete($targ) {
        if (is_dir($targ)) {
            $files = glob($targ . '*', GLOB_MARK); //GLOB_MARK adds a slash to directories returned
            foreach ($files as $file)
                $this->lc_delete($file);
        }
        else
            unlink($targ);
    }

}