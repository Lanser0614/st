<?php



class email extends Model
{
    public function add($data) {
        //var_dump($data);
        // $data['status'] = false;
        // $data['sort_order'] = 1;
        $this->db->query("INSERT INTO " . DB_PREFIX . "faq SET `sort_order` = '" . (int)$data['sort_order'] . "', `status` = '" . (int)$data['status'] . "', `create` = NOW()");
       // $question_id = $this->db->getLastId();
        //$this->db->query("INSERT INTO " . DB_PREFIX . "faq_description SET question_id = '" . (int)$question_id . "', language_id = '" . (int)1 . "', title = '" . $this->db->escape($data['title']) . "', phone = '" . $this->db->escape($data['phone']) . "',email = '" . $this->db->escape($data['email']) . "', username = '" . $this->db->escape($data['username']) . "'");
       // return $question_id;
    }

}
