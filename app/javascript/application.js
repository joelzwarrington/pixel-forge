import "@hotwired/turbo-rails";
import "controllers";

window.process ||= {};
window.process.env ||= {};
window.process.env.NODE_ENV = "production";
