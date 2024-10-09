import { Application } from "@hotwired/stimulus"

const application = Application.start()

import { Controller } from "@hotwired/stimulus"

window.Controller = Controller

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
