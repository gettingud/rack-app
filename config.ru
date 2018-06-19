require_relative 'middleware/router'
require_relative 'middleware/params_checker'
require_relative 'app'

use Router
use ParamsChecker
run App.new
