// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.
import { application } from "./application"

import ChatroomSubscriptionController from "./chatroom_subscription_controller.js"
application.register("chatroom-subscription", ChatroomSubscriptionController)
// import { Application } from "stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"

// const application = Application.start()
// const context = require.context("controllers", true, /_controller\.js$/)
// application.load(definitionsFromContext(context))
