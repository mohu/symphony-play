<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcephilosophy_chainer extends Datasource{

		public $dsParamROOTELEMENT = 'philosophy-chainer';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'id' => '{$ds-artists}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'description'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-artists');
		}

		public function about(){
			return array(
				'name' => 'Philosophy chainer',
				'author' => array(
					'name' => 'Arthur Comben',
					'website' => 'http://sympl.dev',
					'email' => 'art@studiomohu.com'),
				'version' => '1.0',
				'release-date' => '2012-09-04T07:53:22+00:00'
			);
		}

		public function getSource(){
			return '2';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
