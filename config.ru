require_relative './config/environment'

use Rack::MethodOverride

use EventsController
use OrganizersController
run ApplicationController
