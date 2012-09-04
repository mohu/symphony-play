<?php
	/**
	 * @package toolkit
	 */
	/**
	 * The TextformatterManager class is responsible for managing all Text
	 * Formatter objects in Symphony. Text Formatter's are stored on the file
	 * system either in the `TEXTFORMATTERS` folder or provided by
	 * an extension in an /text-formatters/ folder. All formatters provide one
	 * simple method, run, which applies the formatting to an unformatted
	 * string and returns it.
	 */

	require_once(TOOLKIT . '/class.textformatter.php');

    Class TextformatterManager extends Manager{

		/**
		 * An array of all the objects that the Manager is responsible for.
		 * Defaults to an empty array.
		 * @var array
		 */
	    protected static $_pool = array();

		/**
		 * Given the filename of a Text Formatter return it's handle. This will remove
		 * the Symphony convention of `formatter.*.php`
		 *
		 * @param string $filename
		 *  The filename of the Text Formatter
		 * @return string
		 */
		public function __getHandleFromFilename($filename){
			return preg_replace(array('/^formatter./i', '/.php$/i'), '', $filename);
		}

        /**
		 * Given a name, returns the full class name of a Text Formatter.
		 * Text Formatters use a 'formatter' prefix.
		 *
		 * @param string $handle
		 *  The formatter handle
		 * @return string
		 */
        public function __getClassName($handle){
	        return 'formatter' . $handle;
        }

		/**
		 * Finds a Text Formatter by name by searching the `TEXTFORMATTERS` folder
		 * and in all installed extension folders and returns the path to it's folder.
		 *
		 * @param string $handle
		 *  The handle of the Text Formatter free from any Symphony conventions
		 *  such as `formatter.*.php`
		 * @return mixed
		 *  If the Text Formatter is found, the function returns the path it's folder,
		 *  otherwise false.
		 */
        public function __getClassPath($handle){
			if(is_file(TEXTFORMATTERS . "/formatter.$handle.php")) return TEXTFORMATTERS;
			else{

				$extensions = Symphony::ExtensionManager()->listInstalledHandles();

				if(is_array($extensions) && !empty($extensions)){
					foreach($extensions as $e){
						if(is_file(EXTENSIONS . "/$e/text-formatters/formatter.$handle.php")) return EXTENSIONS . "/$e/text-formatters";
					}
				}
	    	}

		    return false;
        }

		/**
		 * Given a name, return the path to the driver of the Text Formatter.
		 *
		 * @see __getClassPath()
		 * @param string $handle
		 *  The handle of the Text Formatter free from any Symphony conventions
		 *  such as `formatter.*.php`
		 * @return string
		 */
        public function __getDriverPath($handle){
	        return $this->__getClassPath($handle) . "/formatter.$handle.php";
        }

		/**
		 * Finds all available Text Formatter's by searching the `TEXTFORMATTERS` folder
		 * and in all installed extension folders. Returns an associative array of formatters.
		 *
		 * @see toolkit.Manager#about()
		 * @return array
		 *  Associative array of formatters with the key being the handle of the formatter
		 *  and the value being the text formatter's description.
		 */
        public function listAll(){

			$result = array();
	        $structure = General::listStructure(TEXTFORMATTERS, '/formatter.[\\w-]+.php/', false, 'ASC', TEXTFORMATTERS);

	        if(is_array($structure['filelist']) && !empty($structure['filelist'])){
	        	foreach($structure['filelist'] as $f){
		        	$f = $this->__getHandleFromFilename($f);
					$result[$f] = $this->about($f);
				}
			}

			$extensions = Symphony::ExtensionManager()->listInstalledHandles();

			if(is_array($extensions) && !empty($extensions)){
				foreach($extensions as $e){
					if(!is_dir(EXTENSIONS . "/$e/text-formatters")) continue;

					$tmp = General::listStructure(EXTENSIONS . "/$e/text-formatters", '/formatter.[\\w-]+.php/', false, 'ASC', EXTENSIONS . "/$e/text-formatters");

			        if(is_array($tmp['filelist']) && !empty($tmp['filelist'])){
			        	foreach($tmp['filelist'] as $f){
							$f = $this->__getHandleFromFilename($f);
							$result[$f] = $this->about($f);
						}
					}
				}
			}

			ksort($result);
			return $result;
        }

		/**
		 * Creates an instance of a given class and returns it. Adds the instance
		 * to the `$_pool` array with the key being the handle.
		 *
		 * @param string $handle
		 *  The handle of the Text Formatter to create
		 * @return TextFormatter
		 */
        public function &create($handle){

			if(!isset(self::$_pool[$handle])){
				$classname = $this->__getClassName($handle);
		        $path = $this->__getDriverPath($handle);

		        if(!is_file($path)){
					throw new Exception(
						__(
							'Could not find Text Formatter <code>%s</code>. If the Text Formatter was provided by an Extension, ensure that it is installed, and enabled.',
							array($name)
						)
					);
		        }

				if(!class_exists($classname))
					require_once($path);

				self::$_pool[$handle] = new $classname($this->_Parent);
			}

			return self::$_pool[$handle];

        }

    }