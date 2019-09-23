<?php
class ControllerExtensionModuleCoolblocks extends Controller {
	public function index($setting) {

		$data['heading_title'] = $setting['heading'];
    $data['id'] = $setting['id'];


		foreach ($setting['coolblocks'] as $coolblock) {
			$data['coolblocks'][] = array(
				'image'  => 'image/' . $coolblock['image'],
				'link'  => $coolblock['link'],
				'title'  => $coolblock['title'],
				'text' => $coolblock['text']
			);
		}

		if ($data['coolblocks']) {
			return $this->load->view('extension/module/coolblocks', $data);
		}
	}
}