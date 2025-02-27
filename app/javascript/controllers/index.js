// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import { TransitionController } from "stimulus-use";
import { ClickOutsideController } from "stimulus-use";

eagerLoadControllersFrom("controllers", application);
application.register("transition", TransitionController);
application.register("click-outside", ClickOutsideController);
